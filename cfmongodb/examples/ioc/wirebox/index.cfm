<!--- 
This file is merely a scratch file to show that the wiring works. See Binder.cfc for 
a sample Wirebox configuration
 --->
<cfset binder = createObject("component", "Binder")>
<cfset application.injector = createObject("component","coldbox.system.ioc.Injector").init("Binder")>

<cfset mongo = application.injector.getInstance("mongo")>

<cfset people = mongo.getDBCollection("people")>

<cfset somePeople = people.query().$eq("NAME", "Wesley").find(limit=3)>
<cfdump var="#somePeople.asArray()#">

<!--- NOTE: the mongo object is closed via mongo.close() in application.cfc's onApplicationStop --->