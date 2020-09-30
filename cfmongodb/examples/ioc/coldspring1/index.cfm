<cfset config = expandPath("beans.xml")>
<cfset application.beanfactory = createObject("component","coldspring.beans.DefaultXMLBeanFactory").init()>
<cfset application.beanfactory.loadBeans(config)>

<cfset mongo = application.beanfactory.getBean("mongo")>

<cfset people = mongo.getDBCollection("people")>

<cfset somePeople = people.query().$eq("NAME", "Wesley").find(limit=3)>
<cfdump var="#somePeople.asArray()#">

<!--- NOTE: the mongo object is closed via mongo.close() in application.cfc's onApplicationStop --->