<cfinterface>
	<cffunction name="sync" access="public" returntype="any">
		<cfargument name="operations" type="array" required="true">
		<cfargument name="clientobjects" type="array" required="true">
		<cfargument name="originalobjects" type="array" required="false">
	</cffunction>
	
</cfinterface>