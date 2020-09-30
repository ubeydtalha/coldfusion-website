<cfcomponent output="false" extends="mxunit.framework.TestCase">



	<cfset dbName = "cfmongodb_tests">
	<cfset factoryType = "cfmongodb.core.JavaloaderFactory">

	<!--- will be created by commonBeforeTests and closed by commonAfterTests --->
	<cfset mongo = "">

	<cffunction name="beforeTests">
		<cfset mongoConfig = getMongoConfig()>
		<cfset variables.mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig)>
	</cffunction>

	<cffunction name="afterTests">
		<cfset variables.mongo.close()>
	</cffunction>

	<cffunction name="setUp">
		<cfscript>
		variables.types = {
			'number' = 100,
			'negativefloat' = -987.097654,
			'positivefloat' = 9654.5555555,
			'five_one' = 5.1,
			'point_nine' = .9,
			'israd' = true,
			'stringwithnum' = 'string ending with 1',
			'numbers' = [1,2,3],
			'booleans' = [true, false],
			'floats' = [1.3,2.5987,-148.27654]
		};

		variables.doc = {
		    'name'='unittest',
		    'address' =  {
		       'street'='123 big top lane',
		       'city'='anytowne',
		       'state'='??',
		       'country'='USA'
		    },
		    'favorite-foods'=['popcicles','hot-dogs','ice-cream','cotton candy'],
			'types' = types
		  };
		structAppend( doc, types );
        </cfscript>

	</cffunction>

	<cffunction name="tearDown">
		<cfset var delete = {"name"="unittest"}>
		<!--- the different tests will define "dbCol" --->
		<cfif isDefined("dbCol")>
			<cfset dbCol.remove(delete)>
		</cfif>
	</cffunction>

	<cffunction name="getMongoConfig" access="private">
		<cfargument name="dbName" default="#variables.dbName#">

		<cfset var factory = createObject('component', factoryType).init()>
		<cfreturn createObject('component', 'cfmongodb.core.MongoConfig').init(dbName=arguments.dbName, mongoFactory=factory)>
	</cffunction>

	<cffunction name='thisTestUsesCorrectFactory'>
		<!---<cfset debug( factoryType )>
		<cfset debug( getMetadata(mongoConfig.getMongoFactory()).fullName )>--->
		<cfset assertEquals( factoryType, getMetadata(mongoConfig.getMongoFactory()).fullName )>
	</cffunction>

	<cffunction name="createPeople" access="private" returntype="Array" output="false">
		<cfargument name="count" type="numeric" required="false" default="5"/>
		<cfargument name="save" type="boolean" required="false" default="true"/>
		<cfargument name="name" type="string" required="false" default="unittest"/>
		<cfargument name="stringTest" type="boolean" required="false" default="false" />
		<cfscript>
		var i = 1;
		var people = [];
		for(i = 1; i LTE count; i++){
			var person = {
				"name"=name,
				"age"=randRange(10,100),
				"now"=getTickCount(),
				"networth"=randRange(10,100) * 7.25,
				"counter"=i,
				inprocess=false
			};
			if (arguments.stringTest) {
				person["ageAsString"] = mongo.getMongoUtil().asString(person["age"]);
				person["networthAsString"] = mongo.getMongoUtil().asString(person["networth"]);
				person["counterAsString"] = mongo.getMongoUtil().asString(person["counter"]);
			}
			arrayAppend(people, person);
		}
		if(save){
			mongo.saveAll(people, col);
		}
		return people;
        </cfscript>

	</cffunction>

</cfcomponent>