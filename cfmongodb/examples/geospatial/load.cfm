<cfparam name="forceLoad" default="false">
<cfinclude template="../initMongo.cfm">

<cfscript>
	collection = "geoexamples";
	dbCol = mongo.getDBCollection( collection );
	total = dbCol.query().count();

	if( total eq 0 OR forceLoad ){
		dbCol.remove( {} );
		rows = deserializeJson( fileRead(expandPath('geo.json')) );
		dbCol.saveAll( rows );
	}

	mongo.close();
</cfscript>
