<!---run load.cfm to get the data that these will use! --->
<!--- pass forceLoad=true in the URL to force new data --->
<cfinclude template="load.cfm">

<cfinclude template="../initMongo.cfm">

<cfscript>
	collection = "geoexamples";
	dbCol = mongo.getDBCollection( collection );

	try {
		//only need to do this once, but here for illustration
		dbCol.dropIndexes();
		indexes = dbCol.ensureGeoIndex("LOC");
		writeDump(indexes);

		//as of this writing, you can perform geo queries like so:
		nearResult = dbCol.query().add( "LOC", {"$near" = [38,-85]} ).find(limit=10);
		writeDump( var = nearResult.asArray(), label = "$near result" );

		//nearSphereResult = dbCol.query().add( "LOC", {"$nearSphere" = [45.46427, 9.18951], "$maxDistance" = 5} ).find(limit=10);
		//writeDump( var = nearSphereResult.asArray(), label = "$nearSphere result" );
	}
		catch(Any e){
		writeDump(e);
	}

	mongo.close();
</cfscript>
