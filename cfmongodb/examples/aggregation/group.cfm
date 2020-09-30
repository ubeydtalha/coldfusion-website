<!---run load.cfm to get the data that this group() will use! Note that it is entirely fake/random data.--->
<!--- pass forceLoad=true in the URL to force new data --->
<cfinclude template="load.cfm">

<cfinclude template="../initMongo.cfm">


<cfscript>
	collectionName = "tasks";
	dbCol = mongo.getDBCollection( collectionName );

	reduce = "
		function(obj,agg) {
			agg.TOTAL++;

			if( obj.COMPLETETS ){
				agg.TOTALTIMETOCOMPLETE += ( obj.COMPLETETS.getTime() - obj.ADDEDTS.getTime() );
			}

			if( obj.STARTTS ){
				//it's been started... calculate from the STARTTS
				agg.TOTALPENDINGTIME += ( obj.STARTTS.getTime() - obj.ADDEDTS.getTime() );
			} else {
				//it's not yet started... calculate from now
				agg.TOTALPENDINGTIME += ( new Date().getTime() - obj.ADDEDTS.getTime() );
			}
			//agg.VALS.push(obj); //uncomment this to see all the objects that came through here; warning, this will add a lot of time to the writeDump
		}
	";

	finalize = "
		function(out){
			out.AVGPENDINGTIME = out.TOTALPENDINGTIME/out.TOTAL;
		}
	";

	//This is how to do it with CFMongoDB. Note that the order of arguments is slightly different from the Java Driver's version
	newStatusGroups = dbCol.group(
		keys="STATUS,OWNER",
		initial={TOTAL=0, TOTALTIMETOCOMPLETE=0, TOTALPENDINGTIME=0, VALS=[]},
		reduce=reduce,
		finalize=finalize
	);



	//This is how to do it with Java. Note use of mongoUtil to properly format the arguments
	collection = dbCol.getMongoDBCollection();
	mongoUtil = mongo.getMongoUtil();
	keys = mongoUtil.createOrderedDBObject( [{STATUS=true}, {OWNER=true}] );
	emptyCondition = mongoUtil.toMongo({});
	initial = mongoUtil.toMongo( {TOTAL=0, TOTALTIMETOCOMPLETE=0, TOTALPENDINGTIME=0, VALS=[]} );

	statusGroups = collection.group(
		keys,
		emptyCondition,
		initial,
		reduce
	);

	mongo.close();
</cfscript>

<cfoutput>

	<h1>CFMongoDB group() Demo</h1>
	<p>This shows how to use CFMongoDB's group() function</p>
	<p>The data are randomly generated in load.cfm. </p>
	<cfloop array="#newStatusGroups#" index="group">
		<h2>Group #group.STATUS#, OWNER: #group.OWNER#</h2>
		 Total: #group.TOTAL#<br>
		Avg Pending Time: #group.AVGPENDINGTIME/1000# seconds <br>
		 Total Time to Complete:

		 <cfif group.STATUS eq "C">
		 	#(group.TOTALTIMETOCOMPLETE/1000)/group.TOTAL# <br>
		 <cfelse>
		 	not yet complete
		 </cfif>
	</cfloop>

	<cfdump var="#newStatusGroups#" label="Status Groups, via CFMongoDB">

	<hr>

	<h1>Raw group() Demo</h1>
	<p>This shows how to use MongoDB's group() function directly, without going through cfmongodb. Note that it uses mongoUtil to ensure proper datatype conversion</p>
	<p>The data are randomly generated in load.cfm. </p>
	<cfloop array="#statusGroups#" index="group">
		<h2>Group #group.STATUS#, OWNER: #group.OWNER#</h2>
		 Total: #group.TOTAL#<br>
		 Avg Pending Time: #(group.TOTALPENDINGTIME/1000)/group.TOTAL# seconds <br>
		 Total Time to Complete:

		 <cfif group.STATUS eq "C">
		 	#(group.TOTALTIMETOCOMPLETE/1000)/group.TOTAL# <br>
		 <cfelse>
		 	not yet complete
		 </cfif>
	</cfloop>


</cfoutput>

<cfdump var="#statusGroups#" label="Status Groups, via Java">

