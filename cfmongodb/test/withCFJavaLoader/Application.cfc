<cfcomponent output="false" extends="cfmongodb.Application">

	<cfset this.name = "cfmongodb_cfjavaloader_tests">
	<cfset this.javaSetting = {loadPaths = ["/cfmongodb/lib"], reloadOnChange = false}>

</cfcomponent>