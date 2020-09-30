<!---
* Copyright (c) 2005 Macromedia.  All Rights Reserved.
* DO NOT REDISTRIBUTE THIS SOFTWARE IN ANY WAY WITHOUT THE EXPRESSED
* WRITTEN PERMISSION OF MACROMEDIA.
--->
<cfcomponent>
	<cffunction name="wizardHash" access="remote" >
		<cfargument name="inPassword" required="yes" type="string">
		<cfset x = randString()>
		<cfset y = randString()>
		
			<cfoutput>#hash(x&arguments.inPassword&y, "SHA-1")#,#x#,#y#</cfoutput>
			
			<cfset foo = x&arguments.inPassword&y>
		</cffunction>
	
	<cffunction name="randString" access="private" returntype="string">
		<cfset var foo="">
		<cfloop from="1" to="#randrange(8,12)#" index="i">
			<cfset foo=foo & chr(randrange(32,128))>
		</cfloop>
		<cfreturn hash(foo)>
	</cffunction>

  
</cfcomponent>