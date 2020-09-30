component{
	this.name = "cfmongodb.ioc.wirebox1";
	
	function onRequestStart(){
		if( structKeyExists(url, "reload") ){
			onApplicationStop();
		}
	}
	
	function onApplicationStop(){
		if( structkeyExists(application, "injector") ){
			application.injector.getInstance("mongo").close();
		}
	}
}