<cfsilent>
<!--- Import L10N Taglib (System Generated) --->
<cfimport prefix="admin" taglib="../../administrator/cftags/">

<!--- Establish page locale, default is english (en). --->
<cfparam name="request.locale" default="en">
<cfscript>
	if(IsDefined("FORM.locale")) { request.locale = LCase(Trim(FORM.locale)); }
	request.localeFile = "resources/general_#request.locale#.xml";
</cfscript>

<cfset request.thisURL = "../../administrator/">

<cfset factory = createObject("java", "coldfusion.server.ServiceFactory")/>
<cfset request.security = factory.getSecurityService()/>
<cfset request.esapiutils = createObject("java", "coldfusion.security.ESAPIUtils")>
<cfset isRdsUserRequired = NOT request.security.getUseSingleRdsPassword()>

<cfscript>
	request.grayLight = "E2E6E7"; // use for table bkgds
	request.grayMedium = "C6CFD0"; // used for table borders
	request.grayDark = "6C7A83"; // used for background
	request.blueLight = "F3F7F7"; // used for table bkgds
	request.blueMedium = "E9F0F2"; // used for table borders
	request.blueBright = "0898DB"; // used for header text
	request.blueDark = "003399"; // used for links
	request.greenMedium = "008A00";//"2D8A00"; // used for link hover
	request.yellow = "FFFF99"; // used for table highlights
</cfscript>
<cflogout>

<!--- we need to find our web root to admin --->
<cfset thisURL = cgi.script_name>
<!--- ensure we have componentutils --->
<cfif listFindNoCase(thisURL,"wizards","/")>
	<!--- strip off endings until we have /administrator --->
	<cfscript>
		while(	listLast(thisURL,'/') neq "wizards" )
		{
			if( listLen(thisURL,"/") eq 0 )
			{
				cfbreak;
			}
			thisURL = listDeleteAt(thisURL, listLen(thisURL,"/"), "/");
		}
	</cfscript>

	<cfset thisURL = thisURL & "/">
	<cfset adminURL = ListDeleteAt( thisURL, ListLen( thisURL, "/" ), "/" ) & "/administrator/" >

</cfif>

<!--- bug 60505: Since we can't update the cgi scope and it may contain an cross site scripting hack.
	  we will build are own version, using the url scope which has been checked for cross site hacks.  --->
<cfscript>
	queryString = "";
	for(key in url)
	{
		queryString = queryString &iif(len(queryString), de("&"), de("")) &key &"=" &url[key];
	}
	queryString = HTMLEditFormat(queryString);
</cfscript>


</cfsilent>


<cfoutput>
<admin:l10n id="cfcbrowser_login" var="pagename">Wizard Login</admin:l10n>
<html>
<head>
	<title>#pagename#</title>

	<cfinclude template="../../administrator/styles.cfm">
	<meta name="Author" content="Copyright 1996-#year(now())# Adobe Macromedia Software LLC. All rights reserved.">
</head>

<!-- frame buster - code by Gordon McComb -->
<script language="JavaScript" type="text/javascript">
	<!-- Hide script from older browsers

	function changePage()
	{
		if(top != self) top.location = document.location;
	}

	function openWin( windowURL, windowName, windowFeatures ) {
		return window.open( windowURL, windowName, windowFeatures ) ;
	}
	function open_on_entrance(url,name)
	{
	new_window = window.open(url, name, ' menubar,scrollBars,resizable,dependent,status,width=525,height=300')
	}
// -->
</script>
<cfif isRdsUserRequired>
<!--- Bug 73997: username field should be named j_username so that <cflogin> tag identifies the form credentials  --->
  <cfset focus = "document.forms.loginform.j_username.focus();">
<cfelse>
  <cfset focus = "document.forms.loginform.j_password.focus();">
</cfif>
<body bgcolor="##6C7A83" onLoad="changePage();#focus#">

<admin:l10n id="coldfusion" var="coldfusionmx">ColdFusion</admin:l10n>
<cfform name="loginform" action="#cgi.script_name#?#queryString#" method="POST">



<table>
	<tr>
		<td><img src="#request.thisURL#images/spacer.gif" width="1" height="100"></td>
	</tr>
</table>

<table width="570" border="0" cellspacing="0" cellpadding="0" align="center" background="#request.thisURL#images/background.jpg">
		<tr>
			<td colspan="4"><img src="#request.thisURL#images/spacer.gif" width="1" height="115"></td>
		</tr>
		<tr>
			<td rowspan="5"><img src="#request.thisURL#images/spacer.gif" width="25" height="1"></td>
			<td align="left">
				<table>
					<tr>
						<td nowrap="nowrap">
				<cfif isRdsUserRequired>
					<p style="font-weight:bold;margin:0px 0px 0px 0px;"><admin:l10n id="enterRdsuseridpasswordlogin">Enter your RDS user id and password below.</admin:l10n></p>
					<p style="font-weight:bold;margin:5px 0px 5px 0px;"><admin:l10n id="label_userid">User ID</admin:l10n></p>
					<!---<cfif IsDefined("FORM.j_username")>
						<input name="j_username" type="text" size="15" maxlength="100" id="admin_login_id" value="#FORM.j_username#" autocomplete="off" style="width:300px; padding-left:5px;"><br/>
					<cfelse>
						<input name="j_username" type="text" size="15" maxlength="100" id="admin_login_id" autocomplete="off" style="width:300px; padding-left:5px;"><br/>
					</cfif>--->
					<input name="j_username" type="text" size="15" maxlength="100" id="admin_login_id" autocomplete="off" style="width:300px; padding-left:5px;"><br/>
				<cfelse>
					<p style="font-weight:bold;margin:0px 0px 0px 0px;"><admin:l10n id="enterrdsoradminpasswordlogin">Enter your RDS or Admin password below</admin:l10n></p>

				</cfif>
				<admin:l10n id="required_password" var="required_password">Password Required</admin:l10n>
				<p style="font-weight:bold;margin:5px 0px 5px 0px;"><admin:l10n id="label_password">Password</admin:l10n></p>
				<input name="j_password_required" type="hidden" value="#required_password#">
				<input name="j_password" type="Password" size="15" maxlength="100" id="admin_login" autocomplete="off" style="width:300px; padding-left:5px;">
						</td>
					</tr>
				</table>
			</td>
			<td width="200px" class="loginInvalidText">
				<p style="margin:88px 0px 0px 0px;">
				<cfif IsDefined("NullUserIdEntered")>
					<admin:l10n id="null_user_id">User ID required. Please try again.</admin:l10n>
				<cfelseif IsDefined("InvalidUserIdOrPasswordEntered")>
					<cfif isRdsUserRequired>
						<admin:l10n id="invalid_userid_or_password">Invalid User ID or Password. Please try again.</admin:l10n>
					<cfelse>
						<admin:l10n id="invalid_password">Invalid Password. Please try again.</admin:l10n>
					</cfif>
				</cfif>
				</p>
			</td>
			<td rowspan="5"><img src="#request.thisURL#images/spacer.gif" width="15" height="1"></td>
			</td>
		</tr>
		<tr>
			<td align="left" colspan="2">
				<admin:l10n id="password_button" var="password_button">Login</admin:l10n>
				<input name="submit" type="submit" value="#password_button#" class="buttn-fix" style=" margin:7px 0px 0px 2px;;width:80px">
			</td>
		</tr>
		<tr>
	<td colspan="2">
		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td style="vertical-align:middle;"><img src="#request.thisURL#images/spacer.gif" width="10" height="1"/><img src="#request.thisURL#images/adobelogo.gif" width="29" height="32"/>
				<td style="width:500px;"><p style="margin:20px 20px 20px 20px;" class="loginCopyrightText"><admin:l10n id="copyright_cont">&copy; 1997 - 2016 Adobe Systems Incorporated and its licensors. All Rights Reserved. Adobe, the Adobe logo, and ColdFusion are either registered trademarks or trademarks of Adobe Systems Incorporated in the United States and/or other countries.</admin:l10n></p>
				</td>
			</tr>
		</table>
		<br />
	</td>
</tr>
</table>


</cfform>
</body></html></cfoutput>
