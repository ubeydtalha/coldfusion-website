<cfcomponent accessors="true" output="false" extends="AbstractFactory" hint="Uses javaloader to create Java objects.">

	<cfproperty name="javaloader">

	<cffunction name="init" output="false" access="public" returntype="any" hint="">
		<cfargument name="javaloader" type="any" required="false" default="" hint="If you don't provide a fully initialized javaloader instance, we'll attempt to provide one for you"/>

		<cfif isSimpleValue(arguments.javaloader)>
			<cfset var jarPaths = directoryList( expandPath("/cfmongodb/lib"), false, "path", "*.jar" )>
			<cfset variables.javaloader = createObject('component', 'cfmongodb.lib.javaloader.JavaLoader').init(jarPaths)>
		<cfelse>
			<cfset variables.javaloader = arguments.javaloader>
		</cfif>

		<cfreturn super.init()>
    </cffunction>

	<cffunction name="getObject" output="false" access="public" returntype="any" hint="Creates a Java object">
    	<cfargument name="path" type="string" required="true"/>
		<cfreturn javaloader.create(path)>
    </cffunction>

</cfcomponent>