component output="false" accessors="true" extends="Mongo" {

	/**
	* You can init CFMongoDB in two ways:
	   1) drop the included jars into your CF's lib path (restart CF)
	   2) use Mark Mandel's javaloader (included). You needn't restart CF)

	   --1: putting the jars into CF's lib path
		mongoConfig = createObject('component','cfmongodb.core.MongoConfig').init(dbName="mongorocks");
		mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig);

	   --2: using javaloader
		javaloaderFactory = createObject('component','cfmongodb.core.JavaloaderFactory').init();
		mongoConfig = createObject('component','cfmongodb.core.MongoConfig').init(dbName="mongorocks", mongoFactory=javaloaderFactory);
		mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig);

	  Note that authentication credentials, if set in MongoConfig, will be used to authenticate against the database.
	*
	*/
	function init(MongoConfig="#createObject('MongoConfig')#"){
		setMongoConfig(arguments.MongoConfig);
		setMongoFactory(mongoConfig.getMongoFactory());
		setMongoUtil(new MongoUtil(mongoFactory));
		variables.mongo = mongofactory.getObject("com.mongodb.MongoClient");
		initCollections();
		variables.mongo.init( variables.mongoConfig.getServers(), mongoConfig.getMongoClientOptions() );

		return this;
	}

}