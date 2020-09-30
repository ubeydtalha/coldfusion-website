/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
function cfinit(){
if(!window.ColdFusion){
ColdFusion={};
var $C=ColdFusion;
if(!$C.Ajax){
$C.Ajax={};
}
var $A=$C.Ajax;
if(!$C.AjaxProxy){
$C.AjaxProxy={};
}
var $X=$C.AjaxProxy;
if(!$C.Bind){
$C.Bind={};
}
var $B=$C.Bind;
if(!$C.Event){
$C.Event={};
}
var $E=$C.Event;
if(!$C.Log){
$C.Log={};
}
var $L=$C.Log;
if(!$C.Util){
$C.Util={};
}
var $U=$C.Util;
if(!$C.DOM){
$C.DOM={};
}
var $D=$C.DOM;
if(!$C.Spry){
$C.Spry={};
}
var $S=$C.Spry;
if(!$C.Pod){
$C.Pod={};
}
var $P=$C.Pod;
if(!$C.objectCache){
$C.objectCache={};
}
if(!$C.required){
$C.required={};
}
if(!$C.importedTags){
$C.importedTags=[];
}
if(!$C.requestCounter){
$C.requestCounter=0;
}
if(!$C.bindHandlerCache){
$C.bindHandlerCache={};
}
window._cf_loadingtexthtml="<div style=\"text-align: center;\">"+window._cf_loadingtexthtml+"&nbsp;"+CFMessage["loading"]+"</div>";
$C.globalErrorHandler=function(_532,_533){
if($L.isAvailable){
$L.error(_532,_533);
}
if($C.userGlobalErrorHandler){
$C.userGlobalErrorHandler(_532);
}
if(!$L.isAvailable&&!$C.userGlobalErrorHandler){
alert(_532+CFMessage["globalErrorHandler.alert"]);
}
};
$C.handleError=function(_534,_535,_536,_537,_538,_539,_53a,_53b){
var msg=$L.format(_535,_537);
if(_534){
$L.error(msg,"http");
if(!_538){
_538=-1;
}
if(!_539){
_539=msg;
}
_534(_538,_539,_53b);
}else{
if(_53a){
$L.error(msg,"http");
throw msg;
}else{
$C.globalErrorHandler(msg,_536);
}
}
};
$C.setGlobalErrorHandler=function(_53d){
$C.userGlobalErrorHandler=_53d;
};
$A.createXMLHttpRequest=function(){
try{
return new XMLHttpRequest();
}
catch(e){
}
var _53e=["Microsoft.XMLHTTP","MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP"];
for(var i=0;i<_53e.length;i++){
try{
return new ActiveXObject(_53e[i]);
}
catch(e){
}
}
return false;
};
$A.isRequestError=function(req){
return ((req.status!=0&&req.status!=200)||req.getResponseHeader("server-error"));
};
$A.sendMessage=function(url,_542,_543,_544,_545,_546,_547){
var req=$A.createXMLHttpRequest();
if(!_542){
_542="GET";
}
if(_544&&_545){
req.onreadystatechange=function(){
$A.callback(req,_545,_546);
};
}
if(_543){
_543+="&_cf_nodebug=true&_cf_nocache=true";
}else{
_543="_cf_nodebug=true&_cf_nocache=true";
}
if(window._cf_clientid){
_543+="&_cf_clientid="+_cf_clientid;
}
if(_542=="GET"){
if(_543){
_543+="&_cf_rc="+($C.requestCounter++);
if(url.indexOf("?")==-1){
url+="?"+_543;
}else{
url+="&"+_543;
}
}
$L.info("ajax.sendmessage.get","http",[url]);
req.open(_542,url,_544);
req.send(null);
}else{
$L.info("ajax.sendmessage.post","http",[url,_543]);
req.open(_542,url,_544);
req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
if(_543){
req.send(_543);
}else{
req.send(null);
}
}
if(!_544){
while(req.readyState!=4){
}
if($A.isRequestError(req)){
$C.handleError(null,"ajax.sendmessage.error","http",[req.status,req.statusText],req.status,req.statusText,_547);
}else{
return req;
}
}
};
$A.callback=function(req,_54a,_54b){
if(req.readyState!=4){
return;
}
req.onreadystatechange=new Function;
_54a(req,_54b);
};
$A.submitForm=function(_54c,url,_54e,_54f,_550,_551){
var _552=$C.getFormQueryString(_54c);
if(_552==-1){
$C.handleError(_54f,"ajax.submitform.formnotfound","http",[_54c],-1,null,true);
return;
}
if(!_550){
_550="POST";
}
_551=!(_551===false);
var _553=function(req){
$A.submitForm.callback(req,_54c,_54e,_54f);
};
$L.info("ajax.submitform.submitting","http",[_54c]);
var _555=$A.sendMessage(url,_550,_552,_551,_553);
if(!_551){
$L.info("ajax.submitform.success","http",[_54c]);
return _555.responseText;
}
};
$A.submitForm.callback=function(req,_557,_558,_559){
if($A.isRequestError(req)){
$C.handleError(_559,"ajax.submitform.error","http",[req.status,_557,req.statusText],req.status,req.statusText);
}else{
$L.info("ajax.submitform.success","http",[_557]);
if(_558){
_558(req.responseText);
}
}
};
$C.empty=function(){
};
$C.setSubmitClicked=function(_55a,_55b){
var el=$D.getElement(_55b,_55a);
el.cfinputbutton=true;
$C.setClickedProperty=function(){
el.clicked=true;
};
$E.addListener(el,"click",$C.setClickedProperty);
};
$C.getFormQueryString=function(_55d,_55e){
var _55f;
if(typeof _55d=="string"){
_55f=(document.getElementById(_55d)||document.forms[_55d]);
}else{
if(typeof _55d=="object"){
_55f=_55d;
}
}
if(!_55f||null==_55f.elements){
return -1;
}
var _560,elementName,elementValue,elementDisabled;
var _561=false;
var _562=(_55e)?{}:"";
for(var i=0;i<_55f.elements.length;i++){
_560=_55f.elements[i];
elementDisabled=_560.disabled;
elementName=_560.name;
elementValue=_560.value;
if(_560.id&&_560.id.startsWith("cf_textarea")){
var _564=CKEDITOR.instances;
if(_564){
for(ta in _564){
if(_564[ta].getData){
elementValue=_564[ta].getData();
break;
}
}
}
}
if(!elementDisabled&&elementName){
switch(_560.type){
case "select-one":
case "select-multiple":
for(var j=0;j<_560.options.length;j++){
if(_560.options[j].selected){
if(window.ActiveXObject){
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,_560.options[j].attributes["value"].specified?_560.options[j].value:_560.options[j].text);
}else{
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,_560.options[j].hasAttribute("value")?_560.options[j].value:_560.options[j].text);
}
}
}
break;
case "radio":
case "checkbox":
if(_560.checked){
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,elementValue);
}
break;
case "file":
case undefined:
case "reset":
break;
case "button":
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,elementValue);
break;
case "submit":
if(_560.cfinputbutton){
if(_561==false&&_560.clicked){
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,elementValue);
_561=true;
}
}else{
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,elementValue);
}
break;
case "textarea":
var _566;
if(window.FCKeditorAPI&&(_566=$C.objectCache[elementName])&&_566.richtextid){
var _567=FCKeditorAPI.GetInstance(_566.richtextid);
if(_567){
elementValue=_567.GetXHTML();
}
}
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,elementValue);
break;
default:
_562=$C.getFormQueryString.processFormData(_562,_55e,elementName,elementValue);
break;
}
}
}
if(!_55e){
_562=_562.substr(0,_562.length-1);
}
return _562;
};
$C.getFormQueryString.processFormData=function(_568,_569,_56a,_56b){
if(_569){
if(_568[_56a]){
_568[_56a]+=","+_56b;
}else{
_568[_56a]=_56b;
}
}else{
_568+=encodeURIComponent(_56a)+"="+encodeURIComponent(_56b)+"&";
}
return _568;
};
$A.importTag=function(_56c){
$C.importedTags.push(_56c);
};
$A.checkImportedTag=function(_56d){
var _56e=false;
for(var i=0;i<$C.importedTags.length;i++){
if($C.importedTags[i]==_56d){
_56e=true;
break;
}
}
if(!_56e){
$C.handleError(null,"ajax.checkimportedtag.error","widget",[_56d]);
}
};
$C.getElementValue=function(_570,_571,_572){
if(!_570){
$C.handleError(null,"getelementvalue.noelementname","bind",null,null,null,true);
return;
}
if(!_572){
_572="value";
}
var _573=$B.getBindElementValue(_570,_571,_572);
if(typeof (_573)=="undefined"){
_573=null;
}
if(_573==null){
$C.handleError(null,"getelementvalue.elnotfound","bind",[_570,_572],null,null,true);
return;
}
return _573;
};
$B.getBindElementValue=function(_574,_575,_576,_577,_578){
var _579="";
if(window[_574]){
var _57a=eval(_574);
if(_57a&&_57a._cf_getAttribute){
_579=_57a._cf_getAttribute(_576);
return _579;
}
}
var _57b=$C.objectCache[_574];
if(_57b&&_57b._cf_getAttribute){
_579=_57b._cf_getAttribute(_576);
return _579;
}
var el=$D.getElement(_574,_575);
var _57d=(el&&((!el.length&&el.length!=0)||(el.length&&el.length>0)||el.tagName=="SELECT"));
if(!_57d&&!_578){
$C.handleError(null,"bind.getbindelementvalue.elnotfound","bind",[_574]);
return null;
}
if(el.tagName!="SELECT"){
if(el.length>1){
var _57e=true;
for(var i=0;i<el.length;i++){
var _580=(el[i].getAttribute("type")=="radio"||el[i].getAttribute("type")=="checkbox");
if(!_580||(_580&&el[i].checked)){
if(!_57e){
_579+=",";
}
_579+=$B.getBindElementValue.extract(el[i],_576);
_57e=false;
}
}
}else{
_579=$B.getBindElementValue.extract(el,_576);
}
}else{
var _57e=true;
for(var i=0;i<el.options.length;i++){
if(el.options[i].selected){
if(!_57e){
_579+=",";
}
_579+=$B.getBindElementValue.extract(el.options[i],_576);
_57e=false;
}
}
}
if(typeof (_579)=="object"){
$C.handleError(null,"bind.getbindelementvalue.simplevalrequired","bind",[_574,_576]);
return null;
}
if(_577&&$C.required[_574]&&_579.length==0){
return null;
}
return _579;
};
$B.getBindElementValue.extract=function(el,_582){
var _583=el[_582];
if((_583==null||typeof (_583)=="undefined")&&el.getAttribute){
_583=el.getAttribute(_582);
}
return _583;
};
$L.init=function(){
if(window.YAHOO&&YAHOO.widget&&YAHOO.widget.Logger){
YAHOO.widget.Logger.categories=[CFMessage["debug"],CFMessage["info"],CFMessage["error"],CFMessage["window"]];
YAHOO.widget.LogReader.prototype.formatMsg=function(_584){
var _585=_584.category;
return "<p>"+"<span class='"+_585+"'>"+_585+"</span>:<i>"+_584.source+"</i>: "+_584.msg+"</p>";
};
var _586=new YAHOO.widget.LogReader(null,{width:"30em",fontSize:"100%"});
_586.setTitle(CFMessage["log.title"]||"ColdFusion AJAX Logger");
_586._btnCollapse.value=CFMessage["log.collapse"]||"Collapse";
_586._btnPause.value=CFMessage["log.pause"]||"Pause";
_586._btnClear.value=CFMessage["log.clear"]||"Clear";
$L.isAvailable=true;
}
};
$L.log=function(_587,_588,_589,_58a){
if(!$L.isAvailable){
return;
}
if(!_589){
_589="global";
}
_589=CFMessage[_589]||_589;
_588=CFMessage[_588]||_588;
_587=$L.format(_587,_58a);
YAHOO.log(_587,_588,_589);
};
$L.format=function(code,_58c){
var msg=CFMessage[code]||code;
if(_58c){
for(i=0;i<_58c.length;i++){
if(!_58c[i].length){
_58c[i]="";
}
var _58e="{"+i+"}";
msg=msg.replace(_58e,_58c[i]);
}
}
return msg;
};
$L.debug=function(_58f,_590,_591){
$L.log(_58f,"debug",_590,_591);
};
$L.info=function(_592,_593,_594){
$L.log(_592,"info",_593,_594);
};
$L.error=function(_595,_596,_597){
$L.log(_595,"error",_596,_597);
};
$L.dump=function(_598,_599){
if($L.isAvailable){
var dump=(/string|number|undefined|boolean/.test(typeof (_598))||_598==null)?_598:recurse(_598,typeof _598,true);
$L.debug(dump,_599);
}
};
$X.invoke=function(_59b,_59c,_59d,_59e,_59f){
return $X.invokeInternal(_59b,_59c,_59d,_59e,_59f,false,null,null);
};
$X.invokeInternal=function(_5a0,_5a1,_5a2,_5a3,_5a4,_5a5,_5a6,_5a7){
var _5a8="method="+_5a1+"&_cf_ajaxproxytoken="+_5a2;
if(_5a5){
_5a8+="&_cfclient="+"true";
var _5a9=$X.JSON.encodeInternal(_5a0._variables,_5a5);
_5a8+="&_variables="+encodeURIComponent(_5a9);
var _5aa=$X.JSON.encodeInternal(_5a0._metadata,_5a5);
_5a8+="&_metadata="+encodeURIComponent(_5aa);
}
var _5ab=_5a0.returnFormat||"json";
_5a8+="&returnFormat="+_5ab;
if(_5a0.queryFormat){
_5a8+="&queryFormat="+_5a0.queryFormat;
}
if(_5a0.formId){
var _5ac=$C.getFormQueryString(_5a0.formId,true);
if(_5a3!=null){
for(prop in _5ac){
_5a3[prop]=_5ac[prop];
}
}else{
_5a3=_5ac;
}
_5a0.formId=null;
}
var _5ad="";
if(_5a3!=null){
_5ad=$X.JSON.encodeInternal(_5a3,_5a5);
_5a8+="&argumentCollection="+encodeURIComponent(_5ad);
}
$L.info("ajaxproxy.invoke.invoking","http",[_5a0.cfcPath,_5a1,_5ad]);
if(_5a0.callHandler){
_5a0.callHandler.call(null,_5a0.callHandlerParams,_5a0.cfcPath,_5a8);
return;
}
var _5ae;
var _5af=_5a0.async;
if(_5a6!=null){
_5af=true;
_5ae=function(req){
$X.callbackOp(req,_5a0,_5a4,_5a6,_5a7);
};
}else{
if(_5a0.async){
_5ae=function(req){
$X.callback(req,_5a0,_5a4);
};
}
}
var req=$A.sendMessage(_5a0.cfcPath,_5a0.httpMethod,_5a8,_5af,_5ae,null,true);
if(!_5af){
return $X.processResponse(req,_5a0);
}
};
$X.callback=function(req,_5b4,_5b5){
if($A.isRequestError(req)){
$C.handleError(_5b4.errorHandler,"ajaxproxy.invoke.error","http",[req.status,_5b4.cfcPath,req.statusText],req.status,req.statusText,false,_5b5);
}else{
if(_5b4.callbackHandler){
var _5b6=$X.processResponse(req,_5b4);
_5b4.callbackHandler(_5b6,_5b5);
}
}
};
$X.callbackOp=function(req,_5b8,_5b9,_5ba,_5bb){
if($A.isRequestError(req)){
var _5bc=_5b8.errorHandler;
if(_5bb!=null){
_5bc=_5bb;
}
$C.handleError(_5bc,"ajaxproxy.invoke.error","http",[req.status,_5b8.cfcPath,req.statusText],req.status,req.statusText,false,_5b9);
}else{
if(_5ba){
var _5bd=$X.processResponse(req,_5b8);
_5ba(_5bd,_5b9);
}
}
};
$X.processResponse=function(req,_5bf){
var _5c0=true;
for(var i=0;i<req.responseText.length;i++){
var c=req.responseText.charAt(i);
_5c0=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_5c0){
break;
}
}
var _5c3=(req.responseXML&&req.responseXML.childNodes.length>0);
var _5c4=_5c3?"[XML Document]":req.responseText;
$L.info("ajaxproxy.invoke.response","http",[_5c4]);
var _5c5;
var _5c6=_5bf.returnFormat||"json";
if(_5c6=="json"){
try{
_5c5=_5c0?null:$X.JSON.decode(req.responseText);
}
catch(e){
if(typeof _5bf._metadata!=="undefined"&&_5bf._metadata.servercfc&&typeof req.responseText==="string"){
_5c5=req.responseText;
}else{
throw e;
}
}
}else{
_5c5=_5c3?req.responseXML:(_5c0?null:req.responseText);
}
return _5c5;
};
$X.init=function(_5c7,_5c8,_5c9){
if(typeof _5c9==="undefined"){
_5c9=false;
}
var _5ca=_5c8;
if(!_5c9){
var _5cb=_5c8.split(".");
var ns=self;
for(i=0;i<_5cb.length-1;i++){
if(_5cb[i].length){
ns[_5cb[i]]=ns[_5cb[i]]||{};
ns=ns[_5cb[i]];
}
}
var _5cd=_5cb[_5cb.length-1];
if(ns[_5cd]){
return ns[_5cd];
}
ns[_5cd]=function(){
this.httpMethod="GET";
this.async=false;
this.callbackHandler=null;
this.errorHandler=null;
this.formId=null;
};
_5ca=ns[_5cd].prototype;
}else{
_5ca.httpMethod="GET";
_5ca.async=false;
_5ca.callbackHandler=null;
_5ca.errorHandler=null;
_5ca.formId=null;
}
_5ca.cfcPath=_5c7;
_5ca.setHTTPMethod=function(_5ce){
if(_5ce){
_5ce=_5ce.toUpperCase();
}
if(_5ce!="GET"&&_5ce!="POST"){
$C.handleError(null,"ajaxproxy.sethttpmethod.invalidmethod","http",[_5ce],null,null,true);
}
this.httpMethod=_5ce;
};
_5ca.setSyncMode=function(){
this.async=false;
};
_5ca.setAsyncMode=function(){
this.async=true;
};
_5ca.setCallbackHandler=function(fn){
this.callbackHandler=fn;
this.setAsyncMode();
};
_5ca.setErrorHandler=function(fn){
this.errorHandler=fn;
this.setAsyncMode();
};
_5ca.setForm=function(fn){
this.formId=fn;
};
_5ca.setQueryFormat=function(_5d2){
if(_5d2){
_5d2=_5d2.toLowerCase();
}
if(!_5d2||(_5d2!="column"&&_5d2!="row"&&_5d2!="struct")){
$C.handleError(null,"ajaxproxy.setqueryformat.invalidformat","http",[_5d2],null,null,true);
}
this.queryFormat=_5d2;
};
_5ca.setReturnFormat=function(_5d3){
if(_5d3){
_5d3=_5d3.toLowerCase();
}
if(!_5d3||(_5d3!="plain"&&_5d3!="json"&&_5d3!="wddx")){
$C.handleError(null,"ajaxproxy.setreturnformat.invalidformat","http",[_5d3],null,null,true);
}
this.returnFormat=_5d3;
};
$L.info("ajaxproxy.init.created","http",[_5c7]);
if(_5c9){
return _5ca;
}else{
return ns[_5cd];
}
};
$U.isWhitespace=function(s){
var _5d5=true;
for(var i=0;i<s.length;i++){
var c=s.charAt(i);
_5d5=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_5d5){
break;
}
}
return _5d5;
};
$U.getFirstNonWhitespaceIndex=function(s){
var _5d9=true;
for(var i=0;i<s.length;i++){
var c=s.charAt(i);
_5d9=(c==" "||c=="\n"||c=="\t"||c=="\r");
if(!_5d9){
break;
}
}
return i;
};
$C.trim=function(_5dc){
return _5dc.replace(/^\s+|\s+$/g,"");
};
$U.isInteger=function(n){
var _5de=true;
if(typeof (n)=="number"){
_5de=(n>=0);
}else{
for(i=0;i<n.length;i++){
if($U.isInteger.numberChars.indexOf(n.charAt(i))==-1){
_5de=false;
break;
}
}
}
return _5de;
};
$U.isInteger.numberChars="0123456789";
$U.isArray=function(a){
return (typeof (a.length)=="number"&&!a.toUpperCase);
};
$U.isBoolean=function(b){
if(b===true||b===false){
return true;
}else{
if(b.toLowerCase){
b=b.toLowerCase();
return (b==$U.isBoolean.trueChars||b==$U.isBoolean.falseChars);
}else{
return false;
}
}
};
$U.isBoolean.trueChars="true";
$U.isBoolean.falseChars="false";
$U.castBoolean=function(b){
if(b===true){
return true;
}else{
if(b===false){
return false;
}else{
if(b.toLowerCase){
b=b.toLowerCase();
if(b==$U.isBoolean.trueChars){
return true;
}else{
if(b==$U.isBoolean.falseChars){
return false;
}else{
return false;
}
}
}else{
return false;
}
}
}
};
$U.checkQuery=function(o){
var _5e3=null;
if(o&&o.COLUMNS&&$U.isArray(o.COLUMNS)&&o.DATA&&$U.isArray(o.DATA)&&(o.DATA.length==0||(o.DATA.length>0&&$U.isArray(o.DATA[0])))){
_5e3="row";
}else{
if(o&&o.COLUMNS&&$U.isArray(o.COLUMNS)&&o.ROWCOUNT&&$U.isInteger(o.ROWCOUNT)&&o.DATA){
_5e3="col";
for(var i=0;i<o.COLUMNS.length;i++){
var _5e5=o.DATA[o.COLUMNS[i]];
if(!_5e5||!$U.isArray(_5e5)){
_5e3=null;
break;
}
}
}
}
return _5e3;
};
$X.JSON=new function(){
var _5e6={}.hasOwnProperty?true:false;
var _5e7=/^("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t])+?$/;
var pad=function(n){
return n<10?"0"+n:n;
};
var m={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"};
var _5eb=function(s){
if(/["\\\x00-\x1f]/.test(s)){
return "\""+s.replace(/([\x00-\x1f\\"])/g,function(a,b){
var c=m[b];
if(c){
return c;
}
c=b.charCodeAt();
return "\\u00"+Math.floor(c/16).toString(16)+(c%16).toString(16);
})+"\"";
}
return "\""+s+"\"";
};
var _5f0=function(o){
var a=["["],b,i,l=o.length,v;
for(i=0;i<l;i+=1){
v=o[i];
switch(typeof v){
case "undefined":
case "function":
case "unknown":
break;
default:
if(b){
a.push(",");
}
a.push(v===null?"null":$X.JSON.encode(v));
b=true;
}
}
a.push("]");
return a.join("");
};
var _5f3=function(o){
return "\""+o.getFullYear()+"-"+pad(o.getMonth()+1)+"-"+pad(o.getDate())+"T"+pad(o.getHours())+":"+pad(o.getMinutes())+":"+pad(o.getSeconds())+"\"";
};
this.encode=function(o){
return this.encodeInternal(o,false);
};
this.encodeInternal=function(o,cfc){
if(typeof o=="undefined"||o===null){
return "null";
}else{
if(o instanceof Array){
return _5f0(o);
}else{
if(o instanceof Date){
if(cfc){
return this.encodeInternal({_date_:o.getTime()},cfc);
}
return _5f3(o);
}else{
if(typeof o=="string"){
return _5eb(o);
}else{
if(typeof o=="number"){
return isFinite(o)?String(o):"null";
}else{
if(typeof o=="boolean"){
return String(o);
}else{
if(cfc&&typeof o=="object"&&typeof o._metadata!=="undefined"){
return "{\"_metadata\":"+this.encodeInternal(o._metadata,false)+",\"_variables\":"+this.encodeInternal(o._variables,cfc)+"}";
}else{
var a=["{"],b,i,v;
for(var i in o){
if(!_5e6||o.hasOwnProperty(i)){
v=o[i];
switch(typeof v){
case "undefined":
case "function":
case "unknown":
break;
default:
if(b){
a.push(",");
}
a.push(this.encodeInternal(i,cfc),":",v===null?"null":this.encodeInternal(v,cfc));
b=true;
}
}
}
a.push("}");
return a.join("");
}
}
}
}
}
}
}
};
this.decode=function(json){
if(typeof json=="object"){
return json;
}
if($U.isWhitespace(json)){
return null;
}
var _5fb=$U.getFirstNonWhitespaceIndex(json);
if(_5fb>0){
json=json.slice(_5fb);
}
if(window._cf_jsonprefix&&json.indexOf(_cf_jsonprefix)==0){
json=json.slice(_cf_jsonprefix.length);
}
try{
if(_5e7.test(json)){
return eval("("+json+")");
}
}
catch(e){
}
throw new SyntaxError("parseJSON");
};
}();
if(!$C.JSON){
$C.JSON={};
}
$C.JSON.encode=$X.JSON.encode;
$C.JSON.encodeInternal=$X.JSON.encodeInternal;
$C.JSON.decode=$X.JSON.decode;
$C.navigate=function(url,_5fd,_5fe,_5ff,_600,_601){
if(url==null){
$C.handleError(_5ff,"navigate.urlrequired","widget");
return;
}
if(_600){
_600=_600.toUpperCase();
if(_600!="GET"&&_600!="POST"){
$C.handleError(null,"navigate.invalidhttpmethod","http",[_600],null,null,true);
}
}else{
_600="GET";
}
var _602;
if(_601){
_602=$C.getFormQueryString(_601);
if(_602==-1){
$C.handleError(null,"navigate.formnotfound","http",[_601],null,null,true);
}
}
if(_5fd==null){
if(_602){
if(url.indexOf("?")==-1){
url+="?"+_602;
}else{
url+="&"+_602;
}
}
$L.info("navigate.towindow","widget",[url]);
window.location.replace(url);
return;
}
$L.info("navigate.tocontainer","widget",[url,_5fd]);
var obj=$C.objectCache[_5fd];
if(obj!=null){
if(typeof (obj._cf_body)!="undefined"&&obj._cf_body!=null){
_5fd=obj._cf_body;
}
}
$A.replaceHTML(_5fd,url,_600,_602,_5fe,_5ff);
};
$A.checkForm=function(_604,_605,_606,_607,_608){
var _609=_605.call(null,_604);
if(_609==false){
return false;
}
var _60a=$C.getFormQueryString(_604);
$L.info("ajax.submitform.submitting","http",[_604.name]);
$A.replaceHTML(_606,_604.action,_604.method,_60a,_607,_608);
return false;
};
$A.replaceHTML=function(_60b,url,_60d,_60e,_60f,_610){
var _611=document.getElementById(_60b);
if(!_611){
$C.handleError(_610,"ajax.replacehtml.elnotfound","http",[_60b]);
return;
}
var _612="_cf_containerId="+encodeURIComponent(_60b);
_60e=(_60e)?_60e+"&"+_612:_612;
$L.info("ajax.replacehtml.replacing","http",[_60b,url,_60e]);
if(_cf_loadingtexthtml){
try{
_611.innerHTML=_cf_loadingtexthtml;
}
catch(e){
}
}
var _613=function(req,_615){
var _616=false;
if($A.isRequestError(req)){
$C.handleError(_610,"ajax.replacehtml.error","http",[req.status,_615.id,req.statusText],req.status,req.statusText);
_616=true;
}
var _617=new $E.CustomEvent("onReplaceHTML",_615);
var _618=new $E.CustomEvent("onReplaceHTMLUser",_615);
$E.loadEvents[_615.id]={system:_617,user:_618};
if(req.responseText.search(/<script/i)!=-1){
try{
_615.innerHTML="";
}
catch(e){
}
$A.replaceHTML.processResponseText(req.responseText,_615,_610);
}else{
try{
_615.innerHTML=req.responseText;
$A.updateLayouttab(_615);
}
catch(e){
}
}
$E.loadEvents[_615.id]=null;
_617.fire();
_617.unsubscribe();
_618.fire();
_618.unsubscribe();
$L.info("ajax.replacehtml.success","http",[_615.id]);
if(_60f&&!_616){
_60f();
}
};
try{
$A.sendMessage(url,_60d,_60e,true,_613,_611);
}
catch(e){
try{
_611.innerHTML=$L.format(CFMessage["ajax.replacehtml.connectionerrordisplay"],[url,e]);
}
catch(e){
}
$C.handleError(_610,"ajax.replacehtml.connectionerror","http",[_60b,url,e]);
}
};
$A.replaceHTML.processResponseText=function(text,_61a,_61b){
var pos=0;
var _61d=0;
var _61e=0;
_61a._cf_innerHTML="";
while(pos<text.length){
var _61f=text.indexOf("<s",pos);
if(_61f==-1){
_61f=text.indexOf("<S",pos);
}
if(_61f==-1){
break;
}
pos=_61f;
var _620=true;
var _621=$A.replaceHTML.processResponseText.scriptTagChars;
for(var i=1;i<_621.length;i++){
var _623=pos+i+1;
if(_623>text.length){
break;
}
var _624=text.charAt(_623);
if(_621[i][0]!=_624&&_621[i][1]!=_624){
pos+=i+1;
_620=false;
break;
}
}
if(!_620){
continue;
}
var _625=text.substring(_61d,pos);
if(_625){
_61a._cf_innerHTML+=_625;
}
var _626=text.indexOf(">",pos)+1;
if(_626==0){
pos++;
continue;
}else{
pos+=7;
}
var _627=_626;
while(_627<text.length&&_627!=-1){
_627=text.indexOf("</s",_627);
if(_627==-1){
_627=text.indexOf("</S",_627);
}
if(_627!=-1){
_620=true;
for(var i=1;i<_621.length;i++){
var _623=_627+2+i;
if(_623>text.length){
break;
}
var _624=text.charAt(_623);
if(_621[i][0]!=_624&&_621[i][1]!=_624){
_627=_623;
_620=false;
break;
}
}
if(_620){
break;
}
}
}
if(_627!=-1){
var _628=text.substring(_626,_627);
var _629=_628.indexOf("<!--");
if(_629!=-1){
_628=_628.substring(_629+4);
}
var _62a=_628.lastIndexOf("//-->");
if(_62a!=-1){
_628=_628.substring(0,_62a-1);
}
if(_628.indexOf("document.write")!=-1||_628.indexOf("CF_RunContent")!=-1){
if(_628.indexOf("CF_RunContent")!=-1){
_628=_628.replace("CF_RunContent","document.write");
}
_628="var _cfDomNode = document.getElementById('"+_61a.id+"'); var _cfBuffer='';"+"if (!document._cf_write)"+"{document._cf_write = document.write;"+"document.write = function(str){if (_cfBuffer!=null){_cfBuffer+=str;}else{document._cf_write(str);}};};"+_628+";_cfDomNode._cf_innerHTML += _cfBuffer; _cfBuffer=null;";
}
try{
eval(_628);
}
catch(ex){
$C.handleError(_61b,"ajax.replacehtml.jserror","http",[_61a.id,ex]);
}
}
_61f=text.indexOf(">",_627)+1;
if(_61f==0){
_61e=_627+1;
break;
}
_61e=_61f;
pos=_61f;
_61d=_61f;
}
if(_61e<text.length-1){
var _625=text.substring(_61e,text.length);
if(_625){
_61a._cf_innerHTML+=_625;
}
}
try{
_61a.innerHTML=_61a._cf_innerHTML;
$A.updateLayouttab(_61a);
}
catch(e){
}
_61a._cf_innerHTML="";
};
$A.updateLayouttab=function(_62b){
var _62c=_62b.id;
if(_62c.length>13&&_62c.indexOf("cf_layoutarea")==0){
var s=_62c.substr(13,_62c.length);
var cmp=Ext.getCmp(s);
var _62f=_62b.innerHTML;
var _630=document.getElementById(_62c);
var html=_630.innerHTML;
_630.innerHTML="";
if(cmp){
cmp.update("<div id="+_62b.id+">"+html+"</div>");
}
var _630=document.getElementById(_62c);
if(_630){
_630.innerHTML=_62f;
}
}
};
$A.replaceHTML.processResponseText.scriptTagChars=[["s","S"],["c","C"],["r","R"],["i","I"],["p","P"],["t","T"]];
$D.getElement=function(_632,_633){
var _634=function(_635){
return (_635.name==_632||_635.id==_632);
};
var _636=$D.getElementsBy(_634,null,_633);
if(_636.length==1){
return _636[0];
}else{
return _636;
}
};
$D.getElementsBy=function(_637,tag,root){
tag=tag||"*";
var _63a=[];
if(root){
root=$D.get(root);
if(!root){
return _63a;
}
}else{
root=document;
}
var _63b=root.getElementsByTagName(tag);
if(!_63b.length&&(tag=="*"&&root.all)){
_63b=root.all;
}
for(var i=0,len=_63b.length;i<len;++i){
if(_637(_63b[i])){
_63a[_63a.length]=_63b[i];
}
}
return _63a;
};
$D.get=function(el){
if(!el){
return null;
}
if(typeof el!="string"&&!(el instanceof Array)){
return el;
}
if(typeof el=="string"){
return document.getElementById(el);
}else{
var _63e=[];
for(var i=0,len=el.length;i<len;++i){
_63e[_63e.length]=$D.get(el[i]);
}
return _63e;
}
return null;
};
$E.loadEvents={};
$E.CustomEvent=function(_640,_641){
return {name:_640,domNode:_641,subs:[],subscribe:function(func,_643){
var dup=false;
for(var i=0;i<this.subs.length;i++){
var sub=this.subs[i];
if(sub.f==func&&sub.p==_643){
dup=true;
break;
}
}
if(!dup){
this.subs.push({f:func,p:_643});
}
},fire:function(){
for(var i=0;i<this.subs.length;i++){
var sub=this.subs[i];
sub.f.call(null,this,sub.p);
}
},unsubscribe:function(){
this.subscribers=[];
}};
};
$E.windowLoadImpEvent=new $E.CustomEvent("cfWindowLoadImp");
$E.windowLoadEvent=new $E.CustomEvent("cfWindowLoad");
$E.windowLoadUserEvent=new $E.CustomEvent("cfWindowLoadUser");
$E.listeners=[];
$E.addListener=function(el,ev,fn,_64c){
var l={el:el,ev:ev,fn:fn,params:_64c};
$E.listeners.push(l);
var _64e=function(e){
if(!e){
var e=window.event;
}
fn.call(null,e,_64c);
};
if(el.addEventListener){
el.addEventListener(ev,_64e,false);
return true;
}else{
if(el.attachEvent){
el.attachEvent("on"+ev,_64e);
return true;
}else{
return false;
}
}
};
$E.isListener=function(el,ev,fn,_653){
var _654=false;
var ls=$E.listeners;
for(var i=0;i<ls.length;i++){
if(ls[i].el==el&&ls[i].ev==ev&&ls[i].fn==fn&&ls[i].params==_653){
_654=true;
break;
}
}
return _654;
};
$E.callBindHandlers=function(id,_658,ev){
var el=document.getElementById(id);
if(!el){
return;
}
var ls=$E.listeners;
for(var i=0;i<ls.length;i++){
if(ls[i].el==el&&ls[i].ev==ev&&ls[i].fn._cf_bindhandler){
ls[i].fn.call(null,null,ls[i].params);
}
}
};
$E.registerOnLoad=function(func,_65e,_65f,user){
if($E.registerOnLoad.windowLoaded){
if(_65e&&_65e._cf_containerId&&$E.loadEvents[_65e._cf_containerId]){
if(user){
$E.loadEvents[_65e._cf_containerId].user.subscribe(func,_65e);
}else{
$E.loadEvents[_65e._cf_containerId].system.subscribe(func,_65e);
}
}else{
func.call(null,null,_65e);
}
}else{
if(user){
$E.windowLoadUserEvent.subscribe(func,_65e);
}else{
if(_65f){
$E.windowLoadImpEvent.subscribe(func,_65e);
}else{
$E.windowLoadEvent.subscribe(func,_65e);
}
}
}
};
$E.registerOnLoad.windowLoaded=false;
$E.onWindowLoad=function(fn){
if(window.addEventListener){
window.addEventListener("load",fn,false);
}else{
if(window.attachEvent){
window.attachEvent("onload",fn);
}else{
if(document.getElementById){
window.onload=fn;
}
}
}
};
$C.addSpanToDom=function(){
var _662=document.createElement("span");
document.body.insertBefore(_662,document.body.firstChild);
};
$E.windowLoadHandler=function(e){
if(window.Ext){
Ext.BLANK_IMAGE_URL=_cf_ajaxscriptsrc+"/resources/ext/images/default/s.gif";
}
$C.addSpanToDom();
$L.init();
$E.registerOnLoad.windowLoaded=true;
$E.windowLoadImpEvent.fire();
$E.windowLoadImpEvent.unsubscribe();
$E.windowLoadEvent.fire();
$E.windowLoadEvent.unsubscribe();
if(window.Ext){
Ext.onReady(function(){
$E.windowLoadUserEvent.fire();
});
}else{
$E.windowLoadUserEvent.fire();
}
$E.windowLoadUserEvent.unsubscribe();
};
$E.onWindowLoad($E.windowLoadHandler);
$B.register=function(_664,_665,_666,_667){
for(var i=0;i<_664.length;i++){
var _669=_664[i][0];
var _66a=_664[i][1];
var _66b=_664[i][2];
if(window[_669]){
var _66c=eval(_669);
if(_66c&&_66c._cf_register){
_66c._cf_register(_66b,_666,_665);
continue;
}
}
var _66d=$C.objectCache[_669];
if(_66d&&_66d._cf_register){
_66d._cf_register(_66b,_666,_665);
continue;
}
var _66e=$D.getElement(_669,_66a);
var _66f=(_66e&&((!_66e.length&&_66e.length!=0)||(_66e.length&&_66e.length>0)||_66e.tagName=="SELECT"));
if(!_66f){
$C.handleError(null,"bind.register.elnotfound","bind",[_669]);
}
if(_66e.length>1&&!_66e.options){
for(var j=0;j<_66e.length;j++){
$B.register.addListener(_66e[j],_66b,_666,_665);
}
}else{
$B.register.addListener(_66e,_66b,_666,_665);
}
}
if(!$C.bindHandlerCache[_665.bindTo]&&typeof (_665.bindTo)=="string"){
$C.bindHandlerCache[_665.bindTo]=function(){
_666.call(null,null,_665);
};
}
if(_667){
_666.call(null,null,_665);
}
};
$B.register.addListener=function(_671,_672,_673,_674){
if(!$E.isListener(_671,_672,_673,_674)){
$E.addListener(_671,_672,_673,_674);
}
};
$B.assignValue=function(_675,_676,_677,_678){
if(!_675){
return;
}
if(_675.call){
_675.call(null,_677,_678);
return;
}
var _679=$C.objectCache[_675];
if(_679&&_679._cf_setValue){
_679._cf_setValue(_677);
return;
}
var _67a=document.getElementById(_675);
if(!_67a){
$C.handleError(null,"bind.assignvalue.elnotfound","bind",[_675]);
}
if(_67a.tagName=="SELECT"){
var _67b=$U.checkQuery(_677);
var _67c=$C.objectCache[_675];
if(_67b){
if(!_67c||(_67c&&(!_67c.valueCol||!_67c.displayCol))){
$C.handleError(null,"bind.assignvalue.selboxmissingvaldisplay","bind",[_675]);
return;
}
}else{
if(typeof (_677.length)=="number"&&!_677.toUpperCase){
if(_677.length>0&&(typeof (_677[0].length)!="number"||_677[0].toUpperCase)){
$C.handleError(null,"bind.assignvalue.selboxerror","bind",[_675]);
return;
}
}else{
$C.handleError(null,"bind.assignvalue.selboxerror","bind",[_675]);
return;
}
}
_67a.options.length=0;
var _67d;
var _67e=false;
if(_67c){
_67d=_67c.selected;
if(_67d&&_67d.length>0){
_67e=true;
}
}
if(!_67b){
for(var i=0;i<_677.length;i++){
var opt=new Option(_677[i][1],_677[i][0]);
_67a.options[i]=opt;
if(_67e){
for(var j=0;j<_67d.length;j++){
if(_67d[j]==opt.value){
opt.selected=true;
}
}
}
}
}else{
if(_67b=="col"){
var _682=_677.DATA[_67c.valueCol];
var _683=_677.DATA[_67c.displayCol];
if(!_682||!_683){
$C.handleError(null,"bind.assignvalue.selboxinvalidvaldisplay","bind",[_675]);
return;
}
for(var i=0;i<_682.length;i++){
var opt=new Option(_683[i],_682[i]);
_67a.options[i]=opt;
if(_67e){
for(var j=0;j<_67d.length;j++){
if(_67d[j]==opt.value){
opt.selected=true;
}
}
}
}
}else{
if(_67b=="row"){
var _684=-1;
var _685=-1;
for(var i=0;i<_677.COLUMNS.length;i++){
var col=_677.COLUMNS[i];
if(col==_67c.valueCol){
_684=i;
}
if(col==_67c.displayCol){
_685=i;
}
if(_684!=-1&&_685!=-1){
break;
}
}
if(_684==-1||_685==-1){
$C.handleError(null,"bind.assignvalue.selboxinvalidvaldisplay","bind",[_675]);
return;
}
for(var i=0;i<_677.DATA.length;i++){
var opt=new Option(_677.DATA[i][_685],_677.DATA[i][_684]);
_67a.options[i]=opt;
if(_67e){
for(var j=0;j<_67d.length;j++){
if(_67d[j]==opt.value){
opt.selected=true;
}
}
}
}
}
}
}
}else{
_67a[_676]=_677;
}
$E.callBindHandlers(_675,null,"change");
$L.info("bind.assignvalue.success","bind",[_677,_675,_676]);
};
$B.localBindHandler=function(e,_688){
var _689=document.getElementById(_688.bindTo);
var _68a=$B.evaluateBindTemplate(_688,true);
$B.assignValue(_688.bindTo,_688.bindToAttr,_68a);
};
$B.localBindHandler._cf_bindhandler=true;
$B.evaluateBindTemplate=function(_68b,_68c,_68d,_68e,_68f){
var _690=_68b.bindExpr;
var _691="";
if(typeof _68f=="undefined"){
_68f=false;
}
for(var i=0;i<_690.length;i++){
if(typeof (_690[i])=="object"){
var _693=null;
if(!_690[i].length||typeof _690[i][0]=="object"){
_693=$X.JSON.encode(_690[i]);
}else{
var _693=$B.getBindElementValue(_690[i][0],_690[i][1],_690[i][2],_68c,_68e);
if(_693==null){
if(_68c){
_691="";
break;
}else{
_693="";
}
}
}
if(_68d){
_693=encodeURIComponent(_693);
}
_691+=_693;
}else{
var _694=_690[i];
if(_68f==true&&i>0){
if(typeof (_694)=="string"&&_694.indexOf("&")!=0){
_694=encodeURIComponent(_694);
}
}
_691+=_694;
}
}
return _691;
};
$B.jsBindHandler=function(e,_696){
var _697=_696.bindExpr;
var _698=new Array();
var _699=_696.callFunction+"(";
for(var i=0;i<_697.length;i++){
var _69b;
if(typeof (_697[i])=="object"){
if(_697[i].length){
if(typeof _697[i][0]=="object"){
_69b=_697[i];
}else{
_69b=$B.getBindElementValue(_697[i][0],_697[i][1],_697[i][2],false);
}
}else{
_69b=_697[i];
}
}else{
_69b=_697[i];
}
if(i!=0){
_699+=",";
}
_698[i]=_69b;
_699+="'"+_69b+"'";
}
_699+=")";
var _69c=_696.callFunction.apply(null,_698);
$B.assignValue(_696.bindTo,_696.bindToAttr,_69c,_696.bindToParams);
};
$B.jsBindHandler._cf_bindhandler=true;
$B.urlBindHandler=function(e,_69e){
var _69f=_69e.bindTo;
if($C.objectCache[_69f]&&$C.objectCache[_69f]._cf_visible===false){
$C.objectCache[_69f]._cf_dirtyview=true;
return;
}
var url=$B.evaluateBindTemplate(_69e,false,true,false,true);
var _6a1=$U.extractReturnFormat(url);
if(_6a1==null||typeof _6a1=="undefined"){
_6a1="JSON";
}
if(_69e.bindToAttr||typeof _69e.bindTo=="undefined"||typeof _69e.bindTo=="function"){
var _69e={"bindTo":_69e.bindTo,"bindToAttr":_69e.bindToAttr,"bindToParams":_69e.bindToParams,"errorHandler":_69e.errorHandler,"url":url,returnFormat:_6a1};
try{
$A.sendMessage(url,"GET",null,true,$B.urlBindHandler.callback,_69e);
}
catch(e){
$C.handleError(_69e.errorHandler,"ajax.urlbindhandler.connectionerror","http",[url,e]);
}
}else{
$A.replaceHTML(_69f,url,null,null,_69e.callback,_69e.errorHandler);
}
};
$B.urlBindHandler._cf_bindhandler=true;
$B.urlBindHandler.callback=function(req,_6a3){
if($A.isRequestError(req)){
$C.handleError(_6a3.errorHandler,"bind.urlbindhandler.httperror","http",[req.status,_6a3.url,req.statusText],req.status,req.statusText);
}else{
$L.info("bind.urlbindhandler.response","http",[req.responseText]);
var _6a4;
try{
if(_6a3.returnFormat==null||_6a3.returnFormat==="JSON"){
_6a4=$X.JSON.decode(req.responseText);
}else{
_6a4=req.responseText;
}
}
catch(e){
if(req.responseText!=null&&typeof req.responseText=="string"){
_6a4=req.responseText;
}else{
$C.handleError(_6a3.errorHandler,"bind.urlbindhandler.jsonerror","http",[req.responseText]);
}
}
$B.assignValue(_6a3.bindTo,_6a3.bindToAttr,_6a4,_6a3.bindToParams);
}
};
$A.initSelect=function(_6a5,_6a6,_6a7,_6a8){
$C.objectCache[_6a5]={"valueCol":_6a6,"displayCol":_6a7,selected:_6a8};
};
$S.setupSpry=function(){
if(typeof (Spry)!="undefined"&&Spry.Data){
Spry.Data.DataSet.prototype._cf_getAttribute=function(_6a9){
var val;
var row=this.getCurrentRow();
if(row){
val=row[_6a9];
}
return val;
};
Spry.Data.DataSet.prototype._cf_register=function(_6ac,_6ad,_6ae){
var obs={bindParams:_6ae};
obs.onCurrentRowChanged=function(){
_6ad.call(null,null,this.bindParams);
};
obs.onDataChanged=function(){
_6ad.call(null,null,this.bindParams);
};
this.addObserver(obs);
};
if(Spry.Debug.trace){
var _6b0=Spry.Debug.trace;
Spry.Debug.trace=function(str){
$L.info(str,"spry");
_6b0(str);
};
}
if(Spry.Debug.reportError){
var _6b2=Spry.Debug.reportError;
Spry.Debug.reportError=function(str){
$L.error(str,"spry");
_6b2(str);
};
}
$L.info("spry.setupcomplete","bind");
}
};
$E.registerOnLoad($S.setupSpry,null,true);
$S.bindHandler=function(_6b4,_6b5){
var url;
var _6b7="_cf_nodebug=true&_cf_nocache=true";
if(window._cf_clientid){
_6b7+="&_cf_clientid="+_cf_clientid;
}
var _6b8=window[_6b5.bindTo];
var _6b9=(typeof (_6b8)=="undefined");
if(_6b5.cfc){
var _6ba={};
var _6bb=_6b5.bindExpr;
for(var i=0;i<_6bb.length;i++){
var _6bd;
if(_6bb[i].length==2){
_6bd=_6bb[i][1];
}else{
_6bd=$B.getBindElementValue(_6bb[i][1],_6bb[i][2],_6bb[i][3],false,_6b9);
}
_6ba[_6bb[i][0]]=_6bd;
}
_6ba=$X.JSON.encode(_6ba);
_6b7+="&method="+_6b5.cfcFunction;
_6b7+="&argumentCollection="+encodeURIComponent(_6ba);
$L.info("spry.bindhandler.loadingcfc","http",[_6b5.bindTo,_6b5.cfc,_6b5.cfcFunction,_6ba]);
url=_6b5.cfc;
}else{
url=$B.evaluateBindTemplate(_6b5,false,true,_6b9);
$L.info("spry.bindhandler.loadingurl","http",[_6b5.bindTo,url]);
}
var _6be=_6b5.options||{};
if((_6b8&&_6b8._cf_type=="json")||_6b5.dsType=="json"){
_6b7+="&returnformat=json";
}
if(_6b8){
if(_6b8.requestInfo.method=="GET"){
_6be.method="GET";
if(url.indexOf("?")==-1){
url+="?"+_6b7;
}else{
url+="&"+_6b7;
}
}else{
_6be.postData=_6b7;
_6be.method="POST";
_6b8.setURL("");
}
_6b8.setURL(url,_6be);
_6b8.loadData();
}else{
if(!_6be.method||_6be.method=="GET"){
if(url.indexOf("?")==-1){
url+="?"+_6b7;
}else{
url+="&"+_6b7;
}
}else{
_6be.postData=_6b7;
_6be.useCache=false;
}
var ds;
if(_6b5.dsType=="xml"){
ds=new Spry.Data.XMLDataSet(url,_6b5.xpath,_6be);
}else{
ds=new Spry.Data.JSONDataSet(url,_6be);
ds.preparseFunc=$S.preparseData;
}
ds._cf_type=_6b5.dsType;
var _6c0={onLoadError:function(req){
$C.handleError(_6b5.errorHandler,"spry.bindhandler.error","http",[_6b5.bindTo,req.url,req.requestInfo.postData]);
}};
ds.addObserver(_6c0);
window[_6b5.bindTo]=ds;
}
};
$S.bindHandler._cf_bindhandler=true;
$S.preparseData=function(ds,_6c3){
var _6c4=$U.getFirstNonWhitespaceIndex(_6c3);
if(_6c4>0){
_6c3=_6c3.slice(_6c4);
}
if(window._cf_jsonprefix&&_6c3.indexOf(_cf_jsonprefix)==0){
_6c3=_6c3.slice(_cf_jsonprefix.length);
}
return _6c3;
};
$P.init=function(_6c5){
$L.info("pod.init.creating","widget",[_6c5]);
var _6c6={};
_6c6._cf_body=_6c5+"_body";
$C.objectCache[_6c5]=_6c6;
};
$B.cfcBindHandler=function(e,_6c8){
var _6c9=(_6c8.httpMethod)?_6c8.httpMethod:"GET";
var _6ca={};
var _6cb=_6c8.bindExpr;
for(var i=0;i<_6cb.length;i++){
var _6cd;
if(_6cb[i].length==2){
_6cd=_6cb[i][1];
}else{
_6cd=$B.getBindElementValue(_6cb[i][1],_6cb[i][2],_6cb[i][3],false);
}
_6ca[_6cb[i][0]]=_6cd;
}
var _6ce=function(_6cf,_6d0){
$B.assignValue(_6d0.bindTo,_6d0.bindToAttr,_6cf,_6d0.bindToParams);
};
var _6d1={"bindTo":_6c8.bindTo,"bindToAttr":_6c8.bindToAttr,"bindToParams":_6c8.bindToParams};
var _6d2={"async":true,"cfcPath":_6c8.cfc,"httpMethod":_6c9,"callbackHandler":_6ce,"errorHandler":_6c8.errorHandler};
if(_6c8.proxyCallHandler){
_6d2.callHandler=_6c8.proxyCallHandler;
_6d2.callHandlerParams=_6c8;
}
$X.invoke(_6d2,_6c8.cfcFunction,_6c8._cf_ajaxproxytoken,_6ca,_6d1);
};
$B.cfcBindHandler._cf_bindhandler=true;
$U.extractReturnFormat=function(url){
var _6d4;
var _6d5=url.toUpperCase();
var _6d6=_6d5.indexOf("RETURNFORMAT");
if(_6d6>0){
var _6d7=_6d5.indexOf("&",_6d6+13);
if(_6d7<0){
_6d7=_6d5.length;
}
_6d4=_6d5.substring(_6d6+13,_6d7);
}
return _6d4;
};
$U.replaceAll=function(_6d8,_6d9,_6da){
var _6db=_6d8.indexOf(_6d9);
while(_6db>-1){
_6d8=_6d8.replace(_6d9,_6da);
_6db=_6d8.indexOf(_6d9);
}
return _6d8;
};
$U.cloneObject=function(obj){
var _6dd={};
for(key in obj){
var _6de=obj[key];
if(typeof _6de=="object"){
_6de=$U.cloneObject(_6de);
}
_6dd.key=_6de;
}
return _6dd;
};
$C.clone=function(obj,_6e0){
if(typeof (obj)!="object"){
return obj;
}
if(obj==null){
return obj;
}
var _6e1=new Object();
for(var i in obj){
if(_6e0===true){
_6e1[i]=$C.clone(obj[i]);
}else{
_6e1[i]=obj[i];
}
}
return _6e1;
};
$C.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
if(typeof (value)=="object"){
value=$C.printObject(value);
}
str+=value;
}
return str;
};
}
}
cfinit();
