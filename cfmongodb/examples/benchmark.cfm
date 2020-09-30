<cfsetting requesttimeout="500">

<!--- create the mongo objects --->
<cfset variables.dbName = "cfmongodb_benchmarks">
<cfinclude template="initMongo.cfm">
<cfset mongoUtil = mongo.getMongoUtil()>
<cfscript>

	serverName = server.coldfusion.productname & "_" & server.coldfusion.productversion;

	//we'll create/use a 'people' collection
	collection = "datadump";
	metricsCollection = "metrics";

	dbCol = mongo.getDBCollection( collection );
	metricsCol = mongo.getDBCollection( metricsCollection );

	dataCreateStart = getTickCount();
	coolPeople = [];
	totalDocs = 50000;
	for( i = 1; i LTE totalDocs; i++ ){
		DOC =
		{
			NAME = "Cool Dude #i#",
			WIFE = "Smokin hot wife #i#",
			KIDS = [
					{NAME="kid #i#", age=randRange(1,80), hair="strawberry", description="fun" },
					{NAME="kid #i+1#", age=randRange(1,80), hair="raven", description="joyful" }
			],
			BIKE = "Specialized",
			TS = now(),
			COUNTER = i,
			MONGOROCKS = true,
			PRODUCT = serverName,
			PRICE = randRange(1,1000),
			TICK = getTickCount(),
			SKU = repeatString( randRange(1,100), "10" )
		};
		arrayAppend( coolPeople, doc );
	}
	dataCreateTotal = getTickCount() - dataCreateStart;

	writeOutput("Total docs: #arrayLen(coolPeople)# in #dataCreateTotal# ms");

	saveStart = getTickCount();

	dbCol.saveAll( coolPeople );

	saveTotal = getTickCount() - saveStart;

	stat = { DATATOTAL=dataCreateTotal, SAVETOTAL=saveTotal, COUNT=totalDocs, SAVETYPE='structs', USEJL=url.useJavaLoader, PRODUCT=serverName, TS=now() };
	metricsCol.save( stat );

	writeDump(stat);


	dataCreateStart = getTickCount();
	coolPeople = [];
	for( i = 1; i LTE totalDocs; i++ ){
		DOC =
		{
			NAME = "Cool Dude #i#",
			WIFE = "Smokin hot wife #i#",
			KIDS = [
					{NAME="kid #i#", age=randRange(1,80), hair="strawberry", description="fun" },
					{NAME="kid #i+1#", age=randRange(1,80), hair="raven", description="joyful" }
			],
			BIKE = "Specialized",
			TS = now(),
			COUNTER = i,
			MONGOROCKS = true,
			PRODUCT = serverName,
			PRICE = randRange(1,1000),
			TICK = getTickCount(),
			SKU = repeatString( randRange(1,100), "10" )
		};
		arrayAppend( coolPeople, mongoUtil.toMongo(doc) );
	}

	dataCreateTotal = getTickCount() - dataCreateStart;

	saveStart = getTickCount();

	dbCol.saveAll( coolPeople );

	saveTotal = getTickCount() - saveStart;

	stat = { DATATOTAL=dataCreateTotal, SAVETOTAL=saveTotal, COUNT=totalDocs, SAVETYPE='dbos', USEJL=url.useJavaLoader, PRODUCT=serverName, TS=now() };
	metricsCol.save( stat );

	writeDump(stat);


	reduce = "
		function(obj, agg) {
			agg.COUNT++;

			if( obj.SAVETOTAL )
				agg.SAVETOTAL += obj.SAVETOTAL;

			if( obj.DATATOTAL )
				agg.DATATOTAL += obj.DATATOTAL;
		}
	";

	finalize = "
		function(out){
			//out.AVGPENDINGTIME = out.TOTALPENDINGTIME/out.TOTAL;
		}
	";

	metricsResults = metricsCol.group(
		keys="PRODUCT,SAVETYPE,USEJL",
		initial={COUNT=0,SAVETOTAL=0,DATATOTAL=0},
		reduce=reduce,
		query={COUNT = totalDocs, PRODUCT = {"$exists" = true} },
		finalize=finalize
	);


	writeDump(metricsResults);
</cfscript>
