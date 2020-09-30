/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Autosuggest){
ColdFusion.Autosuggest={};
}
var staticgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/static.gif";
var dynamicgifpath=_cf_ajaxscriptsrc+"/resources/cf/images/loading.gif";
ColdFusion.Autosuggest.loadAutoSuggest=function(_4b9,_4ba){
var _4bb=ColdFusion.objectCache[_4ba.autosuggestid];
if(typeof (_4b9)=="string"){
_4b9=_4b9.split(",");
}else{
var _4bc=false;
if(_4b9&&ColdFusion.Util.isArray(_4b9)){
_4bc=true;
if(_4b9.length>0&&(typeof (_4b9[0])!="string"&&typeof (_4b9[0])!="number")){
_4bc=false;
}
}
if(!_4bc){
ColdFusion.handleError(_4bb.onbinderror,"autosuggest.loadautosuggest.invalidvalue","widget",[_4ba.autosuggestid]);
return;
}
}
var _4bd=document.getElementById(_4ba.autosuggestid).value;
if(_4bd.length==1&&_4b9.length==0){
var _4be=new Array();
_4bb.dataSource.flushCache();
_4bb.dataSource=new YAHOO.widget.DS_JSArray(_4be);
_4bb.autosuggestitems=_4be;
}
if(_4b9.length>0){
var i=0;
var _4c0=false;
var _4be=new Array();
for(i=0;i<_4b9.length;i++){
if(_4b9[i]){
if(typeof (_4b9[i])=="string"){
_4be[i]=_4b9[i];
}else{
if(typeof (_4b9[i])=="number"){
_4be[i]=_4b9[i]+"";
}else{
_4be[i]=new String(_4b9[i]);
}
}
if(_4be[i].indexOf(_4bd)==0){
_4c0=true;
}
}
}
if(_4c0==false&&_4bb.showloadingicon==true){
document.getElementById(_4ba.autosuggestid+"_cf_button").src=staticgifpath;
}
_4bb.dataSource.flushCache();
_4bb.dataSource=new YAHOO.widget.DS_JSArray(_4be);
_4bb.autosuggestitems=_4be;
if(_4bb.queryMatchContains){
_4bb.dataSource.queryMatchContains=_4bb.queryMatchContains;
}
_4bb._sendQuery(_4bd);
}else{
if(_4bb.showloadingicon==true){
document.getElementById(_4ba.autosuggestid+"_cf_button").src=staticgifpath;
_4bb.showloadingicon==false;
}
}
};
ColdFusion.Autosuggest.checkToMakeBindCall=function(arg,_4c2,_4c3,_4c4,_4c5){
var _4c4=document.getElementById(_4c2).value;
if(!_4c3.isContainerOpen()&&_4c4.length>0&&arg.keyCode!=39&&(arg.keyCode>31||(arg.keyCode==8&&_4c3.valuePresent==true))){
_4c3.valuePresent=false;
if(_4c3.showloadingicon==true){
document.getElementById(_4c2+"_cf_button").src=dynamicgifpath;
}
ColdFusion.Log.info("autosuggest.checktomakebindcall.fetching","widget",[_4c2,_4c4]);
if(_4c3.cfqueryDelay>0){
var _4c6=setTimeout(_4c5,_4c3.cfqueryDelay*1000,this);
if(_4c3._nDelayID!=-1){
clearTimeout(_4c3._cf_nDelayID);
}
_4c3._cf_nDelayID=_4c6;
}else{
_4c5.call(this);
}
}
};
ColdFusion.Autosuggest.checkValueNotInAutosuggest=function(_4c7,_4c8){
if(_4c7.autosuggestitems){
for(var i=0;i<_4c7.autosuggestitems.length;i++){
if(_4c8==_4c7.autosuggestitems[i]){
return false;
}
}
}
return true;
};
ColdFusion.Autosuggest.triggerOnChange=function(type,args){
var _4cc=args[0];
var _4cd=document.getElementById(_4cc.id);
ColdFusion.Event.callBindHandlers(_4cc.id,null,"change");
};
ColdFusion.Autosuggest.init=function(_4ce,_4cf,_4d0){
return new YAHOO.widget.AutoComplete(_4ce,_4cf,_4d0);
};
ColdFusion.Autosuggest.getAutosuggestObject=function(_4d1){
var _4d2=ColdFusion.objectCache[_4d1];
if(_4d2==null||typeof (_4d2)=="undefined"){
ColdFusion.handleError(null,"autosuggest.getAutosuggestObject.notfound","widget",[_4d1],null,null,true);
}
return _4d2;
};
ColdFusion.Autosuggest.initJS_ARRAY=function(_4d3){
return new YAHOO.widget.DS_JSArray(_4d3);
};
