/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
ColdFusion.WebSocket={NS:"coldfusion.websocket.channels",WELCOME:"welcome",AUTHENTICATE:"authenticate",SUBSCRIBE:"subscribe",UNSUBSCRIBE:"unsubscribe",PUBLISH:"publish",INVOKE_AND_PUBLISH:"invokeAndPublish",GET_CHANNELS:"getChannels",GET_SUBSCRIBER_COUNT:"getSubscriberCount",GET_SUBSCRIPTIONS:"getSubscriptions",SEND_MESSAGE:"sendMessage",INVOKE_AND_MESSAGE:"invokeAndSend",INVOKE:"invoke",STOP:"stop",init:function(id,_325,_326,_327,_328,_329,_32a,_32b,_32c,_32d,_32e){
if(cf_ws.isWebSocketSupported()){
lWSC=new cf_ws.CFWebSocketWrapper();
ColdFusion.WebSocket[id]=lWSC;
lWSC.options={OnWelcome:this.cfonOpencallBk,OnMessage:this.cfMessageHandlerCallBk,OnClose:_32b,onError:_32c,appName:_325,cfauth:_327,subscribeTo:_328,referrer:_32d};
var _32f=self.location.hostname;
if(!(self.WebSocket||self.MozWebSocket)&&_326==true){
var _330={ns:ColdFusion.WebSocket.NS,reqType:ColdFusion.WebSocket.WELCOME,code:-1,msg:"WebSocket over SSL will not work as your browser does not have native WebSockets support."};
var _331=_32c!=null?_32c:_329;
_331(_330);
return;
}
if(_326==false&&_32f&&_32f=="localhost"){
_32f="127.0.0.1";
}
var _332;
var port;
if(_32e){
if(self.location.port!=""){
port=self.location.port;
}else{
if(self.location.protocol!=""&&self.location.protocol=="https:"){
port=443;
}else{
port=80;
}
}
if(self.location.protocol!=""&&self.location.protocol=="https:"){
protocol="wss://";
}else{
protocol="ws://";
}
_332="/cfws";
}else{
port=_326?_cf_websocket_ssl_port:_cf_websocket_port;
_332="/cfusion"+"/cfusion";
protocol=_326?"wss://":"ws://";
}
var lURL=protocol+(_32f)+":"+port+_332;
lWSC.options.url=lURL;
var lRes=lWSC.open(lURL,lWSC.options);
lWSC.isOpen=true;
lWSC.processConnected=function(_336){
};
lWSC.processDisconnected=function(_337){
};
lWSC.defaultMessageHandler=_329;
if(_32a){
lWSC.appOnOpenHandler=_32a;
}
lWSC.channelSpecificResHandlers={};
lWSC.subscribercount_callbackHandlers={};
return lWSC;
}else{
var _330={ns:ColdFusion.WebSocket.NS,reqType:ColdFusion.WebSocket.WELCOME,code:-1,msg:"Browser neither have native WebSocket support nor a flash player for the fallback."};
var _331=_32c!=null?_32c:_329;
_331(_330);
}
},welcome:function(_338,_339,_33a){
var lRes=this.isConnected();
if(lRes==true){
this.sendToken({ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.WELCOME,authKey:_338,subscribeTo:_339,appName:_33a});
}
return lRes;
},authenticate:function(_33c,_33d){
var lRes=this.isConnected();
if(lRes==true){
this.sendToken({ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.AUTHENTICATE,username:_33c,password:_33d,appName:this.options.appName});
}
return lRes;
},subscribe:function(_33f,_340,_341){
var lRes=this.isConnected();
if(lRes==true){
var _343={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.SUBSCRIBE,channel:_33f,appName:this.options.appName};
if(_340!=null&&(typeof _340=="object")){
_343.customOptions=_340;
}
this.sendToken(_343);
if(_341){
this.channelSpecificResHandlers[_33f]=_341;
this.channelName_subscriptionInProcess=_33f;
}
}
return lRes;
},unsubscribe:function(_344){
var lRes=this.isConnected();
if(lRes==true){
var _346={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.UNSUBSCRIBE,channel:_344,appName:this.options.appName};
this.sendToken(_346);
delete this.channelSpecificResHandlers[_344];
}
return lRes;
},publish:function(_347,_348,_349){
var lRes=this.isConnected();
if(lRes==true){
var _34b={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.PUBLISH,channel:_347,data:_348,appName:this.options.appName};
if(_349!=null&&(typeof _349=="object")){
_34b.customOptions=_349;
}
this.sendToken(_34b);
}
return lRes;
},invokeAndPublish:function(_34c,_34d,_34e,_34f,_350){
var lRes=this.isConnected();
if(lRes==true){
var _352={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE_AND_PUBLISH,channel:_34c,cfcName:_34d,cfcMethod:_34e,methodArguments:_34f,appName:this.options.appName,referrer:this.options.referrer};
if(_350!=null&&(typeof _350=="object")){
_352.customOptions=_350;
}
this.sendToken(_352);
}
return lRes;
},getSubscriberCount:function(_353,_354){
var lRes=this.isConnected();
if(lRes==true){
var _356={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.GET_SUBSCRIBER_COUNT,channel:_353,appName:this.options.appName};
this.sendToken(_356);
}
if(_354){
if(!this.subscribercount_callbackHandlers){
this.subscribercount_callbackHandlers={};
}
this.subscribercount_callbackHandlers[_353]=_354;
}
return lRes;
},getSubscriptions:function(_357){
var lRes=this.isConnected();
if(lRes==true){
var _359={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.GET_SUBSCRIPTIONS,appName:this.options.appName};
this.sendToken(_359);
}
if(_357){
this.subscriptions_callbackHandler=_357;
}
return lRes;
},sendMessage:function(_35a,_35b,_35c){
var lRes=this.isConnected();
if(lRes==true){
var _35e={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.SEND_MESSAGE,targetId:_35a,data:_35b,appName:this.options.appName};
if(_35c!=null&&(typeof _35c=="object")){
_35e.customOptions=_35c;
}
this.sendToken(_35e);
}
return lRes;
},invokeAndSend:function(_35f,_360,_361,_362,_363){
var lRes=this.isConnected();
if(lRes==true){
var _365={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE_AND_MESSAGE,target:_35f,cfcName:_360,cfcMethod:_361,methodArguments:_362,appName:this.options.appName};
if(_363!=null&&(typeof _363=="object")){
_365.customOptions=_363;
}
this.sendToken(_365);
}
return lRes;
},invoke:function(_366,_367,_368,_369){
var lRes=this.isConnected();
if(lRes==true){
var _36b={ns:ColdFusion.WebSocket.NS,type:ColdFusion.WebSocket.INVOKE,cfcName:_366,cfcMethod:_367,methodArguments:_368,appName:this.options.appName,referrer:this.options.referrer};
if(_369!=null&&(typeof _369=="object")){
_36b.customOptions=_369;
}
this.sendToken(_36b);
}
return lRes;
},openConnection:function(){
var lURL=lWSC.options.url;
this.open(lURL,this.options);
},isConnectionOpen:function(){
var _36d=this.isConnected();
return _36d;
},closeConnection:function(){
this.close({fireClose:true});
},cfonOpencallBk:function(_36e){
if(this.cfauth!=null||this.susbcribeTo!=null){
_36e.welcome(this.cfauth,this.subscribeTo,this.appName);
}
if(_36e.appOnOpenHandler){
_36e.appOnOpenHandler(_36e);
}
},cfMessageHandlerCallBk:function(_36f,_370){
var _371=_370.defaultMessageHandler;
if((_36f.type=="event")&&(_36f.name=="connect"||_36f.name=="disconnect")){
return;
}
if((_36f.reqType=="subscribe")&&_370.channelName_subscriptionInProcess!=null){
if(_36f.code==-1){
delete _370.channelSpecificResHandlers[_370.channelName_subscriptionInProcess];
}
delete _370.channelName_subscriptionInProcess;
}
if((_36f.reqType=="getSubscriberCount")&&_370.subscribercount_callbackHandlers[_36f.channel]!=null){
_370.subscribercount_callbackHandlers[_36f.channel].call(this,_36f);
delete _370.subscribercount_callbackHandlers[_36f.channelname];
return;
}
if((_36f.reqType=="getSubscriptions")&&_370.subscriptions_callbackHandler!=null){
_370.subscriptions_callbackHandler(_36f);
delete _370.subscriptions_callbackHandler;
return;
}
if(_36f.type=="data"&&_36f.channelname){
var _372=_36f.channelname;
var _373=_370.channelSpecificResHandlers[_372];
while(_373==null){
var lPos=_372.lastIndexOf(".");
if(lPos>0){
_372=_372.substr(0,lPos);
_373=_370.channelSpecificResHandlers[_372];
}else{
break;
}
}
if(_373){
_371=_373;
}
}
_371.call(this,_36f);
}};
function cfwebsocketinit(){
var _375=ColdFusion.WebSocket;
ns=cf_ws;
for(var _376 in _375){
ns["CFWebSocketWrapper"].prototype[_376]=_375[_376];
}
}
cfwebsocketinit();
