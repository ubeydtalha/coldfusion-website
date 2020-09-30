<!---
NOTE: a number of these unit tests run ensureIndex(). This is because Marc likes to run mongo with --notablescan during development, and queries
against unindexed fields will fail, thus throwing off the tests.

You should absolutely NOT run an ensureIndex on your columns every time you run a query!

 --->
<cfcomponent output="false" extends="BaseTestCase">
<cfscript>
import cfmongodb.core.*;


	function setUp(){
		col = 'people';
		dbCol = mongo.getDBCollection( col );
		atomicCol = 'atomictests';
		deleteCol = 'deletetests';

		super.setUp();
	}


	function mongo_can_list_commands_via_mongo_driver(){
		var result = mongo.getMongoDB().command("listCommands");
		//debug(result);
		assertTrue( structKeyExists(result, "commands") );
		//NOTE: this is not a true CF struct, but a regular java hashmap; consequently, it is case sensitive!
		assertTrue( structCount(result["commands"]) GT 1);
	}

	function mongo_can_list_collections(){
		var jMongoDB = mongo.getMongoDB();
		var collections = jMongoDB.getCollectionNames();
		//debug(collections);
		//debug(collections.toString());
		assertTrue( collections.size() GT 0 );
	}

	function mongoOptions_should_be_available(){
		var options = mongo.getMongo().getMongoOptions();
		//debug(mongo.getMongo());
		//debug(mongo.getMongo().toString());

		debug(options);
		debug(options.toString());
		options.socketTimeout=1000;
		debug(options.toString());
	}

	function mongoClientOptions_should_set_in_constructor(){
		var factory = getMongoConfig().getMongoFactory();

		//create a new config and mongoclient
		var options = {
			connectionsPerHost = 555,
			connectTimeout = 9999,
			description = "CFMongoDB MongoClientTest"
		};
		var config = createObject('component', 'cfmongodb.core.MongoConfig').init(dbName=variables.dbName, mongoFactory=factory, mongoClientOptions=options);
		var mongoWithOptions = createObject('component','cfmongodb.core.MongoClient').init(config);

		var opts = mongoWithOptions.getMongo().getMongoOptions();
		debug(opts);
		assertEquals(options.connectionsPerHost, opts.connectionsPerHost);
		assertEquals(options.connectTimeout, opts.connectTimeout);
		assertEquals(options.description, opts.description);
	}

	private function getIndexesFailOverride(){
		throw("authentication failed");
	}


	/** test java getters */
	function testGetMongo(){
	  assertIsTypeOf( mongo, "cfmongodb.core.MongoClient" );
	}

	function getMongo_should_return_underlying_java_Mongo(){
		var jMongo = mongo.getMongo();
		assertEquals("com.mongodb.MongoClient",jMongo.getClass().getCanonicalName());
	}

	function getMongoDB_should_return_underlying_java_MongoDB(){

		var jMongoDB = mongo.getMongoDB(mongoConfig);
		assertEquals("com.mongodb.DBApiLayer",jMongoDB.getClass().getCanonicalName());
	}

	/** dumping grounnd for proof of concept tests */

	function poc_profiling(){
		var u = mongo.getMongoUtil();
		var command = u.toMongo({"profile"=2});
		var result = mongo.getMongoDB().command( command );
		//debug(result);

		var result = mongo.query("system.profile").find(limit=50,sort={"ts"=-1}).asArray();
		//debug(result);

		command = u.toMongo({"profile"=0});
		result = mongo.getMongoDB().command( command );
		//debug(result);
	}

	private function flush(){
		//forces mongo to flush
		mongo.getMongoDB().getLastError();
	}

	function newDBObject_should_be_acceptably_fast(){
		var i = 1;
		var count = 500;
		var expectedTime = 200;
		var u = mongo.getMongoUtil();
		var st = {string="string",number=1,float=1.5,date=now(),boolean=true};
		//get the first one out of its system
		var dbo = u.toMongo( st );
		var startTS = getTickCount();
		for(i=1; i LTE count; i++){
			dbo = u.toMongo( st );
		}
		var total = getTickCount() - startTS;
		assertTrue( total lt expectedTime, "total to create #count# objects should be acceptably fast (#expectedTime#) but was #total#" );
	}

	function newDBObject_should_create_correct_datatypes(){
		var origNums = mongo.query( col ).$eq("number", types.number).count();
		var origNestedNums = mongo.query( col ).$eq("types.number", types.number).count();
		var origBool = mongo.query( col ).$eq("israd", true).count();
		var origNestedBool = mongo.query( col ).$eq("types.israd", true).count();
		var origFloats = mongo.query( col ).$eq("floats",1.3).count();
		var origNestedFloats = mongo.query( col ).$eq("types.floats",1.3).count();
		var origString = mongo.query( col ).$eq("address.street", "123 big top lane").count();

		mongo.save( doc, col );

		var newNums = mongo.query( col ).$eq("number", types.number).count();
		var newNestedNums = mongo.query( col ).$eq("types.number", types.number).count();
		var newBool = mongo.query( col ).$eq("israd", true).count();
		var newNestedBool = mongo.query( col ).$eq("types.israd", true).count();
		var newFloats = mongo.query( col ).$eq("floats",1.3).count();
		var newNestedFloats = mongo.query( col ).$eq("types.floats",1.3).count();
		var newString = mongo.query( col ).$eq("address.street", "123 big top lane").count();


		assertEquals( origNums+1, newNums );
		assertEquals( origNestedNums+1, newNestedNums );
		assertEquals( origBool+1, newBool );
		assertEquals( origNestedBool+1, newNestedBool );
		assertEquals( origFloats+1, newFloats );
		assertEquals( origNestedFloats+1, newNestedFloats );
		assertEquals( origString+1, newString );

		debug(doc);
		var fetched = dbCol.findById( doc._id );
		debug(fetched);

		/*assertEquals( doc["types"]["floats"], fetched["types"]["floats"] );
		assertEquals( doc.negativeFloat, fetched.negativeFloat, "negativeFloat should be equal" );
		assertEquals( doc.positiveFloat, fetched.positiveFloat, "positiveFloat should be equal" );*/
		assertEquals( doc, fetched );
	}

	/**
	*	Confirm getLastError works and mongo has not changed its response when we use an Unacknowledged WriteConcern.
	*/
	function getLastError_should_return_error_when_WriteConcern_Unacknowledged()
	{
		var unacknowledged = mongoConfig.getMongoFactory().getObject("com.mongodb.WriteConcern").UNACKNOWLEDGED;
		var options = {
			writeConcern = unacknowledged
		};
		var config = createObject('component', 'cfmongodb.core.MongoConfig').init(dbName=variables.dbName, mongoFactory=mongoConfig.getMongoFactory(), mongoClientOptions=options);
		variables.mongo = createObject('component','cfmongodb.core.MongoClient').init(config);

		causeServerError();

		// Get the result of the last activity
		local.lastActivity = mongo.getLastError();

		// Confirm we did try to duplicate an id.
		assert(
			 structKeyExists(local.lastActivity,'code')
			,'Mongo should be upset a record was duplicated. Check the test.'
		);
	}

	/**
	* @mxunit:expectedException com.mongodb.MongoException$DuplicateKey
	*/
	function server_should_error_when_WriteConcern_default(){
		causeServerError();
	}

	function whatsUpWithCFBasicDBObject(){
		var dude = {name="TheDude", abides=true, age=100};
		var dboDude = mongo.getMongoUtil().toMongo( dude );
		var mongoDBO = mongoConfig.getMongoFactory().getObject("com.mongodb.BasicDBObject");
		mongoDBO.putAll(dude);
		debug( isStruct(dboDude) );
		debug( isObject(dboDude) );
		debug( getMetadata(dboDude).getSimpleName() );


		debug( dude.toString() );
		debug( mongoDBO.toString() );
		debug( dboDude.toString() );
	}

	private function causeServerError(){
		var jColl = mongo.getMongoDBCollection(col, mongoConfig);
		var mongoUtil = mongo.getMongoUtil();

		// Create people to steal an id from
		createPeople();

		// Get the result of the last activity from CreatePeople()
		local.lastActivity = mongo.getLastError();
		assertFalse( structKeyExists(local.lastActivity, "code"), "code key should not exist when no error is present");

		local.peeps = mongo.query(collectionName=col).find(limit="1").asArray();
		assertFalse(
			arrayIsEmpty(local.peeps)
			,'Some people should have been returned.'
		);


		// Let's duplicate the record.
		local.person = local.peeps[1];
		jColl.insert([mongoUtil.toMongo(local.person)]);
	}

	private function howToDoSSL(){
		mongo.getMongo().getMongoOptions().socketFactory = createObject("java", "javax.net.ssl.SSLSocketFactory").getDefault();
	}

 </cfscript>

</cfcomponent>

