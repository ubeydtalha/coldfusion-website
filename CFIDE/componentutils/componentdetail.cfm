<cfsetting enablecfoutputonly="yes">

<cfif IsDefined( 'url.component' )>

	<cfparam name="url.component" type="string">
	<cfscript>
		explorer = CreateObject( "component", "CFIDE.componentutils.cfcexplorer" ) ;
		explorer.getcfcinhtml(url.component) ;
	</cfscript>

<cfelse>

	<cfscript>
		explorer = CreateObject( "component", "CFIDE.componentutils.cfcexplorer" ) ;
		cfcs = explorer.getcfcs(false) ;
		
		components = ArrayNew(1) ;
		for ( i=1; i lte ArrayLen(cfcs); i=i+1 ) {
			ArrayAppend( components, cfcs[i].name ) ;
		}
		ArraySort( components, "textnocase" ) ;
	</cfscript>
	
	<cfoutput><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
	<title>List of components</title>
	<style>
	body  {
		font-family: verdana, arial, helvetica, sans-serif;
		background-color: ##FFFFFF;
		font-size: 11px;
		margin-top: 10px;
		margin-left: 10px;
	}
	</style>
	</head>
	<body>
	<b>All components</b><br><br>
	<cfloop index="i" from="1" to="#ArrayLen(components)#">
	<a href="componentdetail.cfm?component=#components[i]#">#components[i]#</a><br>
	</cfloop>
	
	</body>
	</html>
	</cfoutput>
	<cfsetting enablecfoutputonly="no">

</cfif>
