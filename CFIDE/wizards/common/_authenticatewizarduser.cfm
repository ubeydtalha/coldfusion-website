<cfsetting showdebugoutput="no">
<cfset factory = createObject( "java", "coldfusion.server.ServiceFactory" )>
<cfset request.security = factory.securityService>

<cfset authorized = true>

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
					password = RemoveChars( credentials.toString(), 1, pos ) ;
			}
			// check the form password field
			else if ( IsDefined('form.j_password') )
			{
				password = form.j_password ;
			}
			
			if ( IsDefined('password') )
			{
				
				authorized = request.security.checkRDSPassword( password ) ;
					
				if ( not authorized ) {
					authorized = request.security.checkAdminPassword( password ) ;
					invalidPasswordEntered = "thatsright" ;
				}
			}
		</cfscript>
		
		
		
		<cfif authorized>
			<cfloginuser roles="RDSUser" name="#password#" password="#password#">		
		</cfif>

		


	</cflogin>
</cfif>

<cfif not authorized>
	<cfinclude template="../common/_logintowizard.cfm">
	<cfabort>
</cfif>