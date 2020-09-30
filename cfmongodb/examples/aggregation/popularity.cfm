
<cfscript>
	dbName = "mongorocks";
	javaloaderFactory = createObject('component','cfmongodb.core.JavaloaderFactory').init();
	mongoConfig = createObject('component','cfmongodb.core.MongoConfig').init(dbName=dbName, mongoFactory=javaloaderFactory);
	mongo = createObject('component','cfmongodb.core.MongoClient').init(mongoConfig);

	collectionName = "articles";
	articles = mongo.getDBCollection( collectionName );

	//wipe out and start over
	//articles.remove({});

	numArticles = articles.count();
	writeOutput("Found #numArticles# articles<br>");

	//populate the articles collection if we need to
	if( numArticles eq 0 ){
		all = [];

		for( i = 1; i LTE 100; i++){

			//setting topics to a static value so that we can compare our results against a known answer
			if( i <= 25 ){
				topics = ["zoo","goo","foo","boo","bar"];
			}
			if( i > 25 && i <= 50 ){
				topics = ["zoo","goo","foo","boo"];
			}
			if( i > 50 && i <= 75 ){
				topics = ["zoo","goo","foo"];
			}
			if( i > 75 && i <= 90 ){
				topics = ["zoo","goo"];
			}
			if( i > 90 ){
				topics = ["zoo"];
			}

			article = {
				N = i,
				NAME = "article name #i#",
				TOPICS = topics
			};
			arrayAppend( all, article );

		}

		articles.saveAll( all );
		writeOutput("inserted #i-1# articles<br>");
	}

	//get an idea of what the data look like
	first = articles.find(sort={"N"=1},limit=5);
	writeDump( var=first.asArray(), label="first 5 articles", expand="false" );

	last = articles.find(sort={"N"=1},limit=5,skip=95);
	writeDump( var=last.asArray(), label="last 5 articles", expand="false" );

	numArticles = articles.count();

	map = "
		function(){
			this.TOPICS.forEach(
				function(z){
					emit( z, {count: 1} );
				}
			);
		}
	";

	reduce = "
		function(key, emits){
			var total = 0;

			for( var i in emits ){
				total += emits[i].count;
			}
			return {count: total};
		}
	";

	//finalize will run one time, at the end of the mapreduce cycle, for each 'key'
	finalize = "
		function( key, value ){
			value.rank = value.count / #numArticles#;
			value.processed = new Date();
			return value;
		}
	";

	result = articles.mapReduce( map=map, reduce=reduce, outputTarget="article_topic_rank", options={"finalize"=finalize} );

	writeDump(var=result, label="MapReduceResult object", expand="false");
	writeDump(var=result.asArray(), label="mapReduceResult as array... this is the entire article_topic_rank collection", expand="false");

	//now that the article_topic_rank is a full-fledged collection, we can query it just like any other collection:
	ranks = mongo.getDBCollection("article_topic_rank");
	sorted = ranks.find(sort={"value.count"=-1});
	writeDump(var=sorted.asArray(), label="Querying the map reduce output collection, sorting by most popular topics");

	mongo.close();

</cfscript>
