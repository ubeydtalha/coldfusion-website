<cfscript>
	ancestors = GetAncestors(cd) ;
	methods = GetMethods(ancestors) ;
	properties = GetProperties(ancestors) ;
</cfscript>

<cfset out = "">

<cfset nl = Chr(13) & Chr(10)>
<cfset out = out & "<?xml version=""1.0"" encoding=""UTF-8""?>" & nl>


<!--- COMPONENT  --->

<cfset attrs = "">
<cfloop collection="#cd#" item="attrName">
	<cfif not ListFindNoCase( "extends,functions", attrName ) and IsSimpleValue( cd[attrName] )>
		<cfset attrs = attrs & " " & LCase(attrName) & "=""" & cd[attrName] & """">
	</cfif>
</cfloop>
<cfif IsDefined( 'cd.extends.name' )>
	<cfset attrs = attrs & " extends=""#cd.extends.name#""">
</cfif>

<cfset out = out & "<component" & attrs & ">" & nl>


<!--- DOCUMENTATION --->

<!--- !!!! path temporarily not supported
<cfset htmlSrc = cd.path & "?method=cfcToHTML">
<cfset xmlSrc = cd.path & "?method=cfcToWDDX">
<cfset out = out & "	<documentation htmlSrc=""#htmlSrc#"" xmlSrc=""#xmlSrc#"" />" & nl>
--->

<!--- PROPERTIES --->
<cfloop collection="#properties#" item="propName">
	<cfset property = properties[propName].metadata>
	<cfset implementedIn = properties[propName].implementedIn>
	<cfset attrs = "">
 	<cfloop collection="#property#" item="attrName">
		<cfif IsSimpleValue( property[attrName] )>
			<cfset attrs = attrs & " " & LCase(attrName) & "=""" & property[attrName] & """">
		</cfif>
	</cfloop>
	<cfset attrs = attrs & " implementedin=""#implementedIn#""">

	<cfset out = out & "	<property" & attrs & "/>" & nl>
</cfloop>


<!--- METHODS --->

<cfloop collection="#methods#" item="methodName">
	<cfset method = methods[methodName].metadata>
	<cfset implementedIn = methods[methodName].implementedIn>
	
	<cfset attrs = "">
	<cfloop collection="#method#" item="attrName">
		<cfif not ListFindNoCase( "parameters", attrName ) and IsSimpleValue( method[attrName] )>
			<cfset attrs = attrs & " " & LCase(attrName) & "=""" & method[attrName] & """">
		</cfif>
	</cfloop>
	<cfset attrs = attrs & " implementedin=""#implementedIn#""">

	<cfset out = out & "	<method" & attrs & ">" & nl>


	<!--- PARAMETERS --->

	<cfloop index="j" from="1" to="#ArrayLen(method.parameters)#">
		<cfset param = method.parameters[j]>
		<cfset attrs = "">
		<cfloop collection="#param#" item="attrName">
			<cfif IsSimpleValue( param[attrName] )>
				<cfset attrs = attrs & " " & LCase(attrName) & "=""" & param[attrName] & """">
			</cfif>
		</cfloop>
		
		<cfset out = out & "		<parameter" & attrs & " />" & nl>

	</cfloop>

	<cfset out = out & "	</method>" & nl>		 
	
</cfloop>


	
<cfset out = out & "</component>">


