<!---
How I set up this test:

1) created two directories named "node1" and "node2" in c:\data\replsetdbs. I didn't want the data directory in the typical data\db directory, for sanity
2) started two instances of mongod. For this test, I used the same machine (host name) but two different ports.

> mongod --dbpath c:\data\replsetdbs\node1 --port 10001 --replSet testrepl/marc-pc:10002
> mongod --dbpath c:\data\replsetdbs\node2 --port 10002 --replSet testrepl/marc-pc:10001
> mongod --dbpath c:\data\replsetdbs\node3 --port 10003 --replSet testrepl/marc-pc:10001

3) add those two replset members. To do this, I started up a mongo shell pointing at the first replset member, i.e. marc-pc:10001. Then, I ran this command:

db.runCommand(
	{
		"replSetInitiate" : {
			"_id" : "testrepl",
			"members" : [
				{
					"_id" : 1,
					"host" : "marc-pc:10001"
				},
				{
					"_id" : 2,
					"host" : "marc-pc:10002"
				},
				{
					"_id" : 3,
					"host" : "marc-pc:10003"
				}
			]
		}
	}
)
 --->

<!---
NOTE: In a real environment, DO NOT create javaLoaderFactory objects every time! Suggested javaloader behavior is to create an instance in the
server scope, or at the least in the application scope. The other examples that ship with cfmongodb use the Application scope, but it's preferable
to do something like:

if( not( structKeyExists(server, "javaloader_YourUniqueAppName") ) ){
	var javaloaderFactory = createObject('component','cfmongodb.core.JavaloaderFactory').init();
	server["javaloader_YourUniqueAppName"] = javaloaderFactory;
}

This will put the cfmongodb javaloaderFactory object into the serverscope, which will have the result of also putting its instance of javaloader
itself into the server scope.

Alternately, you can not use javaloaderFactory and use the default factory, which will require you to put the mongo and cfmongodb jars in your CF classpath
 --->

<cfset javaloaderFactory = createObject('component','cfmongodb.core.JavaloaderFactory').init()>

<cfset hosts = [
	{serverName = 'marc-pc', serverPort = 10001}
	, {serverName = 'marc-pc', serverPort = 10002}
	, {serverName = 'marc-pc', serverPort = 10003}
]>

<cfset mongoConfig = createObject('component', 'cfmongodb.core.MongoConfig').init(
	hosts = hosts,
	dbname = "replSetTest",
	mongoFactory = javaloaderFactory
)>

<cfset mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig)>

<cfset people = mongo.getDBCollection("people")>

<cfset luckyGuy = {"name"="Marc_#getTickCount()#", "bottlesofscotch"=randRange(2,200), "stogie"="Rocky Patel", "ts"=now()}>
<cfset luckierGuy = {"name"="Marc_#getTickCount()#", "wife"="Heather", "kids"=["Lexie","Sidney"],  "bottlesofdamngoodscotch"=5, "stogie"="Padron", "ts"=now()}>
<cfset people.saveAll( [luckyGuy, luckierGuy] )>

<cfset fetched = people.find(sort="_id=-1")>

<cfdump var="#fetched.asArray()#" top="10">

<cfset mongo.close()>