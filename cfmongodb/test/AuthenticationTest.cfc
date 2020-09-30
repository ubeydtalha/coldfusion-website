<!---
Original Author:		Ciarán Archer

Desc:       Set of MXUnit tests to verify Mongo.cfc authentication functionality
			works.

			Note: presumes that mongod was started with --auth, BUT we don't run tests against an authenticated mongod. Consequently,
			we have to mock these behaviors and test that *our* code responds against what we currently know to be MongoDB's behavior
			when running a DB in auth mode

			If you run these tests with --auth, they will no doubt fail

			More info here: http://www.mongodb.org/display/DOCS/Security+and+Authentication

--->

<!---


WHERE I AM with these tests

1) need to add a user to admin.system.users or do whatever it takes to see what actually happens when an authenticated attempt fails due to not being authed
2) spoof the query() function to throw a similar error
3) have mongo.init() check for authentication required and work that into authenticate()
4) get these tests testing that behavior.

NOTE: to get this working:

use admin
db.addUser("one","one")

then attempted to query against it

 --->

<cfcomponent output="false" extends="BaseTestCase">
<cfscript>
	import cfmongodb.core.*;

	variables.testDatabase = "cfmongodb_auth_tests";
	variables.testCollection = "authtests";

	function beforeTests(){
		 mongoConfig = getMongoConfig( variables.testDatabase );
		 mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig);
	}

	function authentication_should_error_when_authentication_fails() {

		var mongo = createObject('component','cfmongodb.core.MongoClient');
		//we entirely spoof the authentication internals
		injectMethod(mongo, this, "authenticateOverride", "authenticate");
		expectException("com.mongodb.CommandResult$CommandFailure");
		mongo.init(mongoConfig);
		var authResult = mongo.authenticate( "username", "verysecurepassword!" );
		//debug(authResult);
	}

	function authentication_should_not_error_when_authentication_passes() {
		var mongo = createObject('component','cfmongodb.core.MongoClient');
		injectMethod(mongo, this, "authenticateSuccessOverride", "authenticate");

		mongo.init(mongoConfig);
		mongo.authenticate( "username", "verysecurepassword!" );
	}

	function tearDown(){

		var mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig);
		try{
			mongo.dropDatabase();
		}catch(any e){
			debug("error dropping database");
			debug(e);
		}

		//close connection
		mongo.close();

	}

	private function authenticateOverride(){
		throw(message='command failed [command failed [authenticate] { "errmsg" : "auth fails" , "ok" : 0.0}', type="com.mongodb.CommandResult$CommandFailure");
	}
	private function authenticateSuccessOverride(){  }


</cfscript>
</cfcomponent>

