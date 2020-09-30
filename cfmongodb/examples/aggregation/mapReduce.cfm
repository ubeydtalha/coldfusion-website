<!---run load.cfm to get the data that this group() will use! Note that it is entirely fake/random data.--->
<!--- pass forceLoad=true in the URL to force new data --->
<cfinclude template="load.cfm">

<cfinclude template="../initMongo.cfm">


<cfscript>
	collectionName = "tasks";
	dbCol = mongo.getDBCollection( collectionName );

	mapReduceOutputCollectionName = "MapReduceExample";

	u = mongo.getMongoUtil();

	map = "
		function(){
			emit(this.STATUS, 1);
		}
	";

	reduce = "
		function(key, emits){
			var total = 0;
			for( var i in emits ){
				total += emits[i];
			}
			return total;
		}
	";

	//does nothing... here simply to show how you would pass a finalize function using dbCommand, which you couldn't do with the basic Java mapReduce signature
	finalize = "function( key, value ){ return value }";

	//#1 use CFMongoDB
	result = dbCol.mapReduce( map=map, reduce=reduce, outputTarget="#mapReduceOutputCollectionName#" );

	writeOutput("<h1>CFMongoDB dbCollection.mapReduce()</h1>");
	writeOutput("<h2>The MapReduceResult object. Expand it for all the goodies</h2>");
	writeDump(var=result.getDbCommand(), label="mongo.cfc DbCommand", expand="false");
	writeDump(var=result.getCommandResult(), label="mongo.cfc CommandResult", expand="false");

	writeOutput("<h2>MapReduceResult.asArray()</h2>");
	writeDump(var=result.asArray(), label="mapReduceResult.asArray() over collection #result.getMapReduceCollectionName()#");
	writeOutput("<hr>");

	//#1.5: perform additional queries against the MapReduce collection
	mrCol = mongo.getDBCollection( mapReduceOutputCollectionName );
	filteredResult = mrCol.query().$gt("value",10).find(limit=2, sort={"value"=-1});
	result.setSearchResult( filteredResult );

	writeOutput("<h1>Perform additional searches on the CFMongoDB MapReduce result</h1>");
	writeOutput("<h2>The query against the new MapReduce collection</h2>");
	writeDump( var=result.getQuery() );
	writeOutput("<h2>The results, limiting to 2 and sorting by 'value' desc</h2>");
	writeDump( var=result.asArray() );

	writeOutput("<hr>");

	//#2: try it using a command instead of the driver's mapReduce function
	//have to use the "ordered" stuff here because if we do straight struct creation, CF will order them
	//indeterminantly. MongoDB, for whatever reason, uses the first key as the command name (as opposed to "command" = "mapreduce", which would be infinitely more sensible)
	dbCommand = u.createOrderedDBObject( [ {"mapreduce"="tasks"}, {"map"=map}, {"reduce"=reduce}, {"finalize"=finalize}, {"verbose" = true}, {"out" = "#mapReduceOutputCollectionName#"} ] );
	result = mongo.getMongoDB().command( dbCommand );

	//now use a normal cfmongodb query to search the tmp collection created by mapreduce
	mrCol = mongo.getDBCollection( mapReduceOutputCollectionName );
	searchResult = mrCol.query().find();

	writeOutput("<h1>Java getMongoDB().command()</h1>");
	writeOutput("<h2>The command object</h2>");
	writeDump(var=dbCommand, expand=false);

	writeOutput("<h2>The result of .command()</h2>");
	writeDump(var=result, expand=false);
	writeOutput("<h2>Passing the result's temp collection name through CFMongoDB.query().find()</h2>");
	writeDump(var=searchResult.asArray(), expand=false);
	writeOutput("<hr>");

	//#3: now use the java driver's minimal signature
	jResult = dbCol.getMongoDBCollection().mapReduce(map, reduce, "#mapReduceOutputCollectionName#", javacast("null",""));

	//use a little trick... fill up a SearchResult object with this M/R's cursor
	mrSearchResult = createObject("cfmongodb.core.SearchResult").init(jResult.results(),{},u);
	writeOutput("<h1>Java Driver's built-in, minimal mapReduce</h1>");
	writeOutput("<h2>The Java driver's MapReduceOutput object</h2>");
	writeDump(var=jResult, expand=false);
	writeOutput("<h2>Passing that object's results() function to a new cfmongodb SearchResult object </h2>");
	writeDump(var=mrSearchResult.asArray(), expand=false);
	writeOutput("<hr>");

	//#4: now use the java driver's smaller but more flexible signature, which takes a Command, letting you pass in all the stuff that you could pass from the shell
	jResult2 = dbCol.getMongoDBCollection().mapReduce( dbCommand );
	mrSearchResult = createObject("cfmongodb.core.SearchResult").init(jResult2.results(),{},u);
	writeOutput("<h1>Java Driver's built-in, full mapReduce, which takes a BasicDBObject command</h1>");
	writeOutput("<h2>The Java driver's MapReduceOutput object</h2>");
	writedump(jResult2);
	writeOutput("<h2>Passing that object's results() function to a new cfmongodb SearchResult object </h2>");
	writeDump(mrSearchResult.asArray());
</cfscript>

<cfset mongo.close()>
