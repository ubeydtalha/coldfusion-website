component output="false" accessors="true"{

	/**
	* use getAggregationOutput() to access the underlying Java object returned by MongoDB. See javadocs for available methods on that object
	*/
	property name="aggregationOutput" hint="The com.mongodb.AggregationOutput object returned from the aggregate() method";

	function init( aggregationOutput, mongoUtil ){
		variables.documents = "";
		structAppend( variables, arguments );
		return this;
	}

	/**
	* Converts all cursor elements into a ColdFusion structure and returns them as an array of structs.
	*/
	function asArray(){
		if( isSimpleValue(variables.documents) ){
			variables.documents = [];
			var cursor = aggregationOutput.results();
			for( var dbo in cursor ){
				arrayAppend( variables.documents, mongoUtil.toCF(dbo) );
			}
		}
		return variables.documents;
	}

	/**
	* Returns the structs representing the original aggregation command as a ColdFusion structure
	*/
	function getCommand(){
		return mongoUtil.toCF( aggregationOutput.getCommand() );
	}

}