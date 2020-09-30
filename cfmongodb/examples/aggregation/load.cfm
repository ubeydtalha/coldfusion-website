<cfparam name="forceLoad" default="false">
<cfinclude template="../initMongo.cfm">
<cfscript>
collection = "tasks";
dbCol = mongo.getDBCollection( collection );

total = dbCol.query().count();
badRecords = dbCol.query().$exists("ADDEDTS",false).count();

if(NOT total OR forceLoad OR badRecords){
	dbCol.remove({});
	nextNum = 1;

	pending = [];
	for( i = nextNum; i <= randRange( nextNum+1, nextNum+100 ); i++ ){
		arrayAppend( pending, { N=i, OWNER='', DATA="Some data goes here #i#", STATUS="P", ADDEDTS=now() } );
	}

	running = [];
	nextNum = i;
	for( i = nextNum; i <= randRange( nextNum+1, nextNum+100 ); i++ ){
		owner = i mod 2 ? "localhost" : "someOtherServer";
		arrayAppend( running, { N=i, OWNER=owner, DATA="Some data goes here #i#", STATUS="R", ADDEDTS=dateAdd("d",-randRange(0,50),now()), STARTTS=now() } );
	}

	paused = [];
	nextNum = i;
	for( i = nextNum; i <= randRange( nextNum+1, nextNum+100 ); i++ ){
		arrayAppend( paused, { N=i, OWNER='', DATA="Some data goes here #i#", STATUS="U", ADDEDTS=dateAdd("d",-randRange(0,50),now()) } );
	}

	completed = [];
	nextNum = i;
	for( i = nextNum; i <= randRange( nextNum+1, nextNum+100 ); i++ ){
		owner = i mod 2 ? "localhost" : "someOtherServer";
		arrayAppend( paused, { N=i, OWNER=owner, DATA="Some data goes here #i#", STATUS="C", ADDEDTS=dateAdd("d",-randRange(1,50),now()), STARTTS=dateAdd("n",-randRange(0,500),now()), COMPLETETS=now() } );
	}


	dbCol.saveAll( pending );
	dbCol.saveAll( running );
	dbCol.saveAll( paused );
	dbCol.saveAll( completed );
}
mongo.close();
</cfscript>