<!--- Import L10N Taglib (System Generated) --->
<cfimport prefix="admin" taglib="../administrator/cftags/">

<!--- Establish page locale, default is english (en). --->
<cfparam name="request.locale" default="en">
<cfscript>
	if(IsDefined("FORM.locale")) { request.locale = LCase(Trim(FORM.locale)); }
	request.localeFile = "resources/general_#request.locale#.xml";
</cfscript>

<cfset cookiest = {httponly='true', timeout=createTimeSpan(0, 0, 30, 0), secure='#CGI.SERVER_PORT_SECURE#'}>
<cfset cookieast = {timeout=createTimeSpan(0, 0, 20, 0)}>
<cftry>
<cfapplication name="componentutils" sessionmanagement="Yes" sessiontimeout="#createTimeSpan(0,0,30,0)#" 
		               scriptprotect="form,url" sessioncookie=#cookiest# authcookie=#cookieast#>
<cfcatch type="Any">
	<!--- ///if session management has been disabled. Use this version of the tag. So the app still 
	works. Archives won't tho.    /// --->
	<cfapplication name="componentutils" scriptprotect="form,url" sessioncookie=#cookiest# authcookie=#cookieast#>
</cfcatch>
</cftry>
	
<cfsetting showdebugoutput="no">
<cfset factory = createObject( "java", "coldfusion.server.ServiceFactory" )>
<cfset request.security = factory.securityService>
<cfset request.esapiutils = createObject("java", "coldfusion.security.ESAPIUtils")>

<!--- Check if RDS service is enabled. If not, then show error and return.--->
<cfif not request.security.isRdsEnabled()>
	<admin:l10n id="componentutilnotavailable" var="componentutilnotavailable">
			Unsupported Operation. Check application log for more details.
	</admin:l10n>
	<admin:l10n id="component_rdsenable" var="component_rdsenable">
			To use Component Browser, enable RDS Service using Administrator. Note: RDS is intended for development use only.
	</admin:l10n>
	<cfoutput>
		<br> <br>
		#componentutilnotavailable#
		<br> <br>
	</cfoutput>
	<cflog text="#component_rdsenable#"  type="warning">
	<cfabort>
</cfif>

<cfset authorized = true>

<cftry>
<cfif request.security.RDSSecurityEnabled>
	<cflogin>
		<cfscript>
			authHeader = 'Authorization-MX' ;
		
			authorized = false ;
			
			httpReq = GetHTTPRequestData() ;
			// check the DW authorization header
			if ( StructKeyExists( httpReq.headers, authHeader ) ) {
			
				authString = ListGetAt( httpReq.headers[authHeader], 2, ' ' ) ;
				authString = ToBinary( authString ) ;		
				
				credentials = createObject( "java", "java.lang.String" ) ;
				credentials.init( authString ) ;
				
				// listLast() bug forces us to do it in this way
				pos = Find( ':', credentials.toString() ) ;
				if ( pos neq 0 )
				{
					// Incase of multiuser RDS, the username will also be sent in the header. Hence, retrieve the user.
					user = RemoveChars(credentials.toString(), pos, credentials.toString().length());
					password = RemoveChars( credentials.toString(), 1, pos ) ;
				}
			}
			// check the form password field
			else if ( IsDefined('form.j_password') )
			{
				password = form.j_password ;
				// Bug 73997: username field should be named j_username so that <cflogin> tag identifies the form credentials 
				if (IsDefined('form.j_username'))
				{
					user = form.j_username;
				}
				else
				{
					//if singleRDSpassword enabled, set the password value to user.
					if(request.security.getUseSingleRdsPassword())
					{
						user = request.security.getRootAdminUserId();
					} 
				}
			}

			if ( IsDefined('password') )
			{
				if (request.security.getUseSingleRdsPassword())
				{
					authorized = request.security.checkRDSPassword( password ) ;
				} 
				else
				{
					if (IsDefined('user') AND len(trim(user)))
					{
						authorized = request.security.checkRDSUserIdPassword(user, password) AND request.security.canAccessRDS(user);
					} else {
						NullUserIdEntered = true;
					}
				}
				
				if (not authorized)
				{
					InvalidUserIdOrPasswordEntered = true;
				}
					
			}
		</cfscript>
		
		<cfif authorized>
			<cfloginuser roles="RDSUser" name="#user#" password="#password#">		
		</cfif>

	</cflogin>
</cfif>
<cfcatch type="any">
	<cfset authorized = false>
</cfcatch>
</cftry>

<cfif not authorized>
	<cfinclude template="login.cfm">
	<cfabort>
</cfif>

