<cfcomponent extends="BaseTestCase">

	<cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">
		<cfset variables.rootURL = "http://" & cgi.SERVER_NAME & ":" & cgi.SERVER_PORT & "/cfmongodb/examples/">
		<cfset debug(cgi)>

		<cfset paths = ["gettingstarted.cfm"
						, "aggregation/group.cfm"
						, "aggregation/mapReduce.cfm"
						, "aggregation/popularity.cfm"
						, "aggregation/aggregate.cfm"
						, "geospatial/geo.cfm"
						, "PeopleList/index.cfm"]>

		<cfset useJavaLoader = variables.factoryType eq "cfmongodb.core.JavaLoaderFactory" ? true : false>

	</cffunction>


	<cffunction name="all_examples_should_work" returntype="void" access="public">
		<cfset var httpResult = "">
		<cfset var path = "">
		<cfset var currentURL = "">

		<!---<cfset debug(factoryType)>
		<cfset debug(useJavaLoader)>--->
		<cfloop array="#paths#" index="path">
			<cfset currentURL = variables.rootURL & path>
			<cfhttp method="get" url="#currentURL#?reload=true&useJavaLoader=#useJavaLoader#" result="httpResult">
			<cfif httpResult.statusCode neq "200 OK">

				<cfset debug(httpResult.fileContent)>
				<cfset fail("For #currentURL#, path Expected 200 OK but received #httpResult.statusCode#.")>

			</cfif>
		</cfloop>

	</cffunction>

</cfcomponent>
