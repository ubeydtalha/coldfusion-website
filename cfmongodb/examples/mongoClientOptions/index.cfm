<h1>Configuring MongoClient with MongoClientOptions</h1>

<p>You can configure the MongoClient object with a mongoClientOptions struct. See the latest <a href="http://api.mongodb.org/java/">Java Driver API</a> for all settable properties. Specifically, look at MongoClientOptions.Builder</p>
<p>The MongoClientOptions.Builder exposes methods such as "autoConnectRetry(boolean autoConnectRetry)". You'll set those as simple key/value pairs in a struct, and CFMongoDB will translate those into the appropriate method calls.</p>
<p>Look at the code for this page to see how these options are set. Look at the "Fields" below to see the values for these options in the Mongo.MongoOptions object</p>
<cfset factory = createObject('component','cfmongodb.core.JavaloaderFactory').init()>

<!---Use the legacy "Unacknowledged" WriteConcern which will not report server errors, only network errors --->

<cfset options = {
	connectTimeout = 999,
	description = "My CFMongoDB App",
	socketTimeout = 20,
	writeConcern = factory.getObject("com.mongodb.WriteConcern").UNACKNOWLEDGED
}>
<cfset mongoConfig = createObject('component', 'cfmongodb.core.MongoConfig').init(
	dbname = "mongorocks",
	mongoFactory = factory,
	mongoClientOptions = options
)>

<cfset mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig)>

<cfset people = mongo.getDBCollection("people")>

<cfdump var="#options#" label="Options Structure">
<cfdump var="#mongo.getMongo().getMongoOptions()#" label="Mongo.getMongoOptions() after configuring MongoClient with the Options Structure">


<cfset mongo.close()>