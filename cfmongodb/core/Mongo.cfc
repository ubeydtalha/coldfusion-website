<cfcomponent accessors="true" output="false">

	<cfproperty name="mongoConfig">
	<cfproperty name="mongoFactory">
	<cfproperty name="mongoUtil">

<cfscript>

	/**
	* Mongo is deprecated. Use MongoClient instead. The API for MongoClient matches that for Mongo, with the exception that
		MongoConfig can now take a MongoClientOptions struct.

		MongoClient rationale is here: http://blog.mongodb.org/post/36666163412/introducing-mongoclient

		Latest javadocs are here: http://api.mongodb.org/java/
	*
	*/
	function init(MongoConfig="#createObject('MongoConfig')#"){
		writeLog("Mongo is DEPRECATED! Use MongoClient instead");
		setMongoConfig(arguments.MongoConfig);
		setMongoFactory(mongoConfig.getMongoFactory());
		variables.mongo = mongofactory.getObject("com.mongodb.Mongo");
		initCollections();

		variables.mongo.init(variables.mongoConfig.getServers());
		variables.mongoUtil = new MongoUtil(mongoFactory);

		return this;
	}


	private function initCollections(){
		var dbName = getMongoConfig().getDBName();
		variables.collections = { dbName = {} };
	}

	/**
	* Authenticates connection/db with given name and password

		Typical usage:
		mongoConfig.init(...);
		mongo = new Mongo( mongoConfig );
		mongo.authenticate( username, password );

		If authentication fails, an error will be thrown
	*
	*/
	void function authenticate( string username, string password ){
		var result = {authenticated = false, error={}};
		result.authenticated = getMongoDB( variables.mongoConfig ).authenticateCommand( arguments.username, arguments.password.toCharArray() );
	}


	/**
	*  Adds a user to the database
	*/
	function addUser( string username, string password) {
		getMongoDB( variables.mongoConfig ).addUser(arguments.username, arguments.password.toCharArray());
		return this;
	}

	/**
	* Drops the database currently specified in MongoConfig
	*/
	function dropDatabase() {
		variables.mongo.dropDatabase(variables.mongoConfig.getDBName());
		return this;
	}

	/**
	* Gets a CFMongoDB DBCollection object, which wraps the java DBCollection
	*/
	function getDBCollection( collectionName, dbName=getMongoConfig().getDBName() ){
		if( not structkeyexists(variables.collections, dbName) or not structKeyExists( variables.collections[dbName], collectionName ) ){
			variables.collections[ dbName ][ collectionName ] = createObject("component", "DBCollection" ).init( collectionName, this, dbName );
		}
		return variables.collections[ dbName ][ collectionName ];
	}


	/**
	* Closes the underlying mongodb object. Once closed, you cannot perform additional mongo operations and you'll need to init a new mongo.
	  Best practice is to close mongo in your Application.cfc's onApplicationStop() method. Something like:
	  getBeanFactory().getBean("mongo").close();
	  or
	  application.mongo.close()

	  depending on how you're initializing and making mongo available to your app

	  NOTE: If you do not close your mongo object, you WILL leak connections!
	*/
	function close(){
		try{
			variables.mongo.close();
		}catch(any e){
			//the error that this throws *appears* to be harmless.
			writeLog("Error closing Mongo: " & e.message);
		}
		return this;
	}

	/**
	* Returns the last error for the current connection.
	*/
	function getLastError()
	{
		return getMongoDB().getLastError();
	}


	/**
	* Decide whether to use the MongoConfig in the variables scope, the one being passed around as arguments, or create a new one
	*/
	function getMongoConfig(mongoConfig=""){
		if(isSimpleValue(arguments.mongoConfig)){
			mongoConfig = variables.mongoConfig;
		}
		return mongoConfig;
	}

	/**
	 * Get the underlying Java driver's Mongo object
	 */
	function getMongo(){
		return variables.mongo;
	}

	/**
	 * Get the underlying Java driver's DB object
	 */
	function getMongoDB( mongoConfig="" ){
		var jMongo = getMongo(mongoConfig);
		return jMongo.getDb(getMongoConfig(mongoConfig).getDefaults().dbName);
	}

	/**
	* Deprecated. See DBCollection.findById()
	*/
	function findById( id, string collectionName ){
		return getDBCollection( collectionName ).findById( id );
	}

	/**
	* Deprecated. See DBCollection.query()
	*/
	function query(string collectionName, mongoConfig=""){
	   return getDBCollection( collectionName ).query();
	}

	/**
	* Deprecated. See DBCollection.distinct()
	*/
	function distinct( string key, string collectionName ){
		return getDBCollection( collectionName ).distinct( key );
	}

	/**
	* Deprecated. See DBCollection.findAndModify
	*/
	function findAndModify( struct query, struct fields, any sort, boolean remove=false, struct update, boolean returnNew=true, boolean upsert=false, boolean overwriteExisting=false, string collectionName ){
		return getDBCollection(collectionName).findAndModify( argumentcollection=arguments );
	}

	/**
	* Deprecated. See DBCollection.group()
	*/
	function group( collectionName, keys, initial, reduce, query, keyf="", finalize="" ){
		return getDBCollection( collectionName ).group( argumentcollection = arguments );
	}

	/**
	* Deprecated. See DBCollection.mapReduce()
	*/
	function mapReduce( collectionName, map, reduce, outputTarget, outputType="REPLACE", query, options  ){
		return getDBCollection( collectionName ).mapReduce( argumentCollection = arguments );
	}

	/**
	*  Deprecated. See DBCollection.save()
	*/
	function save( struct doc, string collectionName ){
	   return getDBCollection( collectionName ).save( doc );
	}

	/**
	* Deprecated. See DBCollection.saveAll()
	*/
	function saveAll( array docs, string collectionName ){
		return getDBCollection( collectionName ).saveAll( docs );
	}

	/**
	* Deprecated. See DBCollection.update()
	*/
	function update( doc, collectionName, query, upsert=false, multi=false, overwriteExisting=false ){
		return getDBCollection( collectionName ).update( argumentCollection=arguments );
	}

	/**
	* Deprecated. See DBCollection.remove()
	*/
	function remove(doc, collectionName ){
	  return getDBCollection( collectionName ).remove( doc );
	}

	/**
	* Deprecated. See DBCollection.removeById()
	*/
	function removeById( id, collectionName ){
		return getDBCollection( collectionName ).removeById( id );
	}


	/**
	* Deprecated. See DBCollection.ensureIndex()
	*/
	public array function ensureIndex( array fields, collectionName, unique=false ){
	 	return getDBCollection( collectionName ).ensureIndex( fields, unique );
	}

	/**
	* Deprecated. See DBCollection.ensureGeoIndex()
	*/
	public array function ensureGeoIndex( field, collectionName, min="", max="" ){
		return getDBCollection( collectionName ).ensureGeoIndex( field, min, max );
	}


	/**
	* Deprecated. See DBCollection.getIndexes()
	*/
	public array function getIndexes( collectionName ){
		return getDBCollection( collectionName ).getIndexes();
	}

	/**
	* Deprecated. See DBCollection.dropIndexes()
	*/
	public array function dropIndexes(collectionName, mongoConfig=""){
		return getDBCollection( collectionName ).dropIndexes();
	}

	/**
	* Deprecated. See DBCollection.getMongoDBCollection()
	*/
	function getMongoDBCollection( collectionName="" ){
		return getDBCollection( collectionName ).getMongoDBCollection();
	}



</cfscript>

</cfcomponent>
