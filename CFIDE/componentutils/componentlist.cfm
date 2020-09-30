<cfsetting enablecfoutputonly="yes">

<cfscript>
	explorer = CreateObject( "component", "CFIDE.componentutils.cfcexplorer" ) ;
	cfcs = explorer.getcfcs(false) ;
	
	components = ArrayNew(1) ;
	for ( i=1; i lte ArrayLen(cfcs); i=i+1 ) {
		if ( not IsDefined( 'url.package' ) or cfcs[i].package eq url.package ) {
			ArrayAppend( components, ListLast(cfcs[i].name,'.') & ',' & cfcs[i].name ) ;
		}
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
<cfif IsDefined('url.package')>
	<b><cfif url.package eq ''>[root]<cfelse>#EncodeForHTML(url.package)#</cfif></b><br><br>
<cfelse>
	<b>All components</b><br><br>
</cfif>
<cfloop index="i" from="1" to="#ArrayLen(components)#">
<a href="componentdetail.cfm?component=#ListLast(components[i])#" target="ComponentDetail">#ListFirst(components[i])#</a><br>
</cfloop>

</body>
</html>
</cfoutput>
<cfsetting enablecfoutputonly="no">
