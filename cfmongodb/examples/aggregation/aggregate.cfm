<cfinclude template="../initMongo.cfm">

<h1>Aggregation Framework Examples</h1>

<p>For more pipeline examples, see <a href="http://docs.mongodb.org/manual/aggregation/">Mongo Aggregation FW Docs</a>.</p>

<cfscript>
    // verify server version supports Aggregation FW
    mongoDB = mongo.getMongoDB();
    buildInfo = mongoDB.command( mongo.getMongoUtil().toMongo( { "buildInfo"=1 } ) );
    mongoVersion = buildInfo["version"];
    if (mongoVersion lt 2.1) {
        writeOutput("<p>Your MongoDB server version (#mongoVersion#) does not support the Aggregation framework. Upgrade your server to MongoDB 2.1 or higher.</p>");
        mongo.close();
        exit;
    }


    // ok, create a collection of musicians to work with
    musicians = [
        { "name"="Neil Peart", "instruments"=[ "drums" ], "bands"=["Rush"], "age"=59, "status"="rocking", "goldrecords"=24, "platinumrecords"=14 },
        { "name"="Geddy Lee", "instruments"=[ "bass", "keyboards" ], "bands"=["Rush"], "age"=59, "status"="rocking", "goldrecords"=24, "platinumrecords"=14 },
        { "name"="Alex Lifeson", "instruments"=[ "guitar" ], "bands"=["Rush"], "age"=59, "status"="rocking", "goldrecords"=24, "platinumrecords"=14 },
        { "name"="Gordon Sumner", "instruments"=[ "bass" ], "bands"=["The Police"], "age"=60, "status"="mellowing", "goldrecords"=10, "platinumrecords"=8, "nickname"="Sting" },
        { "name"="Stewart Copland", "instruments"=[ "drums" ], "bands"=["The Police","Animal Logic","Curved Air"], "age"=60, "status"="rocking" },
        { "name"="Andy Summers", "instruments"=[ "guitar" ], "bands"=["The Police","The Animals"], "age"=69, "status"="mellowing" },
        { "name"="Sean Daniels", "instruments"=[ "drums" ], "bands"=["Thanks To Gravity","The Reconstructed","Don Campbell Band"], "age"=40, "status"="rocking", "boss"=true },
        { "name"="Andy Happel", "instruments"=[ "guitar","vocals","violin" ], "bands"=["Thanks To Gravity","Don Campbell Band"], "age"=42, "status"="rocking" },
        { "name"="Sean Caughran", "instruments"=[ "keyboards" ], "bands"=["Thanks To Gravity"], "age"=42, "status"="rocking" },
        { "name"="Drew Wyman", "instruments"=[ "bass" ], "bands"=["Thanks To Gravity"], "age"=41, "status"="rocking" },
        { "name"="Martin England", "instruments"=[ "guitar","vocals" ], "bands"=["Pondering Judd","The Reconstructed"], "age"=42, "status"="rocking" },
        { "name"="Carlos Vega", "instruments"=[ "drums" ], "bands"=["James Taylor","Lee Ritenour"], "status"="deceased" }
    ];

    musiciansCollection = mongo.getDBCollection("musicians");

    // clear them out
    musiciansCollection.remove({});

    // repopulate
    musiciansCollection.saveAll(musicians);

</cfscript>

<hr>

<h3>Sample Musician Document:</h3>

<cfdump var="#musiciansCollection.findOne({})#" expand="false" label="Sample Doc">

<h3>Aggregation API</h3>

<p>
	To aggregate:

	<pre>aggregationResult = collection.aggregate(command1, command2, ...commandN)</pre>

	The <code>AggregationResult</code> object exposes 3 methods:

	<ul>
		<li><code>asArray()</code> : returns the results as an array of structs</li>
		<li><code>getCommand()</code> : returns a struct representing the command sent to MongoDB. Useful for debugging.</li>
		<li><code>getAggregationOutput()</code> : returns the MongoDB AggregationOutput object which exposes even more information</li>
	</ul>

</p>


<h3>Counts Using Group By (with Projection)</h3>

<p>SQL Equivalent:</p>

<pre>
    select  count(0) as total,
            status
    from    musicians
    group   by status
</pre>

<p>Aggregation Pipeline:</p>

<pre>
    { "$group"={ "_id"="$status", "total"={ "$sum"=1 } } }, // group by status, counting up musicians with that status
    { "$project"={ "status"="$_id", "total"=1, "_id"=0 } }  // projection reshapes the final document. Here we rename _id to "status", include "total" as is and suppress the _id field
</pre>

<cfscript>
    // get counts by status:
    countsByStatus = musiciansCollection.aggregate(
        { "$group"={ "_id"="$status", "total"={ "$sum"=1 } } },
        { "$project"={ "status"="$_id", "numberOfMusicians"="$total", "_id"=0 } }
    );

    writedump(var:countsbyStatus.asArray(),label:"countsByStatus.asArray() : Counts Using Group By");
    writeOutput("<p></p>");
	writedump(var:countsByStatus.getCommand(),label:"countsByStatus.getCommand()");
    writeOutput("<p></p>");
	writedump(var:countsByStatus.getAggregationOutput(),label:"countsByStatus.getAggregationOutput()");
    writeOutput("<p></p>");
</cfscript>



<h3>Average Age Of Mellowing Musicians</h3>

<p>SQL Equivalent:</p>

<pre>
    select  avg(age) as result,
    from    musicians
    where   status = 'mellowing'
</pre>

<p>Aggregation Pipeline:</p>

<pre>
    { "$match"={ "status"="mellowing" } },                              // filters docs into next pipeline (good to do first where applicable)
    { "$group"={ "_id"="$status", "averageAge"={ "$avg"="$age" } } }    // gets average
</pre>

<cfscript>
    // get counts by status:
    ageMellowing = musiciansCollection.aggregate(
        { "$match"={ "status"="mellowing" } },
        { "$group"={ "_id"="$status", "averageAge"={ "$avg"="$age" } } }
    );

    writedump(var:ageMellowing.asArray(),label:"Average Age Of Mellowing Musicians", expand:false);
</cfscript>

<h3>Using $unwind To Get Band Members By Band</h3>

<p>Aggregation Pipeline:</p>

<pre>
    // lots of steps, just to be cool.
    { "$project"= { "_id"=0, "bands"=1, "name"=1 } }, // include just bands and musician name from original docs
    { "$unwind"="$bands" }, // unwind bands, we now have one doc per (musician x band)
    { "$group"={ "_id"="$bands", "members"={ "$addToSet"="$name" } } }, // now, group by band
    { "$project"= { "_id"=0, "band"="$_id", "members"=1 } }, // remove _id from output, rename "_id" to "band"
    { "$sort"= { "band"=1 } } // sort by band name
</pre>

<cfscript>
    // get counts by status:
    musiciansPerBand = musiciansCollection.aggregate(
        { "$project"= { "_id"=0, "bands"=1, "name"=1 } },
        { "$unwind"="$bands" },
        { "$group"={ "_id"="$bands", "members"={ "$addToSet"="$name" } } },
        { "$project"= { "_id"=0, "band"="$_id", "members"=1 } },
        { "$sort"= { "band"=1 } }
    );

    writedump(var:musiciansPerBand.asArray(),label:"Band Members", expand:false);
</cfscript>


<h3>Instrument Popularity, Most To Least</h3>

<p>Aggregation Pipeline:</p>

<pre>
    { "$project"= { "_id"=0, "instruments"=1, "name"=1 } },
    { "$unwind"="$instruments" },
    { "$group"={ "_id"="$instruments", "musiciansCount"={ "$sum"=1 } } },
    { "$sort"= { "musiciansCount"=-1 } }
</pre>

<cfscript>
    // get counts by status:
    musiciansCountsPerInstrument = musiciansCollection.aggregate(
        { "$project"= { "_id"=0, "instruments"=1, "name"=1 } },
        { "$unwind"="$instruments" },
        { "$group"={ "_id"="$instruments", "musiciansCount"={ "$sum"=1 } } },
        { "$sort"= { "musiciansCount"=-1 } }
    );

    writedump(var:musiciansCountsPerInstrument.asArray(),label:"Musician Counts Per Instrument", expand:false);




    mongo.close();
</cfscript>
