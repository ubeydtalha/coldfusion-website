<cfcomponent><cfsetting enablecfoutputonly="yes">

	<cffunction name="cfcToMCDL" access="public" returnType="string" output="no"
		hint="Returns MCDL document representing the specified component">

		<cfargument name="component" type="any" required="yes"
			hint="component object">
			
		<!--- workaround for bug 33171 --->
		<cfif not IsDefined( 'getancestors' )>
			<cfinclude template="_component_utils.cfm">
		</cfif>
		<cfset cd = GetMetadata(component)>
		<cfinclude template="_component_cfcToMCDL.cfm">
		<cfreturn out>
	</cffunction>


	<cffunction name="cfcToHTML" access="public" returnType="string" output="no"
		hint="Returns HTML document representing the specified component">
		
		<cfargument name="component" type="any" required="yes"
			hint="component object">
			
		<!--- workaround for bug 33171 --->
		<cfif not IsDefined( 'getancestors' )>
			<cfinclude template="_component_utils.cfm">
		</cfif>
		<cfset cd = GetMetadata(component)>
		<cfsavecontent variable="out">
			<cfinclude template="_component_cfcToHTML.cfm">
		</cfsavecontent>
		<cfreturn out>
	</cffunction>
	
<cfsetting enablecfoutputonly="no"></cfcomponent>