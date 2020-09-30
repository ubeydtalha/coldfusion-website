<cfscript>
colddoc = createObject("component", "colddoc.ColdDoc").init();
strategy = createObject("component", "colddoc.strategy.api.HTMLAPIStrategy").init( expandPath("api"), "CFMongoDB" );
colddoc.setStrategy(strategy);
colddoc.generate(expandPath("/cfmongodb/core"), "cfmongodb.core");
</cfscript>
