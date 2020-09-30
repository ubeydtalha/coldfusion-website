<cfscript>

	private function commonSetUp(){

		createUnitTestStructs();
	}

	private function createUnitTestStructs(){
		variables.types = {
			'number' = 100,
			'negativefloat' = -987.097654,
			'positivefloat' = 9654.5555555,
			'israd' = true,
			'stringwithnum' = 'string ending with 1',
			'numbers' = [1,2,3],
			'booleans' = [true, false],
			'floats' = [1.3,2.59870,-148.27654]
		};

		variables.doc = {
		    'name'='unittest',
		    'address' =  {
		       'street'='123 big top lane',
		       'city'='anytowne',
		       'state'='??',
		       'country'='USA'
		    },
		    'favorite-foods'=['popcicles','hot-dogs','ice-cream','cotton candy'],
			'types' = types
		  };
		structAppend( doc, types );
	}

	private function commonTeardown(){
		var delete = {"name"="unittest"};
		var atomicDelete = {};
		mongo.remove( delete, col );
		mongo.close();
	}

	private function createPeople( count=5, save="true", name="unittest" ){
		var i = 1;
		var people = [];
		for(i = 1; i LTE count; i++){
			var person = {
				"name"=name,
				"age"=randRange(10,100),
				"now"=getTickCount(),
				"counter"=i,
				inprocess=false
			};
			arrayAppend(people, person);
		}
		if(save){
			mongo.saveAll(people, col);
		}
		return people;
	}

</cfscript>
