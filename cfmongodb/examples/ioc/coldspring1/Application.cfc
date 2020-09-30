component{
	this.name = "cfmongodb.ioc.coldspring1";
	
	function onRequestStart(){
		if( structKeyExists(url, "reload") ){
			onApplicationStop();
		}
	}
	
	function onApplicationStop(){
		if( structkeyExists(application, "beanfactory") ){
			application.beanfactory.getBean("mongo").close();
		}
	}
}