<cfcomponent output="false" extends="BaseTestCase">
<cfscript>
import cfmongodb.core.*;


	function setUp(){
		mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig);
		col = 'articles';
		dbCol = mongo.getDBCollection( col );

		super.setUp();
	}

	function tearDown(){
		dbCol.remove({});
		super.TearDown();
	}

	function group_should_aggregate(){
		var articles = createArticles();
		dbCol.saveAll(articles);

		var reduce = "
			function( obj, agg ){
				agg.TOTAL++;
			}
		";

		var finalize = "
			function( out ){
				out.AVG = out.TOTAL / #arrayLen(articles)#
			}
		";

		var groups = dbCol.group(
			keys="STATUS",
			initial={TOTAL=0},
			reduce=reduce,
			finalize=finalize
		);

		//debug(groups);

		//all these assertions are based on the articles we created below. This is static so that the tests are determinant
		assertEquals( 4, arrayLen(groups), "should have 4 groups because we had 4 different statuses");

		assertEquals( "P", groups[1].status);
		assertEquals( 2, groups[1].total );
		assertEquals( 0.2, groups[1].avg );
		assertEquals( "R", groups[2].status );
		assertEquals( 3, groups[2].total );
		assertEquals( 0.3, groups[2].avg );
		assertEquals( "S", groups[3].status );
		assertEquals( 3, groups[3].total );
		assertEquals( 0.3, groups[3].avg );
		assertEquals( "C", groups[4].status );
		assertEquals( 2, groups[4].total );
		assertEquals( 0.2, groups[4].avg );

	}

	/**
	* @mxunit:expectedException GroupException
	*/
	function group_should_rethrow_mongo_error_when_present(){
		var reduce = "
			function( obj, agg ){
		";

		var groups = dbCol.group(
			keys="STATUS",
			initial={TOTAL=0},
			reduce=reduce
		);

	}

	function mapReduce_should_aggregate(){
		var articles = createArticles();
		dbCol.saveAll(articles);

		var map = "
			function(){
				var totalTopics = this.TAGS.length;
				var i = 0;
				this.TAGS.forEach(
					function(z){
						emit( z, {count: 1} );
					}
				);
			}
		";
		var reduce = "
			function(key, emits){
				var total = 0;

				for( var i in emits ){
					total += emits[i].count;
				}
				return {count: total};
			}
		";
		var finalize = "
			function( key, value ){
				value.rank = value.count / inputcount;
				value.processed = processed;
				return value;
			}
		";
		var scope = {"inputcount" = arrayLen(articles), "processed" = now()};
		var result = dbCol.mapReduce( map=map, reduce=reduce, outputTarget="article_topic_rank", options={"scope"=scope, "finalize"=finalize} );
		//debug(result.asArray());
		assertEquals( 4, arrayLen(result.asArray()), "should have had 4 elements because there were 4 different tags" );

		var sorted = mongo.getDBCollection("article_topic_rank").find(sort={"value.count"=-1});
		var sortedResult = sorted.asArray();
		//debug(sortedResult);
		assertEquals(10, sortedResult[1]["value"]["count"] );
		assertEquals(1, sortedResult[1]["value"]["rank"] );
		assertEquals(2, sortedResult[4]["value"]["count"] );
		assertEquals(0.2, sortedResult[4]["value"]["rank"] );
	}

	/**
	* @mxunit:expectedException MapReduceException
	*/
	function mapReduce_should_rethrow_mongo_error_when_present(){
		var map = "
			function(){
				this.HIMOM.forEach(
					function(z){
						emit( z, {count: 1} );

				);
			}
		";
		var reduce = "
			function(key, emits){
				var total = 0;

				for( var i in emits ){
					total += emits[i].count;
				}
				return {count: total};
			}
		";

		var result = dbCol.mapReduce( map=map, reduce=reduce, outputTarget="map_reduce_error" );
		//debug(result);
	}

	function aggregate_accepts_single_operation(){
		var articles = createArticles();
		dbCol.saveAll(articles);
		var op =  { "$group"={ "_id"="$STATUS", "total"={ "$sum"=1 } } };
		var result = dbCol.aggregate(op);
		var output = result.getAggregationOutput();
		//inspect these to see what's available
		debug( result );
		debug( result.getCommand() );
		debug( output.getServerUsed() );
		debug( output.toString() );

		var asArray = result.asArray();

		//we know these b/c we created the input collection in createArticles()
		assertEquals( 4, arrayLen(asArray) );
		assertEquals( "C", asArray[1]._id );
		assertEquals( 2, asArray[1].total );
		assertEquals( "R", asArray[3]._id );
		assertEquals( 3, asArray[3].total );

		assertEquals( 1, arrayLen(result.getCommand().pipeline), "Original command had 1 entry, so command from return object should match" );

		//ensure access to all java bits
		assertTrue( len(output.toString()) GT 0 );
		assertEquals( "com.mongodb.AggregationOutput", output.getClass().getName() );
	}

	function aggregate_accepts_multiple_operations(){
		var articles = createArticles();
		dbCol.saveAll(articles);
		var group =  { "$group"={ "_id"="$STATUS", "total"={ "$sum"=1 } } };
		var sortDesc = { "$sort"={ "total"=-1 } };
		var sortAsc = { "$sort"={ "total"=1 } };
		var result = dbCol.aggregate( group, sortDesc );
		var asArray = result.asArray();
		assertEquals( 4, arrayLen(asArray) );
		assertTrue( asArray[1].total GT asArray[4].total, "We specified a descending sort so the first should've been larger" );

		result = dbCol.aggregate( group, sortAsc );
		asArrayAsc = result.asArray();
		assertEquals( 4, arrayLen(asArrayAsc) );
		assertNotEquals( asArray, asArrayAsc );
		assertTrue( asArrayAsc[1].total LT asArrayAsc[4].total, "We specified a descending sort so the first should've been larger" );

	}

	/**
	* @mxunit:expectedException com.mongodb.CommandFailureException
	*/
	function aggregate_throws_error_with_bad_command(){
		var op =  { "group"={ "_id"="$STATUS", "total"={ "$sum"=1 } } };
		var result = dbCol.aggregate(op);
		var output = result.getAggregationOutput();
		debug(output.getCommandResult());
	}


	/**
	* creates a dataset to work with both group and mapReduce
	*/
	private function createArticles(){
		var articles = [];
		var tags = "";
		var i = 1;
		var status = "";

		for(i=1; i <= 10; i++){

			tags = i <= 2 ? ["one","two","three","four"]
				: i > 2 && i <= 5 ? ["one","two","three"]
				: i > 5 && i <= 8 ? ["one","two"]
				: ["one"];
			//arbitrary letters
			status = i <= 2 ? "P"
				: i > 2 && i <= 5 ? "R"
				: i > 5 && i <= 8 ? "S"
				: "C";

			arrayAppend( articles,
				{
					NAME = "article_#i#",
					N = i,
					TAGS = tags,
					STATUS = status
				}
			);
		}
		return articles;
	}
 </cfscript>

</cfcomponent>

