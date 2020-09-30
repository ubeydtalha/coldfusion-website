<cfsetting enablecfoutputonly="yes">

<cfparam name="url.refreshCache" default="no" type="boolean">
<cfscript>
	explorer = CreateObject( "component", "CFIDE.componentutils.cfcexplorer" ) ;
	cfcs = explorer.getcfcs(url.refreshCache) ;
	
	packages = StructNew() ;
	for ( i=1; i lte ArrayLen(cfcs); i=i+1 ) {
		if ( not StructKeyExists( packages, cfcs[i].package ) ) {
			packages[cfcs[i].package] = '' ;
		}
	}
	packages = structKeyArray(packages) ;
	arraySort(packages,"textnocase") ;
	
</cfscript>


<cfoutput><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>List of packages</title>
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

<a href="componentlist.cfm" target="ComponentList">[all components]</a>
<a href="packagelist.cfm?refreshCache=yes">[refresh]</a>
<br>
<br>
<b>Packages</b><br><br>
<cfloop index="i" from="1" to="#ArrayLen(packages)#">
<a href="componentlist.cfm?package=#packages[i]#" target="ComponentList"><cfif packages[i] eq ''>[root]<cfelse>#packages[i]#</cfif></a><br>
</cfloop>

</body>
</html>
</cfoutput>
<cfsetting enablecfoutputonly="no">
