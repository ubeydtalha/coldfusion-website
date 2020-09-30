<cfcomponent accessors="true" output="false">

	<cfproperty name="mongoUtil">

<cfscript>
	variables.collectionName = "";
	variables.mongo = "";

	//these are the underlying java objects
	variables.mongoDB = "";
	variables.collection = "";

	/**
	* Not intended to be invoked directly. Always fetch DBCollection objects via mongo.getDBCollection( collectionName )
	*/
	function init( collectionName, mongo, dbName ){
		structAppend( variables, arguments );
		variables.mongoUtil = mongo.getMongoUtil();
		variables.mongoConfig = mongo.getMongoConfig();

		variables.mongoDB = mongo.getMongoDB();
        if (structkeyexists(arguments,"dbName") and arguments.dbName neq variables.mongoConfig.getDBName())
            variables.mongoDB = mongo.getMongoDB().getSisterDB(arguments.dbName);

		variables.collection = mongoDB.getCollection( collectionName );

		return this;
	}

	private function toMongo( doc ){
		return mongoUtil.toMongo( doc );
	}

	private function toMongoOperation( doc ){
		return mongoUtil.toMongoOperation( doc );
	}

	private function toCF( dbObject ){
		if( isNull( dbObject ) ){
			return javacast("null","");
		}
		return mongoUtil.toCF( dbObject );
	}

	/**
	* Get the underlying Java driver's DB object
	*/
	private function getMongoDB(){
        return variables.mongoDB;
	}

	/**
	* Get the underlying Java driver's DBCollection object for the given collection
	*/
	function getMongoDBCollection(){
		return variables.collection;
	}

	function getNothing(){};

	/**
	* Returns a single document matching the passed in id (i.e. the mongo _id)

	  usage:

	  byID = collection.findById( url.personId );
	*/
	function findById( id ){
		return toCF( collection.findOne( mongoUtil.newIDCriteriaObject( id ) ) );
	}

	/**
	* Find a single document matching the given criteria.

	  usage:

	  doc = collection.findOne( {"age" = 18} );
	*/
	function findOne( struct criteria="#structNew()#" ){
		var result = collection.findOne( toMongo( criteria ) );
		if(NOT isNull(result) ){
			return toCF( result );
		}
	}

	/**
	* Find documents matching the given criteria. Returns a SearchResult object.

	  usage:

	  sort = {"NAME" = -1};
	  result = collection.find( criteria={"AGE" = {"$gt"=18}}, limit="5", sort=sort );
	  writeDump( var=result.asArray(), label="For query #result.getQuery().toString()# with sort #result.getSort().toString()#, returning #result.size()# of #result.totalCount()# documents" );
	*/
	function find( struct criteria="#structNew()#", string keys="", numeric skip=0, numeric limit=0, any sort="#structNew()#" ){
		var _keys = mongoUtil.createOrderedDBObject(arguments.keys, mongoUtil.newOperationalDBObject());
		sort = toMongoOperation( sort );
		var search_results = [];
		criteria = toMongo( criteria );
		search_results = collection.find(criteria, _keys).limit(limit).skip(skip).sort(sort);
		return createObject("component", "SearchResult").init( search_results, sort, mongoUtil );
	}

	function count( struct criteria="#structNew()#" ){
		return collection.count( toMongo(criteria) );
	}

	/**
	* Build a query object, and then execute that query using find()
	  Query returns a SearchBuilder object, which you'll call functions on.
	  Finally, you'll use various "execution" functions on the SearchBuilder to get a SearchResult object,
	  which provides useful functions for working with your results.

	  sort = {"NAME" = -1};
	  kidSearch = collection.query().between("KIDS.AGE", 2, 30).find( keys="", skip=0, limit=0, sort=sort );
	  writeDump( var=kidSearch.asArray(), label="For query #kidSearch.getQuery().toString()# with sort #kidSearch.getSort().toString()#, returning #kidSearch.size()# of #kidSearch.totalCount()# documents" );

	  See gettingstarted.cfm for many examples
	*/
	function query(){
	   return new SearchBuilder( this );
	}

	/**
	* Runs mongodb's distinct() command. Returns an array of distinct values
	*
	  distinctAges = collection.distinct( "KIDS.AGE" );

	  use query to filter results
	  collection.distinct( "KIDS.AGE", {GENDER="MALE"} )
	*/
	function distinct( string key, struct query ){
		if(structKeyExists(arguments, "query")) {
			return collection.distinct( key, toMongo(query) );
		}
		return collection.distinct( key );
	}
	/**
	* findAndModify is critical for queue-like operations. Its atomicity removes the traditional need to synchronize higher-level methods to ensure queue elements only get processed once.

	  http://www.mongodb.org/display/DOCS/findandmodify+Command

	  Your "update" doc must apply one of MongoDB's update modifiers (http://www.mongodb.org/display/DOCS/Updating#Updating-update%28%29), otherwise the found document will be overwritten with the "update" argument, and that is probably not what you want.

	*/
	function findAndModify( struct query, struct fields, struct sort, boolean remove=false, struct update, boolean returnNew=true, boolean upsert=false ){
		// Confirm our complex defaults exist; need this chunk of muck because CFBuilder 1 breaks with complex datatypes in defaults
		local.argumentDefaults = {sort={"_id"=1}, fields={}};
		for(local.k in local.argumentDefaults)
		{
			if (!structKeyExists(arguments, local.k))
			{
				arguments[local.k] = local.argumentDefaults[local.k];
			}
		}
		sort = toMongoOperation( sort );

		var updated = collection.findAndModify(
			toMongo(query),
			toMongoOperation(fields),
			sort,
			remove,
			toMongo(update),
			returnNew,
			upsert
		);
		if( isNull(updated) ) return {};

		return toCF(updated);
	}

	/**
	* Executes Mongo's group() command. Returns an array of structs.

	  usage, including optional 'query':

	  result = collection.group( "STATUS,OWNER", {TOTAL=0}, "function(obj,agg){ agg.TOTAL++; }, {SOMENUM = {"$gt" = 5}}" );

	  See examples/aggregation/group.cfm for detail
	*/
	function group( keys, initial, reduce, query, keyf="", finalize="" ){

		if (!structKeyExists(arguments, 'query'))
		{
			arguments.query = {};
		}

		var dbCommand =
			{ "group" =
				{"ns" = collectionName,
				"key" = mongoUtil.createOrderedDBObject(keys),
				"cond" = query,
				"initial" = initial,
				"$reduce" = trim(reduce),
				"finalize" = trim(finalize)
				}
			};
		if( len(trim(keyf)) ){
			structDelete(dbCommand.group,"key");
			dbCommand.group["$keyf"] = trim(keyf);
		}
		var result = mongoDB.command( toMongo(dbCommand) );

		if( NOT result['ok']){
			throw("Error message: #result['errmsg']#", "GroupException", '', '', serializeJson(result));
		}
		return result["retval"];
	}



    /**
    * Executes Mongo's aggregate() wrapper. Returns an array of structs

    * takes one or more...(N) structs as arguments, each argument is a pipeline operation
      usage:

        result = collection.aggregate(
            { "$match"={ "status"="active" } }, // include only docs with status=active
            { "$project"= { "author"=1, "sales"=1 } }, // reshape the docs to only include author and sales
            { "$group"= { "_id"="$author", "totalSales"={ "$sum"="sales" } } } // group by author, calculate total sales by summing sales.
        );

      See examples/aggregation/aggregate.cfm for detail
      See also: http://docs.mongodb.org/manual/aggregation/
    */
    public function aggregate() {
    	// WAT. the mongo java api for aggregate is, um, not ideal, which is why we split the args into two.
        var firstOp = toMongo(arguments[1]);
        var additionalOps = [];

		for( var i = 2; i LTE arrayLen(arguments); i++ ){
			arrayAppend(additionalOps, toMongo(arguments[i]) );
		}

		var output = collection.aggregate( firstOp, additionalOps );
        return new AggregationResult( output, mongoUtil );
    }


	/**
	* Executes Mongo's mapReduce command. Returns a MapReduceResult object

	  basic usage:

	  result = collection.mapReduce( map=map, reduce=reduce, outputTarget="YourResultsCollection" );


	  See examples/aggregation/mapReduce for detail
	*/
	function mapReduce( map, reduce, outputTarget, outputType="REPLACE", query, options  ){

		// Confirm our complex defaults exist; need this hunk of muck because CFBuilder 1 breaks with complex datatypes as defaults
		var argumentDefaults = {
			 query={}
			,options={}
		};
		var k = "";
		for(k in argumentDefaults) {
			if (!structKeyExists(arguments, k))
			{
				arguments[k] = local.argumentDefaults[k];
			}
		}

		var optionDefaults = {"sort"={}, "limit"="", "scope"={}, "verbose"=true};
		structAppend( optionDefaults, arguments.options );
		if( structKeyExists(optionDefaults, "finalize") ){
			optionDefaults.finalize = trim(optionDefaults.finalize);
		}

		var out = {"#lcase(outputType)#" = outputTarget};
		if(outputType eq "inline"){
			out = {"inline" = 1};
		} else if (outputType eq "replace") {
			out = outputTarget;
		}

		var dbCommand = mongoUtil.createOrderedDBObject(
			[
				{"mapreduce"=collectionName}, {"map"=trim(map)}, {"reduce"=trim(reduce)}, {"query"=query}, {"out"=out}
			] );

		dbCommand.putAll(optionDefaults);
		var commandResult = mongoDB.command( dbCommand );

		if( NOT commandResult['ok'] ){
			throw("Error Message: #commandResult['errmsg']#:", "MapReduceException", '', '', serializeJson(commandResult));
		}

		var mrCollection = mongo.getDBCollection( commandResult["result"] );
		var searchResult = mrCollection.query().find();
		var mapReduceResult = createObject("component", "MapReduceResult").init(dbCommand, commandResult, searchResult, mongoUtil);
		return mapReduceResult;
	}

	/**
	* Inserts a struct into the collection
	*/
	function insert( struct doc ){
		var dbObject =  toMongo(doc);
		collection.insert( [dbObject] );
		doc["_id"] =  dbObject.get("_id");
		return doc["_id"];
	}

	/**
	*  Saves a struct into the collection; Returns the newly-saved Document's _id; populates the struct with that _id

		person = {name="bill", badmofo=true};
		collection.save( person );
	*/
	function save( struct doc ){
	   if( structKeyExists(doc, "_id") ){
	       update( doc = doc );
		   return doc["_id"];
	   } else {
	   	   return this.insert( doc );
	   }
	}

	/**
	* Saves an array of structs into the collection. Can also save an array of pre-created CFBasicDBObjects

		people = [{name="bill", badmofo=true}, {name="marc", badmofo=true}];
		collection.saveAll( people );
	*/
	function saveAll( array docs ){
		if( arrayIsEmpty(docs) ) return docs;

		var i = 1;
		if( mongoUtil.isCFBasicDBObject( docs[1] ) ){
			collection.insert( docs );
		} else {
			var total = arrayLen(docs);
			var allDocs = [];
			for( i=1; i LTE total; i++ ){
				arrayAppend( allDocs, toMongo(docs[i]) );
			}
			collection.insert(allDocs);
		}
		return docs;
	}

	/**
	* Updates a document in the collection.

	NOTE: This function signature *differs* from the mongo shell signature in one important way:

	mongo shell: update( query, doc, upsert, multi )
	cfmongodb:   update( doc, query, upsert, multi )

	The reason is that this enables more ColdFusion-idiomatic updating, in that we can pass in a single document argument without using named parameters. For example:

	The "doc" argument will either be an existing Mongo document to be updated based on its _id, or it will be a document that will be "applied" to any documents that match the "query" argument

	To update a single existing document, simply pass that document and update() will update the document by its _id, overwriting the existing document with the doc argument:
	 person = person.findById(url.id);
	 person.something = "something else";
	 collection.update( person );

	To update a document by a criteria query and have the "doc" argument applied to a single found instance:
	update =  { "set" = {STATUS = "running"} };
	query = {STATUS = "pending"};
	collection.update( update, query );

	To update multiple documents by a criteria query and have the "doc" argument applied to all matching instances, pass multi=true
	collection.update( update, query, false, false )

	Pass upsert=true to create a document if no documents are found that match the query criteria

	*/

	function update( doc, query, upsert=false, multi=false ){

		if ( !structKeyExists(arguments, 'query') ){
			arguments.query = {};
		}

	   if( structIsEmpty(query) ){
		  query = mongoUtil.newIDCriteriaObject(doc['_id'].toString());
		  var dbo = toMongo(doc);
	   } else{
	   	  query = toMongo(query);
		  var keys = structKeyList(doc);
	   }
	   var dbo = toMongo(doc);
	   collection.update( query, dbo, upsert, multi );
	}

	/**
	* Remove one or more documents from the collection.

	  If the document has an "_id", this will remove that single document by its _id.

	  Otherwise, "doc" is treated as a "criteria" object. For example, if doc is {STATUS="complete"}, then all documents matching that criteria would be removed.

	  pass an empty struct to remove everything from the collection: collection.remove( {} );
	*/
	function remove( doc ){
		if( structKeyExists(doc, "_id") ){
			return removeById( doc["_id"] );
		}
	   var dbo = toMongo(doc);
	   var writeResult = collection.remove( dbo );
	   return writeResult;
	}

	/**
	* Convenience for removing a document from the collection by the String representation of its ObjectId

		collection.removeById( url.id );
	*/
	function removeById( id ){
		return collection.remove( mongoUtil.newIDCriteriaObject(id) );
	}

	/**
	* drops this collection
	*/
	function drop(){
		collection.drop();
	}

	/**
	* The array of fields can either be
	a) an array of field names. The sort direction will be "1"
	b) an array of structs in the form of fieldname=direction. Eg:

	[
		{lastname=1},
		{dob=-1}
	]

	*/
	public array function ensureIndex(array fields, unique=false, dropDups=false, sparse=false, background=false, name ){
	 	var pos = 1;
	 	var doc = [];
	 	var options = {};
		var indexName = "";
		var fieldName = "";

	 	for( pos = 1; pos LTE arrayLen(fields); pos++ ){
			if( isSimpleValue(fields[pos]) ){
				fieldName = fields[pos];
				arrayappend(doc,{"#fieldName#"=1});
			} else {
				fieldName = structKeyList(fields[pos]);
				arrayappend(doc,{"#fieldName#"=fields[pos][fieldName]});
			}
			indexName = listAppend( indexName, fieldName, "_");
	 	}

	 	if(isNull(arguments.name)) indexName = "_#indexName#_";
	 	else indexName = arguments.name;

		options = { "unique" = unique, "name" = indexName, "dropDups" = dropDups, "sparse" = sparse, "background" = background};
	 	collection.ensureIndex( mongoUtil.createOrderedDBObject( doc ), toMongo( options ) );

	 	return getIndexes(collectionName, mongoConfig);
	}

	/**
	* Ensures a "2d" index on a single field. If another 2d index exists on the same collection, this will error
	*/
	public array function ensureGeoIndex( field, min="", max="" ){
		var doc = { "#arguments.field#" = "2d" };
		var options = {};
		if( isNumeric(arguments.min) and isNumeric(arguments.max) ){
			options = {"min" = arguments.min, "max" = arguments.max};
		}
		collection.ensureIndex( toMongo(doc), toMongo(options) );
		return getIndexes( collectionName, mongoConfig );
	}

	/**
	* Returns an array with information about all of the indexes for the collection
	*/
	public array function getIndexes(){
		return collection.getIndexInfo().toArray();
	}

	/**
	* Drops all indexes from the collection
	*/
	public array function dropIndexes(){
		collection.dropIndexes();
		return getIndexes();
	}


</cfscript>
</cfcomponent>