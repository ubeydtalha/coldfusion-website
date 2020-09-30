<!---
NOTE: a number of these unit tests run ensureIndex(). This is because Marc likes to run mongo with --notablescan during development, and queries
against unindexed fields will fail, thus throwing off the tests.

You should absolutely NOT run an ensureIndex on your columns every time you run a query!

 --->
<cfcomponent output="false" extends="BaseTestCase">
<cfscript>
import cfmongodb.core.*;


	function setUp(){
		col = 'people';
		dbCol = mongo.getDBCollection( col );

		atomicCol = 'atomictests';
		dbAtomicCol = mongo.getDBCollection( atomicCol );

		deleteCol = 'deletetests';
		dbDeleteCol = mongo.getDBCollection( deleteCol );

		siblingCol = 'siblingtests';
		dbSiblingCol = mongo.getDBCollection( siblingCol );
		siblingDbSiblingCol = mongo.getDBCollection( siblingCol, "cfmongodb_tests_sibling" );

		super.setUp();
	}

	function tearDown(){
		dbAtomicCol.remove({});
		dbSiblingCol.drop();
		siblingDbSiblingCol.drop();
		super.tearDown();
	}


	function getMongoDBCollection_should_return_underlying_java_DBCollection(){
		var jColl = dbCol.getMongoDBCollection();
		assertEquals("com.mongodb.DBApiLayer.mycollection", jColl.getClass().getCanonicalName());
	}

	function getMongoDBCollection_should_be_acceptably_fast(){
		var x = "";
		var collectionTS = getTickCount();
		for( x = 1; x LTE 1000; x++ ){
			dbCol.getMongoDBCollection();
			//dbCol.getNothing();
		}
		var collectionTotal = getTickCount() - collectionTS;
		assertTrue( collectionTotal LT 50, "collections should return instantaneously. Returned 1000 times in #collectionTotal#" );
	}

	/*    Here begins CRUD Tests   !*/

	/*     SAVE    */

	function save_should_add_id_to_doc(){
	  var id = dbCol.save( doc );
	  assert( NOT isSimpleValue(id) );
	  dbCol.remove( doc );
	}

	function save_should_update_existing(){
		var id = dbCol.save( doc );

		doc.somethingnew = getTickCount();
		dbCol.save( doc );
		assertEquals( id, doc["_id"] );
	}

	function saveAll_should_return_immediately_if_no_docs_present(){
		assertEquals( [], dbCol.saveAll([]) );
	}

	function saveAll_should_save_ArrayOfDBObjects(){
		var i = 1;
		var people = [];
		var u = mongo.getMongoUtil();
		var purpose = "SaveAllDBObjectsTest";
		for( i = 1; i <= 2; i++ ){
			arrayAppend( people, u.toMongo( {"name"="unittest", "purpose"=purpose} ) );
		}
		dbCol.saveAll( people );
		var result = dbCol.query().$eq("purpose",purpose).count();
		assertEquals(2,result,"We inserted 2 pre-created BasicDBObjects with purpose #purpose# but only found #result#");
	}

	function saveAll_should_save_ArrayOfStructs(){
		var i = 1;
		var people = [];
		var purpose = "SaveAllStructsTest";
		for( i = 1; i <= 2; i++ ){
			arrayAppend( people, {"name"="unittest", "purpose"=purpose} );
		}
		dbCol.saveAll( people );
		var result = dbCol.query().$eq("purpose",purpose).count();
		assertEquals(2,result,"We inserted 2 structs with purpose #purpose# but only found #result#");
	}



	/*    UPDATE    */
	function update_should_replace_found_with_updated_doc(){
	  var originalCount = dbCol.query().$eq('name', 'bill' ).count();
	  var doc = {
	    'name'='jabber-walkie',
	    'address' =  {
	       'street'='456 boom boom',
	       'city'='anytowne',
	       'state'='??',
	       'country'='USA'
	    },
	    'favorite-foods'=['munchies']
	  };


	  dbCol.save(doc);
	  var results = dbCol.query().startsWith('name','jabber').find();

	  var replace_this = results.asArray()[1];
	 // debug(replace_this);
	  replace_this['name'] = 'bill';
	  dbCol.update( replace_this );
	  results = dbCol.query().$eq('name', 'bill' ).find();
	 // debug(results.asArray());
	  var finalSize = results.size();
	  var writeResult = dbCol.remove( replace_this );

	  assertEquals(originalCount+1, finalSize, "results should have been 1 but was #results.size()#" );
	}

	function update_should_set_and_not_overwrite_when_$set_is_used(){
		var colName = "settest";
		var col = mongo.getDBCollection( colName );
		col.remove({});

		col.save({"one"=1, "two"=2});

		col.update( doc={"$set" = {"three"=3}}, query={"one"=1} );

		var all = col.find();
		var asArray = all.asArray();
		//debug(asArray);
		assertEquals( 1, all.size() );
		var doc = asArray[1];

		assertTrue( structKeyExists(doc, "one") );
		assertTrue( structKeyExists(doc, "two") );
		assertTrue( structKeyExists(doc, "three") );
		assertEquals( 3, doc.three );
	}

	// The following tests aren't technically necessary as they simply test mongodb itself and not cfmongodb; however, I have them here as examples of usage
	function update_should_increment_when_$inc_is_used(){
		var wesley = {"name" = "unittest", "lifeleft"=50, "torturemachine"=true};
		dbAtomicCol.save( wesley );

		var suckLifeOut = {"$inc" = {"lifeleft" = -1}};
		var victim = { "name" = "unittest", "torturemachine" = true};
		dbAtomicCol.update( doc = suckLifeOut, query = victim );

		var rugenVictim = dbAtomicCol.find({"torturemachine" = true}).asArray();
		//debug(rugenVictim);

		assertEquals(wesley.lifeleft-1, rugenVictim[1].lifeleft);
	}

	function update_should_unset_when_$unset_is_used(){
		var wesley = {"name" = "wesley", "lifeleft"=50, "torturemachine"=true};
		dbAtomicCol.save( wesley );
		var victim = {"name" = "wesley"};
		var noTorture = {"$unset" = {"torturemachine" = 1}};
		dbAtomicCol.update( doc=noTorture, query=victim);
		var luckyWesley = dbAtomicCol.find({"name" = "wesley"}).asArray()[1];
		assertFalse( structKeyExists(luckyWesley, "torturemachine"), "torturemachine should not have existed but did" );
	}

	function update_should_push_when_$push_is_used(){
		var wesley = {"name" = "wesley", "lifeleft"=50};
		dbAtomicCol.save( wesley );
		var victim = {"name" = "wesley"};
		var newFriend = {"$push" = {"friends" = "Inigo"}};
		dbAtomicCol.update( doc=newFriend, query=victim );
		newFriend = {"$push" = {"friends" = "Giant"}};
		dbAtomicCol.update( doc=newFriend, query=victim );
		var luckyWesley = dbAtomicCol.find({"name" = "wesley"}).asArray()[1];
		assertEquals( 2, arrayLen(luckyWesley.friends) );
	}

	function update_should_pushAll_when_$pushAll_is_used(){
		var wesley = {"name" = "wesley", "lifeleft"=50};
		dbAtomicCol.save( wesley );
		var victim = {"name" = "wesley"};
		var newFriends = {"$pushAll" = {"friends" = ["Inigo", "Giant"]}};
		dbAtomicCol.update( doc=newFriends, query=victim );
		var luckyWesley = dbAtomicCol.find({"name" = "wesley"}).asArray()[1];
		assertTrue( structKeyExists(luckyWesley, "friends") and isArray(luckyWesley.friends) );
		assertEquals( 2, arrayLen(luckyWesley.friends) );
	}

	function update_should_addToSet_when_$addToSet_is_used(){
		var wesley = {"name" = "wesley", "lifeleft"=50, "friends" = ["Inigo"]};
		dbAtomicCol.save( wesley );
		var victim = {"name" = "wesley"};
		var newFriends = {"$addToSet" = {"friends" = { "$each" = ["Giant", "Inigo"] } }};
		dbAtomicCol.update( doc=newFriends, query=victim );
		var luckyWesley = dbAtomicCol.find({"name" = "wesley"}).asArray()[1];
		//debug(luckyWesley);
		assertTrue( structKeyExists(luckyWesley, "friends") and isArray(luckyWesley.friends) );
		assertEquals( 2, arrayLen(luckyWesley.friends), "should only be two friends because addToSet will only add if the value isn't present in the array" );
	}



	/*     FIND     */

	function search_should_honor_criteria(){
	  var initial = dbCol.query().startsWith('name','unittest').find().asArray();
	  //debug(initial);

	  var addNew = 5;
	  var people = createPeople( addNew, true );
	  var afterSave = dbCol.query().startsWith('name','unittest').find().asArray();

	  assertEquals( arrayLen(afterSave), arrayLen(initial) + addNew );
	}


	function search_sort_should_be_applied(){
		var totalPeople = 5;
		var people = createPeople(totalPeople, true);
		var asc = dbCol.query().$eq("name", "unittest").find(sort={"counter"=1});
		var desc = dbCol.query().$eq("name", "unittest").find(sort={"counter"=-1});

		var ascResults = asc.asArray();
		var descResults = desc.asArray();
		//debug( desc.getQuery().toString() );
		//debug( desc.getSort().toString() );

		//assertTrue( NOT find("1.0", asc.getSort().toString()), "1 and -1 should remain as integers in the sort object" );
		//assertTrue( NOT find("-1.0", desc.getSort().toString()), "1 and -1 should remain as integers in the sort object" );

		assertEquals( 1, ascResults[1].counter );
		assertEquals( 5, ascResults[5].counter );
		assertEquals( ascResults[1].age, descResults[ totalPeople ].age  );
	}

	function search_limit_should_be_applied(){
		var people = createPeople(5, true);
		var limit = 2;

		var full = dbCol.query().$eq("name", "unittest").find();
		var limited = dbCol.query().$eq("name", "unittest").find(limit=limit);
		assertEquals(limit, limited.size());
		assertTrue( full.size() GT limited.size() );
	}

	function search_skip_should_be_applied(){
		var people = createPeople(5, true);
		var skip = 1;
		var full = dbCol.query().$eq("name", "unittest").find();
		var skipped = dbCol.query().$eq("name", "unittest").find(skip=skip);

		assertEquals(full.asArray()[2] , skipped.asArray()[1], "lemme splain, Lucy: since we're skipping 1, then the first element of skipped should be the second element of full" );
	}

	function findById_should_return_doc_for_id(){
		var id = dbCol.save( doc );

		var fetched = dbCol.findById( id.toString() );
		assertEquals(id, fetched._id.toString());
	}

	function find_should_return_results_for_mongo_id_in_other_document(){
		var id = dbCol.save( doc );
		var newDoc = { 'name' = 'unittest', 'someidstring' = id.toString(), 'someidobject' = id };
		dbCol.save( newDoc );

		//search by the field containing the string version of the id
		var withStringResult = dbCol.find( {"someidstring" = id.toString()} );
		assertEquals( 1, arrayLen(withStringResult.asArray()) );
		assertEquals( newDoc._id, withStringResult.asArray()[1]._id );

		//search by the field containing the object ID, using dbcol.find()
		var withObjectResult = dbCol.find( {"someidobject" = id} );
		assertEquals( 1, arrayLen(withObjectResult.asArray()) );
		assertEquals( newDoc._id, withObjectResult.asArray()[1]._id );

		//search by the field containing the object ID, using dbcol.query().$eq().find
		var withObjectResultUsingEq = dbCol.query().$eq( "someidobject", id ).find();
		assertEquals( 1, arrayLen(withObjectResultUsingEq.asArray()) );
		assertEquals( newDoc._id, withObjectResultUsingEq.asArray()[1]._id );

	}

	function find_should_be_equivalent_to_search(){
		var people = createPeople(5, true);
		var fullViaQuery = dbCol.query(col).$eq("name", "unittest").find();
		var fullViaFind = dbCol.find( {"name"="unittest"} );
		assertEquals( arrayLen(fullViaQuery.asArray()), arrayLen(fullViaFind.asArray()) );
	}

	function find_should_handle_datatypes_correctly(){
		var people = createPeople(5, true);
		var one = dbCol.find( {"counter"=3} );
		//debug(one);
		assertEquals(1, one.size());
		var doc = one.asArray()[1];
		assertEquals( 3, doc.counter );
	}

	function find_should_handle_asString_correctly() {
		var people = createPeople(5, true, "unittest", true);
		var all = dbCol.find({"counterAsString"= 1});
		//expect no results because it's searching as a number
		assertEquals(0, all.size());
		var all = dbCol.find({"counterAsString"= mongo.getMongoUtil().asString("1")});
		//expect 1 result because it's searching as a string
		assertEquals(1, all.size());
	}

	function find_should_handle_all_types_correctly() {
		var people = createPeople(5, true, "unittest", true);
		//make sure there is 5 double
		all = dbCol.find( {"$and"= [{"name"="unittest"},
										{"networth"={"$exists"=1}},
										{"networth"={"$type"=1}}]} ); //type 1 is double
		assertEquals(5, all.size());

		//make sure there is 5 integer
		all = dbCol.find( {"$and"= [{"name"="unittest"},
									{"age"={"$exists"=1}},
									{"age"={"$type"=16}}]} ); //type 16 is integer
		assertEquals(5, all.size());

		//make sure there is 5 string for "ageAsString"
		all = dbCol.find( {"$and"= [{"name"="unittest"},
									{"ageAsString"={"$exists"=1}},
									{"ageAsString"={"$type"=2}}]} ); //type 2 is string
		assertEquals(5, all.size());

		//make sure there is 5 string for "networthAsString"
		all = dbCol.find( {"$and"= [{"name"="unittest"},
									{"networthAsString"={"$exists"=1}},
									{"networthAsString"={"$type"=2}}]} ); //type 2 is stirng
		assertEquals(5, all.size());
	}

	function find_should_honor_including_fields(){
		var people = createPeople(5, true);
		//guard
		var all = dbCol.find( limit=5 ).asArray();
		assertTrue( structKeyExists(all[1], "age") );

		//test for 'inclusive' keys
		var some = dbCol.find( limit=5, keys="counter,name" ).asArray();
		assertFalse( structKeyExists(some[1], "age") );
		assertTrue( structKeyExists(some[1], "counter") );
		assertTrue( structKeyExists(some[1], "name") );
	}

	function find_should_honor_excluding_fields(){
		var people = createPeople(5, true);

		//test for exclude keys
		var some = dbCol.find( limit=5, keys="counter=0,now=0" ).asArray();
		assertFalse( structKeyExists(some[1], "counter") );
		assertFalse( structKeyExists(some[1], "now") );
		assertTrue( structKeyExists(some[1], "age") );
		assertTrue( structKeyExists(some[1], "name") );
	}

	function findOne_should_return_first_found_document(){
		var people = createPeople(1, true);
		var one = dbcol.findOne({"name" = "unittest"});
		assertEquals( "unittest", one.name );
	}

	function findOne_returns_first_document_when_using_id_field(){
		//test Chris Blackwell's weird condition where it was choosing the findOne(Object obj) method instead of findOne(DBObject query)
		dbCol.save({"name"="unittest", "id"=5, "i"=1});
		dbCol.save({"name"="unittest", "id"=6, "i"=2});
		var result = dbCol.findOne({"id"=5});
		debug(result);
		assertEquals( 1, result.i );
	}

	function findOne_should_return_null_when_no_records_found() {
		var none = dbCol.findOne({"name"="doesn'texist"});
		assertTrue( isNull( none ) );
	}

	function find_should_return_empty_array_when_no_records_found() {
		var none = dbCol.find({"name"="doesn'texist"});
		assertTrue( arrayIsEmpty(none.asArray()) );
	}

	function findAndModify_should_atomically_update_and_return_new(){
		var collection = "atomictests";
		var dbAtomicCol = mongo.getDBCollection(collection);
		var count = 5;
		var people = createPeople(count=count, save="false");
		dbAtomicCol.ensureIndex(["INPROCESS"]);
		dbAtomicCol.saveAll(people);


		//get total inprocess count
		var inprocess = dbAtomicCol.query().$eq("INPROCESS",false).find().size();

		//guard
		assertEquals(count, arrayLen(people));
		var query = {inprocess=false};
		var update = {"$set" = {inprocess=true, started=now(), owner=cgi.SERVER_NAME}};
		var new = dbAtomicCol.findAndModify(query=query, update=update);

		assertTrue( structKeyExists(new, "age") );
		assertTrue( structKeyExists(new, "name") );
		assertTrue( structKeyExists(new, "now") );
		assertTrue( structKeyExists(new, "started") );
		assertEquals( true, new.inprocess );
		assertEquals( cgi.SERVER_NAME, new.owner );

		var newinprocess = dbAtomicCol.query().$eq("INPROCESS",false).find();

		assertEquals(inprocess-1, newinprocess.size());
	}

	function group_should_honor_optional_command_parameters(){
		var collection = "groups";
		var dbGroupsCol = mongo.getDBCollection(collection);
		dbGroupsCol.remove({});

		dbGroupsCol.ensureIndex(fields=["ACTIVE"]);

		var groups = [
			{STATUS="P", ACTIVE=1, ADDED=now()},
			{STATUS="P", ACTIVE=1, ADDED=now()},
			{STATUS="P", ACTIVE=0, ADDED=now()},
			{STATUS="R", ACTIVE=1, ADDED=now()},
			{STATUS="R", ACTIVE=1, ADDED=now()}
		];
		dbGroupsCol.saveAll( groups );
		var groupResult = dbGroupsCol.group( "STATUS", {TOTAL=0}, "function(obj,agg){ agg.TOTAL++; }"  );

		assertEquals( arrayLen(groups), groupResult[1].TOTAL + groupResult[2].TOTAL, "Without any query criteria, total number of results for status should match total number of documents in collection" );

		//add a criteria query
		var groupResult = dbGroupsCol.group( "STATUS", {TOTAL=0}, "function(obj,agg){ agg.TOTAL++; }", {ACTIVE=1}  );
		assertEquals( arrayLen(groups)-1, groupResult[1].TOTAL + groupResult[2].TOTAL, "Looking at only ACTIVE=1 documents, total number of results for status should match total number of 'ACTIVE' documents in collection" );

		//add a finalize function
		groupResult = dbGroupsCol.group( keys="STATUS", initial={TOTAL=0}, reduce="function(obj,agg){ agg.TOTAL++; }", finalize="function(out){ out.HI='mom'; }"  );
		assertTrue( structKeyExists(groupResult[1], "HI"), "output group should have contained the key added by finalize but did not" );

		//use the keyf function to create a composite key
		groupResult = dbGroupsCol.group( keys="", initial={TOTAL=0}, reduce="function(obj,agg){ agg.TOTAL++; }", keyf="function(doc){ return {'TASK_STATUS' : doc.STATUS }; }"  );
		//debug(groupResult);

		//TODO: get a better example of keyf
		assertTrue( structKeyExists(groupResult[1], "TASK_STATUS"), "Key should have been TASK_STATUS since we override the key in keyf function" );
	}
	function distinct_should_return_array_of_distinct_values(){
		var collection = "distincts";
		var dbDistinctCol = mongo.getDBCollection(collection);
		var all = [
			{val=1, i='a'},
			{val=1, i='a'},
			{val=2, i='a'},
			{val=1, i='a'},
			{val=100, i='b'}
		];
		dbDistinctCol.remove({});
		var initial = dbDistinctCol.distinct("VAL");
		assertEquals(0,arrayLen(initial));

		dbDistinctCol.saveAll( all );
		var distincts = dbDistinctCol.distinct("VAL");
		assertEquals(1, distincts[1]);
		assertEquals(2, distincts[2]);
		assertEquals(100, distincts[3]);

		var filteredDistincts = dbDistinctCol.distinct("VAL", {i='b'});
		assertEquals( 1, arrayLen(filteredDistincts) );
		assertEquals( 100, filteredDistincts[1] );
	}


	function count_should_consider_query(){
		createPeople(2, true, "not unit test");

		dbCol.ensureIndex(["nowaythiscolumnexists"]);
		var allresults = dbCol.query().find();
		//debug(allresults.size());
		var all = dbCol.query().count();
		assertTrue( all GT 0 );

		var none = dbCol.query().$eq("nowaythiscolumnexists", "I'm no tree... I am an Ent!").count();
		//debug(none);
		assertEquals( 0, none );

		var people = createPeople(2, true);

		var some = dbCol.query().$eq("name", "unittest").count();
		all = dbCol.query().count();
		assertTrue( some GTE 2 );
		assertTrue( some LT all, "Some [#some#] should have been less than all [#all#]");

		var one = dbCol.count({"name"="unittest", "counter"=2}, "Since all unit test people are deleted before each test, there should only be a single unit test person with counter of 2 since we created 2 in this test");
		assertEquals( 1, one );
	}


	/*    DELETE    */

	function delete_should_delete_document_with_id(){
	  dbDeleteCol.drop();
	  dbDeleteCol.ensureIndex(["somenumber"]);
	  dbDeleteCol.ensureIndex(["name"]);
	  var doc = {
	    'name'='delete me',
		'somenumber' = 1,
	    'address' =  {
	       'street'='123 bye bye ln',
	       'city'='where-ever',
	       'state'='??',
	       'country'='USA'
	    }
	  };

	  doc['_id'] = dbDeleteCol.save( doc );

	  results = dbDeletecol.query().$eq('somenumber',1).find();

	  var writeResult = dbDeleteCol.remove( doc );
	  results = dbDeletecol.query().$eq('name','delete me').find();
	  assertEquals( 0, results.size() );
	}

	/*    INDEXES    */

	function getIndexes_should_return_indexes_for_collection(){
		var result = dbCol.dropIndexes();
		//guard
		assertEquals( 1, arrayLen(result), "always an index on _id" );

		dbCol.ensureIndex(fields=["name"]);
		dbCol.ensureIndex(fields=[{"name"=1}, {"address.state"=-1}]);
		result = dbCol.getIndexes();

		assertTrue( arrayLen(result) GT 1, "Should be at least 2: 1 for the _id, and one for the index we just added");
	}

	function ensureIndex_should_create_index(){
		dbCol.dropIndexes();
		local.indexesStart = dbCol.getIndexes();

		dbCol.ensureIndex(fields=["newfield"],name="newfield")
		local.indexesAfter = dbCol.getIndexes();

		assertEquals( arraylen(local.indexesAfter), arraylen(local.indexesStart)+1, "Indexes length should be incremented" );
	}

	function ensureIndex_should_create_multikey_index_in_specified_order(){
		dbCol.dropIndexes();

		local.fields = ["field_1", "field_2", "field_3"];

		dbCol.ensureIndex(fields=local.fields,name="multikeytest");
		local.indexes = dbCol.getIndexes();
		local.index = local.indexes[2];

		var i = 1;
		for (var key in local.index["key"]){
			assertEquals( local.fields[i], key, "Key should be in proper position in index" );
			i++;
		}
	}

	function ensureIndex_sparse_creates_sparse_index(){
		dbCol.dropIndexes();

		dbCol.ensureIndex(fields=["somethingsparse"],name="sparsetest",sparse=true);
		local.indexes = dbCol.getIndexes();
		local.index = local.indexes[2];

		assertTrue( local.index["sparse"], "index should be sparse" );
	}

	function ensureIndex_unique_creates_unique_index(){
		dbCol.dropIndexes();

		dbCol.ensureIndex(fields=["somethingunique"],name="uniquetest",unique=true,sparse=true);
		local.indexes = dbCol.getIndexes();
		local.index = local.indexes[2];

		assertTrue( local.index["unique"], "index should be unique" );
	}

	function ensureIndex_uses_specified_name(){
		var indexname = "obiwankenobi";

		dbCol.dropIndexes();

		dbCol.ensureIndex(fields=["someindex"],name=indexname);
		local.indexes = dbCol.getIndexes();
		local.index = local.indexes[2];

		assertEquals( indexname, local.index["name"], "index should have correct name" );
	}

	private function getIndexesFailOverride(){
		throw("authentication failed");
	}


	/*    SISTER DB TEST   */
	function getSiblingDB_returns_collection_from_sibling_db(){
		var testdocs = [
			{ "name"="test1" },
			{ "name"="test2" },
			{ "name"="test3" },
			{ "name"="test4" }
		];

		// insert test docs into sibling database's collection
		siblingDbSiblingCol.saveAll(testdocs);

		local.thiscount = dbSiblingCol.count();
		local.siblingcount = siblingdbSiblingCol.count();

		assertTrue(local.thiscount eq 0, "Local sibling collection should have no docs, has #local.thiscount#.");
		assertTrue(local.siblingcount eq 4, "Sibling collection should have 4 docs, has #local.siblingcount#.");
		assertTrue(local.thiscount neq local.siblingcount, "Local sibling collection should have no docs, sibling should have 4.");
	}


	private function flush(){
		//forces mongo to flush
		mongo.getMongoDB().getLastError();
	}
 </cfscript>


</cfcomponent>

