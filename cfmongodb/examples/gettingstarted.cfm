<style>
*{
	font-family: sans-serif;
}
h2{
	color: navy;
}
</style>

<h1>Getting Started</h1>

<p>The examples in this code are designed to show you how to use the CFMongoDB objects for saving and retrieving data to a running MongoDB datastore.
However, this example creates a new mongo object, and closes it, every time it is run.
</p>
<p>
In your applications, you <b>must</b> create the mongo object as an application-scoped singleton.
See PeopleList/Application.cfc for an example. See the examples in <b>/examples/ioc</b> for constructing
with ColdSpring or WireBox.
</p>
<p>If your applications create and close a mongo on every request, performance will suffer significantly.
</p>

<!--- pass 'false' in the URL to use the mongo jars in your cfusion lib directory --->
<cfparam name="url.useJavaLoader" default="true">

<cfscript>

	if( url.useJavaLoader ){
		//the fastest way to try out cfmongodb is using Mark Mandel's javaloader, which we ship with cfmongodb. Thanks Mark!
		//http://javaloader.riaforge.org

		//use the cfmongodb javaloader factory
		javaloaderFactory = createObject('component','cfmongodb.core.JavaloaderFactory').init();

		//create a default MongoConfig instance; in your real apps, you'll create an object that extends MongoConfig and put your environment specific config in there
		//here we initialize it with a db named 'mongorocks'
		mongoConfig = createObject('component','cfmongodb.core.MongoConfig').init(dbName="mongorocks", mongoFactory=javaloaderFactory);
	}else{
		mongoConfig = createObject('component','cfmongodb.core.MongoConfig').init(dbName="mongorocks");
	}

	//initialize the core cfmongodb Mongo object
	mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig);

	//we'll create/use a 'people' collection
	collection = "people";
	people = mongo.getDBCollection( collection );

	//clear out the collection so we always start fresh, for demo purposes
	people.remove({});


	//here's how to insert one document
	doc =
		{
			NAME = "Marc",
			SPOUSE = "Heather",
			KIDS = [
				{NAME="Alexis", AGE=7, HAIR="blonde", DESCRIPTION="crazy" },
				{NAME="Sidney", AGE=2, HAIR="dirty blonde", DESCRIPTION="ornery" }
			],
			BIKE = "Felt",
			LOVESSQL = true,
			LOVESMONGO = true,
			TS = now(),
			COUNTER = 1
		};

	writeOutput("<h2>A saved document (struct)</h2>");
	people.save( doc );

	writeDump( var=doc, label="Saved document", expand="false" );

	/*
	* VERY IMPORTANT: ColdFusion will automatically uppercase struct keys if you do not quote them. Consequently, the document will be stored
	* in MongoDB with upper case keys. Below, where we search, we MUST use uppercase keys.
	*
	* at the shell, mongo.find({name:'Marc'}) != mongo.find({NAME: 'Marc'})
	*/


	//here's how to insert multiple documents
	coolPeople = [];
	for( i = 1; i LTE 5; i++ ){
		DOC =
		{
			NAME = "Cool Person #i#",
			SPOUSE = "Cool Spouse #i#",
			KIDS = [
					{NAME="kid #i#", age=randRange(1,80), HAIR="strawberry", DESCRIPTION="fun" },
					{NAME="kid #i+1#", age=randRange(1,80), HAIR="raven", DESCRIPTION="joyful" }
			],
			BIKE = "Specialized",
			TS = now(),
			COUNTER = i
		};
		arrayAppend( coolPeople, doc );
	}

	people.saveAll( coolPeople );

	//find Marc
	marc = people.query().$eq("NAME", "Marc").find();
	showResult( marc, "Marcs" );


	//find riders of Specialized bikes
	specialized = people.query().$eq("BIKE", "Specialized").find();
	showResult( specialized, "Specialized riders" );

	//find the 3rd and 4th Specialized bike riders, sorted by "ts" descending
	specialized = people.query().$eq("BIKE", "Specialized").find( skip=2, limit=2, sort={"TS"=-1} );
	showResult( specialized, "Specialized riders, skipping to 3, limiting to 2, sorting by ts desc (skip is 0-based!)" );

	//find riders with counter between 1 and 3, sorted by "ts" descending
	specialized = people.query()
						.$eq("BIKE", "Specialized")
						.between("COUNTER", 1, 3)
						.find( sort={"TS"=-1} );
	showResult( specialized, "Specialized riders, COUNTER between 1 and 3" );

	//find riders with counter between 1 and 3 Exclusive, sorted by "ts" descending
	specialized = people.query()
						.$eq("BIKE", "Specialized")
						.betweenExclusive("COUNTER", 1, 3)
						.find( sort={"TS"=-1});
	showResult( specialized, "Specialized riders, COUNTER between 1 and 3 Exclusive" );

	//find people with kids aged between 2 and 30
	kidSearch = people.query().between("KIDS.AGE", 2, 30).find(keys="NAME,COUNTER,KIDS", sort={"COUNTER"=-1});
	showResult( kidSearch, "People with kids aged between 2 and 30" );


	//find a document by ObjectID... note that it returns the document, NOT a SearchResult object; here, we'll "spoof" what your app would do if the id were in the URL scope
	url.personId = specialized.asArray()[1]["_id"].toString();

	byID = people.findById( url.personId );
	writeOutput("<h2>Find by ID</h2>");
	writeDump(var=byID, label="Find by ID: #url.personID#", expand="false");

	//using count(), SearchResult.totalCount(), and SearchResult.size()
	totalPeople = people.query().between("KIDS.AGE", 2, 100).count();
	searchResult =  people.query().between("KIDS.AGE", 2, 100).find(limit=3);//using limit to show difference between SearchResult.size() and totalCount()
	alsoTotalPeople = searchResult.totalCount(); //equivalent to query().count()!
	sizeWithLimit = searchResult.size();
	writeOutput("<h2>How to count things</h2>");
	writeOutput("Total People with kids aged between 2 and 100: #totalPeople#; Also Total People, fetched via the SearchResult object, which does not care about limit and skip: #alsoTotalPeople#<br>");
	writeOutput("SearchResult.size() will respect the skip and limit arguments: #sizeWithLimit#<br>");

	//using distinct() to return an array of unique values
	kidAges = people.distinct( "KIDS.AGE" );
	writeOutput("<h2>Distinct values</h2>");
	writeDump(var=kidAges, label="Distinct kid ages", expand="false");



	//here's how to update. You'll generally do two kinds of updating:
	// 1) updating a single pre-fetched document... this is the most common. It's a find/modify/resave
	// 2) updating one or more documents based on criteria. You almost always need to use a $set in this situation!!!

	//updating a single pre-fetched document
	person = people.findOne();
	person.FAVORITECIGAR = "H. Upmann Cubano";
	person.MODTS = now();
	arrayAppend( person.KIDS, {NAME = "Pauly", AGE = 0} );
	people.update( person );

	writeOutput("<h2>Updated Person</h2>");
	writeDump( var=person, label="updated person", expand="false");

	//updating a single document. by default it'll wrap the "doc" arg in "$set" as a convenience
	person = {NAME = "Ima PHP dev", AGE=12};
	people.save( person );

	people.update( doc = {"$set" = {NAME = "Ima CF Dev", HAPPY = true}}, query= {NAME = "Ima PHP dev"} );
	afterUpdate = people.findById( person["_id"] );

	writeOutput("<h2>Updated person by criteria</h2>");
	writeDump(var = person, label="Original", expand=false);
	writeDump(var = afterUpdate, label = "After update", expand=false);

	//updating a single document based on criteria and overwriting instead of updating
	person = {NAME = "Ima PHP dev", AGE=12};
	people.save( person );

	people.update( doc={NAME = "Ima CF Dev", HAPPY = true}, query= {NAME = "Ima PHP dev"} );
	afterUpdate = people.findById( person["_id"] );

	writeOutput("<h2>Updated person by criteria with overwrite. Notice it OVERWROTE the entire document because an update modifier ($set, $inc, etc) was not used</h2>");
	writeDump(var = person, label="Original", expand=false);
	writeDump(var = afterUpdate, label = "After update without using $set", expand=false);


	//updating multiple documents
	people.saveAll(
		[{NAME = "EmoHipster", AGE=16},
		{NAME = "EmoHipster", AGE=15},
		{NAME = "EmoHipster", AGE=18}]
	);

	update = {"$set" = {NAME = "Oldster", AGE=76, REALIZED="tempus fugit"}};
	query = {NAME = "EmoHipster"};

	people.update( doc = update, query = query, multi=true );

	oldsters = people.query().$eq("NAME", "Oldster").find().asArray();

	writeOutput("<h2>Updating multiple documents</h2>");
	writeDump( var=oldsters, label="Even EmoHipsters get old some day", expand="false");

	//perform an $inc update
	cast = [{NAME = "Wesley", LIFELEFT=50, TORTUREMACHINE=true},
		{NAME = "Spaniard", LIFELEFT=42, TORTUREMACHINE=false},
		{NAME = "Giant", LIFELEFT=6, TORTUREMACHINE=false},
		{NAME = "Poor Forest Walker", LIFELEFT=60, TORTUREMACHINE=true}];

	people.saveAll( cast );

	suckLifeOut = {"$inc" = {LIFELEFT = -1}};
	victims = {TORTUREMACHINE = true};
	people.update( doc = suckLifeOut, query = victims, multi = true );

	rugenVictims = people.query().$eq("TORTUREMACHINE", true).find().asArray();

	writeOutput("<h2>Atomically incrementing with $inc</h2>");
	writeDump( var = cast, label="Before the movie started", expand=false);
	writeDump( var = rugenVictims, label="Instead of sucking water, I'm sucking life", expand=false);


	//Upserting
	doc = {
		NAME = "Marc",
		BIKE = "Felt",
		JOYFUL = true
	};
	people.save( doc = doc );

	writeOutput("<h2>Upserted document after saving initially</h2>");
	writeDump( var = doc, label = "Upserted doc: #doc['_id'].toString()#", expand = false);

	doc.WANTSSTOGIE = true;
	people.save( doc = doc );

	writeOutput("<h2>Upserted document after updating</h2>");
	writeDump( var = doc, label = "Upserted doc: #doc['_id'].toString()#", expand = false);



	//findAndModify: Great for Queuing!
	//insert docs into a work queue; find the first 'pending' one and modify it to 'running'
	tasksCol = mongo.getDBCollection( "tasks" );
	tasksCol.remove( {} );
	jobs = [
		{STATUS = 'P', N = 1, DATA = 'Let it be'},
		{STATUS = 'P', N = 2, DATA = 'Hey Jude!'},
		{STATUS = 'P', N = 3, DATA = 'Ebony and Ivory'},
		{STATUS = 'P', N = 4, DATA = 'Bang your head'}
	];
	tasksCol.saveAll( jobs );

	query = {STATUS = 'P'};
	update = {"$set" = {STATUS = 'R', started = now(), owner = cgi.server_name}};

	nowScheduled = tasksCol.findAndModify( query = query, update = update, sort = {"N"=1} );

	writeOutput("<h2>findAndModify()</h2>");
	writeDump(var=nowScheduled, label="findAndModify", expand="false");


	writeOutput("<h2>Indexes</h2>");
	//here's how to add indexes onto collections for faster querying
	people.ensureIndex( ["NAME"] );
	people.ensureIndex( ["BIKE"] );
	people.ensureIndex( ["KIDS.AGE"] );
	writeDump(var=people.getIndexes(), label="Indexes", expand="false");



	//show how you get timestamp creation on all documents, for free, when using the default ObjectID
	mongoUtil = mongo.getMongoUtil();
	all = people.find().asArray();
	first = all[1];
	last = all[ arrayLen(all) ];
	writeOutput("<h2>Timestamps from Doc</h2>");
	writeOutput("Timestamp on first doc: #first['_id'].getTime()# = #mongoUtil.getDateFromDoc(first)#   <br>");
	writeOutput("Timestamp on last doc: #last['_id'].getTime()# = #mongoUtil.getDateFromDoc(last)#   <br>");
	
	
	//show how to force a value to be a string regardless of its content
	mongoUtil = mongo.getMongoUtil();
	celebCol = mongo.getDBCollection( "celebs" );
	celebCol.remove( {} );
	//asString forces a value to be string even if it looks like a number
	celebs = [
		{NAME = "Warren Beatty", ZIP = mongoUtil.asString("90210")},
		{NAME = "Paul Newman", ZIP = "90210-9997"},
		{NAME = "Eddie Murphy", ZIP = "90210-6823"},
		{NAME = "Bill Murray", ZIP = mongoUtil.asString("90265")},
		{NAME = "Bill Cosby", ZIP = mongoUtil.asString("90272")}
	];
	celebCol.saveAll( celebs );

	writeOutput("<h2>mongoUtil.asString()</h2>");
	writeOutput("<span style='color:red'>Only needed for ColdFusion!  Railo handles datatypes correctly without this method!</span><br><br>");
	writeDump(var=celebCol.find(query={}, sort={"ZIP"=1}).asArray(), label="asString", expand="false");
	writeOutput("The sort by zip works because the datatypes are all string.  If the numeric looking zip codes went in as numeric while the other as string, all the numbers would appear first on the list, followed by strings.");
	
	

	//close the Mongo instance. Very important!
	mongo.close();


	function showResult( searchResult, label ){
		writeOutput("<h2>#label#</h2>");
		writeDump( var=searchResult.asArray(), label=label & '(Result from MongoDB)', expand="false" );
		writeOutput( "<br>Total #label# in this result, accounting for skip and limit: " & searchResult.size() );
		writeOutput( "<br>Total #label#, ignoring skip and limit: " & searchResult.totalCount() );
		writeOutput( "<br>Query: " & searchResult.getQuery().toString() );
		writeOutput( "<br>Sort: " & searchResult.getSort().toString() & "<br>");
	}

</cfscript>
