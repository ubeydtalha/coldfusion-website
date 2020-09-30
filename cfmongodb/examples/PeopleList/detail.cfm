
<cfset person = application.mongo.getDBCollection( application.collection )
	.findById(url.id, application.collection)>

<h1>Person <cfoutput>#url.id#</cfoutput></h1>
<cfdump var="#person#">
