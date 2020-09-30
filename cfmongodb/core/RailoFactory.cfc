<cfcomponent output="false" extends="AbstractFactory" hint="Uses Railo's createObject('java', path, jarPaths) to create Java objects.">

    <cffunction name="init" output="false" access="public" returntype="any" hint="">
        <cfscript>
            variables.jarPaths = directoryList( expandPath("/cfmongodb/lib"), false, "path", "*.jar" );
            return super.init();
        </cfscript>
    </cffunction>

	<cffunction name="getObject" output="false" access="public" returntype="any" hint="Creates a Java object">
    	<cfargument name="path" type="string" required="true">
        <cfset var result = createObject("java", path, arraytolist(variables.jarPaths))>
        <cfreturn result>
    </cffunction>

</cfcomponent>