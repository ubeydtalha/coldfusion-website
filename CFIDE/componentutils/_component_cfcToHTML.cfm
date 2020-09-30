<cfscript>
	isTypeInterface  = IsInterface(cd);

	if (isTypeInterface) {
		ancestors = GetInterfaceAncestors(cd);
		componentType = "Interface"	;
		methods = StructNew();
		methods = GetInterfaceMethods(cd,methods,true);
		properties = StructNew();
		interfaces = ArrayNew(1);
	}
	else {
		ancestors = GetAncestors(cd) ;
		componentType = "Component";
		methods = GetMethods(ancestors) ;
		properties = GetProperties(ancestors) ;
		interfaces = GetImplementedInterfaces(cd);
		
	}

	implementedMethodList = '' ;
	inheritedMethodList = '' ;
	baseMethodList = '' ;

	for ( name in methods ) {
		if ( methods[name].implementedIn eq cd.name )
			implementedMethodList = ListAppend( implementedMethodList, name ) ;
		else if ( methods[name].implementedIn eq 'web-inf.cftags.component' )
			baseMethodList = ListAppend( baseMethodList, name ) ;
		else
			inheritedMethodList = ListAppend( inheritedMethodList, name ) ;
	}

</cfscript>


<cfoutput><html>
<head>
<title>#componentType# #ListLast(cd.name,'.')#</title>
<cfinclude template="_component_style.cfm">
</head>
<body style="padding-bottom : 800px;">
</cfoutput>

<!--- <cfdump var="#cd#"> --->

<!--- NAME (header) --->

<cfoutput>
<font size="-2">#cd.name#</font><br>
<font size="+1"><b>#componentType# #ListLast(cd.name,'.')#
<cfif StructKeyExists(cd,"displayName") and cd.displayName neq cd.name>(#cd.displayName#)</cfif>
</b></font>
</cfoutput>

<!--- HIERARCHY and PATH--->

<cfoutput>
<br><br><br>
<table>
</cfoutput>
<cfif not isTypeInterface>
<tr><td>hierarchy:</td><td>
	<cfloop index="i" from="1" to="#ArrayLen(ancestors)#">

		<cfoutput>#RepeatString('&nbsp;',(i-1)*6)##GetLinkForType(ancestors[i].name, "LONG")#<br></cfoutput>
		<cfset i=i+1>

	</cfloop>
<cfelse>
<tr><td>extends:</td><td>
	<cfset parentStr = "">
	<cfloop index="i" from="1" to="#ArrayLen(ancestors)#">
		<cfif i neq 1>
			<cfset parentStr = parentStr & ",">
		</cfif>
		<cfset parentStr = parentStr & #GetLinkForType(ancestors[i].name, "LONG")#>
	</cfloop>
	<cfoutput>#parentStr#</cfoutput>
</cfif>
<cfoutput>
</td></tr>
<cfset numInterfaces = ArrayLen(interfaces)>
<cfif numInterfaces gt 0 >
	<tr>
		<td>Implements:</td>
		<td>
			<cfset tmpStr="">
			<cfloop index="i" from="1" to="#numInterfaces#">
				<cfif i neq 1>
					<cfset tmpStr = tmpStr & ",">
				</cfif>
				<cfset tmpStr = tmpStr & #GetLinkForType(interfaces[i].name, "LONG")#>
			</cfloop>
			<cfoutput>#tmpStr#</cfoutput>
		</td>
	</tr>
</cfif>
<tr><td>path:</td>
	<td>#cd.path#</td>
</tr>

<tr><td>serializable:</td>
	<td><cfif StructKeyExists( cd, 'serializable' )>#YesNoFormat(cd.serializable)#
            	<cfelse>Yes
			</cfif></td>
</tr>
</cfoutput>



<!--- DESCRIPTION --->

<cfoutput>
<cfif StructKeyExists(cd,"hint")><p>#cd.hint#</p></cfif>

<tr><td>properties:</td>

	<cfset list = ''>
	<cfloop list="#ListSort(StructKeyList(properties),'TEXTNOCASE')#" index="propName">
	<cfset list = listAppend(list, ' <a href="##property_#propName#">#propName#</a>')>
	</cfloop><br>
	<td>#list#</td>
</tr>

<cfif not isTypeInterface>
<tr><td>final:</td>

	 
	 <td><cfif StructKeyExists( cd, 'FINAL' )>#cd.FINAL#
            	<cfelse>false
			</cfif></td>
			
</tr>
</cfif>

<cfif not isTypeInterface>
<tr><td>abstract:</td>

	 
	 <td><cfif StructKeyExists( cd, 'ABSTRACT' )>#cd.ABSTRACT#
            	<cfelse>false
			</cfif></td>
			
</tr>
</cfif>

<tr><td>methods:</td>

	<cfset list = ''>
	<cfloop list="#ListSort(implementedMethodList,'TEXTNOCASE')#" index="methodName">
	<cfset curMethod = methods[methodName].metadata>
	<cfset item = ' <a href="##method_#methodName#">#methodName#</a>'>
	<cfif StructKeyExists( curMethod, 'access' ) and curMethod.access is 'private'>
		<cfset item = item & '*'>
	</cfif>
	<cfset list = ListAppend( list, item )>
	</cfloop>
	<td>#list#</td>
</tr>
<cfif ListLen(inheritedMethodList)>
<tr><td>inherited methods:</td>
	<cfset list = ''>
	<cfloop list="#ListSort(inheritedMethodList,'TEXTNOCASE')#" index="methodName">
	<cfset implementedIn = methods[methodName].implementedIn>
	<cfset list = ListAppend( list, ' ' & GetLinkForMethod( methodName, implementedIn ) )>
	</cfloop>
	<td>#list#</td>
</tr>
</cfif>
<cfif ListLen(baseMethodList)>
<tr><td>base methods:</td>

	<cfset list = ''>
	<cfloop list="#ListSort(baseMethodList,'TEXTNOCASE')#" index="methodName">
	<cfset implementedIn = methods[methodName].implementedIn>
	<cfset list = ListAppend( list, ' ' & GetLinkForMethod( methodName, implementedIn ) )>
	</cfloop>
	<td></td>
</tr>
</cfif>

<cfif StructKeyExists(cd,"documentation")>
	<cfif StructKeyExists( cd.documentation, "htmlSrc" )><tr><td>html document:</td><td><a href="#cd.documentation.htmlSrc#">#cd.documentation.htmlSrc#</a></td></tr></cfif>
	<cfif StructKeyExists( cd.documentation, "xmlSrc" )><tr><td>xml document:</td><td><a href="#cd.documentation.xmlSrc#">#cd.documentation.xmlSrc#</a></td></tr></cfif>
</cfif>

</table>
<font size="-2">* - private method</font>
</cfoutput>

<!--- PROPERTIES --->
<cfif StructCount(properties)>
<cfoutput>
<br><br><table>
<tr>
	<th>Property</th>
	<th>Hint</th>
	<th>Type</th>
	<th>Req.</th>
	<th>Implemented In</th>
	<th>Default Value</th>
    <th>Serializable</th>
</tr>
<cfloop list="#ListSort(StructKeyList(properties),'TEXTNOCASE')#" index="propName">
	<cfset prop = properties[propName].metadata>
	<cfset implementedIn = properties[propName].implementedIn>
	<tr>
		<td><a name="property_#prop.name#"><b>#prop.name#</b></a>
			<cfif StructKeyExists( prop, 'displayName' ) and prop.displayName neq prop.name>(#prop.displayName#)</cfif></td>
		<td><cfif StructKeyExists( prop, 'hint' )>#prop.hint#</cfif></td>
		<td><cfif StructKeyExists( prop, 'type' )>
				#GetLinkForType( prop.type, "SHORT" )#
			</cfif></td>
		<td><cfif StructKeyExists( prop, 'required' )>#YesNoFormat(prop.required)#</cfif></td>
		<td>#GetLinkForType( implementedIn, "SHORT" )#
		<!--- <cfif implementedIn eq cd.name><i>this</i><cfelse>
			<a href="#GetURLToViewer( implementedIn, '' )#">#GetShortComponentName(implementedIn,cd.name)#</a>

		</cfif> ---></td>
		<td><cfif StructKeyExists( prop, 'default')>
				<cfif IsSimpleValue(prop.default)>
					#prop.default#
				<cfelse>
					{complex value}
				</cfif>
			<cfelse>
				-
			</cfif></td>
            <td><cfif StructKeyExists( prop, 'serializable' )>#YesNoFormat(prop.serializable)#
            	<cfelse>Yes
			</cfif></td>
		</tr>
</cfloop>
</table>
</cfoutput>
</cfif>



<!--- METHODS --->

<cfset colspan="1">
<cfoutput>
<br><br><table>
<!--- <tr><th colspan="#colspan#">Methods</th></tr> --->
<cfloop list="#ListSort( implementedMethodList,'TEXTNOCASE')#" index="methodName">

	<cfset method = methods[methodName].metadata>

	<!--- method header --->

	<tr><th align="left" colspan="#colspan#">
		<a name="method_#method.name#">#method.name#</a><cfif StructKeyExists( method, 'access' ) and method.access is 'private'>*</cfif>
		<cfif IsDefined('method.displayName') and method.displayName neq method.name>(#method.displayName#)</cfif>
		</th></tr>
	<tr><td>

	<!--- method syntax --->

	<code>
	
	<cfif StructKeyExists( method, "access" )>
		<i>#lcase(method.access)#</i>
	</cfif>
	<cfif StructKeyExists( method, "final" )>
		<i>final</i>
	</cfif>
	<cfif StructKeyExists( method, "default" )>
		<i>default</i>
	</cfif>
	<cfif StructKeyExists( method, "abstract" )>
		<i>abstract</i>
	</cfif>
	<cfif StructKeyExists( method, "returnType" )>
		<i><cfif method.returnType is "VOID">void<cfelse>#GetLinkForType(method.returnType, "SHORT")#</cfif></i>
	</cfif>
	<b>#method.name#</b>
	<cfif IsDefined( "method.exceptions.types" ) and method.exceptions.types neq ""><i>throws</i> #method.exceptions.types#</cfif>
	(
 	<cfloop index="j" from="1" to="#ArrayLen(method.parameters)#">
		<cfset param = method.parameters[j]>
		<i>
		<cfif IsDefined('param.required') and param.required>required</cfif>
		<cfif IsDefined('param.type')>#GetLinkForType(param.type, "SHORT")#</cfif>
		</i>
		#param.name#<cfif IsDefined('param.default')>="#param.default#"</cfif><cfif j neq ArrayLen(method.parameters)>,</cfif>
	</cfloop>
	)
	</i>
	</code>
	<br><br>
	<!--- method description --->

	<cfif IsDefined('method.hint') and method.hint neq "">#method.hint#<br><br></cfif>
	<cfif IsDefined( 'method.roles' ) and method.roles neq ''>Available only for users in one of the roles: #method.roles#<br></cfif>

	Output: <cfif !IsDefined( 'method.output' )>  <cfelseif method.output eq false>suppressed<cfelse>enabled</cfif><br>

	<!--- method parameters --->
	<cfif ArrayLen(method.parameters)>
		Parameters:<br>
		<cfloop index="j" from="1" to="#ArrayLen(method.parameters)#">
			<cfset param = method.parameters[j]>
			&nbsp;&nbsp; <b>#param.name#:</b>
			<cfif IsDefined('param.type')>#GetLinkForType(param.type, "SHORT")#,<cfelse>any,</cfif>
			<cfif IsDefined('param.required') and param.required>required,<cfelse>optional,</cfif>
			<cfif IsDefined('param.displayName')>#param.displayName#<cfelse>#param.name#</cfif>
			<cfif IsDefined('param.hint') and param.hint neq ''>- #param.hint#</cfif>
			<br>
		</cfloop>

	</cfif>
	<br>
	</td></tr>

</cfloop>

</table>
</cfoutput>

<cfoutput>
</body></html>
</cfoutput>


