/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.MessageBox){
ColdFusion.MessageBox={};
}
var $MB=ColdFusion.MessageBox;
var DEFAULT_OK="Ok";
var DEFAULT_NO="No";
var DEFAULT_CANCEL="Cancel";
var DEFAULT_YES="Yes";
var DEFAULT_ALERT_BUTTON_TYPE=1;
var DEFAULT_CONFIRM_BUTTON_TYPE=6;
var DEFAULT_PROMPT_BUTTON_TYPE=9;
var CF_BEFORE_SHOW_HANDLER_ADDED=false;
var CURRENT_MESSAGEBOX_ID;
var $XB={};
Ext.onReady(function(){
$XB=Ext.MessageBox;
DEFAULT_OK=$XB.buttonText.ok;
DEFAULT_NO=$XB.buttonText.no;
DEFAULT_CANCEL=$XB.buttonText.cancel;
DEFAULT_YES=$XB.buttonText.yes;
DEFAULT_ALERT_BUTTON_TYPE=$XB.OK;
DEFAULT_CONFIRM_BUTTON_TYPE=$XB.YESNO;
DEFAULT_PROMPT_BUTTON_TYPE=$XB.OKCANCEL;
});
ColdFusion.MessageBox.init=function(_475,type,_477,_478,_479,_47a,_47b,_47c,_47d,_47e,_47f,icon,_481,x,y,_484,_485){
var _486={messageBoxId:_475,type:type,callBack_Fn:_47f,multiline:_47d,modal:_47e,width:_481,bodyStyle:_485};
if(_477==null||typeof (_477)=="undefined"){
_477="";
}
_477=ColdFusion.Util.replaceAll(_477,"\n","<br>");
_486.messageText=_477;
if(_479!=null&&typeof (_479)!="undefined"){
_486.label_OK=_479;
}
if(_47a!=null&&typeof (_47a)!="undefined"){
_486.label_NO=_47a;
}
if(_47c!=null&&typeof (_47c)!="undefined"){
_486.label_YES=_47c;
}
if(_47b!=null&&typeof (_47b)!="undefined"){
_486.label_CANCEL=_47b;
}
if(_478==null||typeof (_478)=="undefined"){
type=type.toLowerCase();
if(type=="alert"){
_478="Alert";
}else{
if(type=="confirm"){
_478="Confirm";
}else{
if(type=="prompt"){
_478="Prompt";
}
}
}
}
_486.title=_478;
if(_484&&typeof (_484)=="string"){
_486.buttonType=_484;
}
if(icon&&typeof (icon)=="string"){
_486.icon=icon;
}
if(typeof x=="number"&&x>=0){
_486.x=x;
}
if(typeof y=="number"&&y>=0){
_486.y=y;
}
ColdFusion.objectCache[_475]=_486;
};
$MB.show=function(_487){
var _488=$MB.getMessageBoxObject(_487);
var type=_488.type;
type=(new String(type)).toLowerCase();
if(!CF_BEFORE_SHOW_HANDLER_ADDED){
var _48a=Ext.MessageBox;
_48a.addListener("show",$MB.beforeShowHandler,_488);
CF_BEFORE_SHOW_HANDLER_ADDED=true;
}
CURRENT_MESSAGEBOX_ID=_487;
var _48b=_488.buttonType;
var _48c={ok:DEFAULT_OK,no:DEFAULT_NO,cancel:DEFAULT_CANCEL,yes:DEFAULT_YES};
if(_488.label_OK){
_48c.ok=_488.label_OK;
}
if(_488.label_YES){
_48c.yes=_488.label_YES;
}
if(_488.label_NO){
_48c.no=_488.label_NO;
}
if(_488.label_CANCEL){
_48c.cancel=_488.label_CANCEL;
}
Ext.MessageBox.buttonText=_48c;
if(typeof _48b!="undefined"){
_48b=_48b.toUpperCase();
if(_48b&&_48b!=="OKCANCEL"&&_48b!=="OK"&&_48b!=="YESNOCANCEL"&&_48b!=="YESNO"){
ColdFusion.handleError(null,"messagebox.show.invalidbuttontype","widget",[messagebox,_48b],null,null,true);
}
switch(_48b){
case "OK":
_48b=$XB.OK;
break;
case "OKCANCEL":
_48b=$XB.OKCANCEL;
break;
case "YESNOCANCEL":
_48b=$XB.YESNOCANCEL;
break;
case "YESNO":
_48b=$XB.YESNO;
break;
}
}
var icon=_488.icon;
var _48e="";
if(icon&&typeof (icon)==="string"){
icon=icon.toUpperCase();
switch(icon){
case "ERROR":
_48e=$XB.ERROR;
break;
case "INFO":
_48e=$XB.INFO;
break;
case "QUESTION":
_48e=$XB.QUESTION;
break;
case "WARNING":
_48e=$XB.WARNING;
break;
}
}
var _48f={title:_488.title,msg:_488.messageText,fn:_488.callBack_Fn,modal:_488.modal,icon:_48e,scope:null};
if(_488.width){
_48f.width=_488.width;
if(_48f.width>600){
_48f.maxWidth=_48f.width;
}
if(_48f.width<100){
_48f.minWidth=_48f.width;
}
}
if(type==="alert"){
if(!_48b){
_48b=DEFAULT_ALERT_BUTTON_TYPE;
}
_48f.buttons=_48b;
$XB.show(_48f);
}
if(type==="confirm"){
if(!_48b){
_48b=DEFAULT_CONFIRM_BUTTON_TYPE;
}
_48f.buttons=_48b;
$XB.show(_48f);
}
if(type==="prompt"){
if(!_48b){
_48b=DEFAULT_PROMPT_BUTTON_TYPE;
}
_48f.buttons=_48b;
_48f.prompt=true;
_48f.multiline=_488.multiline;
_48f.value="",$XB.show(_48f);
}
ColdFusion.Log.info("messagebox.show.shown","widget",[_487]);
};
$MB.create=function(_490,type,_492,_493,_494,_495){
if(_490&&typeof _490!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
if(!_490||ColdFusion.trim(_490)==""){
ColdFusion.handleError(null,"messagebox.create.invalidname","widget",null,null,null,true);
return;
}
var _496=ColdFusion.objectCache[_490];
if(_496!=null||typeof _496!="undefined"){
ColdFusion.handleError(null,"messagebox.create.duplicatename","widget",[_490],null,null,true);
return;
}
if(_493&&typeof _493!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_490],null,null,true);
return;
}
if(!_493||ColdFusion.trim(_493)==""){
ColdFusion.handleError(null,"messagebox.create.invalidmessage","widget",[_490],null,null,true);
return;
}
if(_492&&typeof _492!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtitle","widget",[_490],null,null,true);
return;
}
if(type&&typeof type!="string"){
ColdFusion.handleError(null,"messagebox.create.invalidtype","widget",[_490],null,null,true);
return;
}
if(!type||ColdFusion.trim(type)==""){
ColdFusion.handleError(null,"messagebox.create.emptytype","widget",[_490],null,null,true);
return;
}
if(_494&&typeof _494!=="function"){
ColdFusion.handleError(null,"messagebox.create.invalidcallback","widget",[_490],null,null,true);
return;
}
var _497=DEFAULT_CANCEL;
var _498=DEFAULT_NO;
var _499=DEFAULT_OK;
var _49a=DEFAULT_YES;
var _49b=true;
var _49c=null;
var _49d=false;
var icon;
var _49f;
var x;
var y;
var _4a2;
if(_495&&_495.labelok){
_499=_495.labelok;
}
if(_495&&_495.labelno){
_498=_495.labelno;
}
if(_495&&_495.labelyes){
_49a=_495.labelyes;
}
if(_495&&_495.labelcancel){
_497=_495.labelcancel;
}
if(_495&&typeof _495.multiline==="boolean"){
_49d=_495.multiline;
}
if(_495&&typeof _495.modal==="boolean"){
_49b=_495.modal;
}
if(_495&&_495.buttontype){
_49c=_495.buttontype;
if(type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.create.invalidtypeandbuttontypecombination","widget",[_490],null,null,true);
}else{
if(_49c.toUpperCase()!="YESNO"&&_49c.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.create.invalidbuttontype","widget",[_490,_49c],null,null,true);
}
}
}
if(_495&&_495.width){
_49f=_495.width;
if(_49f&&typeof _49f!="number"){
ColdFusion.handleError(null,"messagebox.create.widthnotnumeric","widget",[_490,_49f],null,null,true);
}
}
if(_495&&typeof _495.x!="undefined "){
if(_495.x&&typeof _495.x!="number"){
ColdFusion.handleError(null,"messagebox.create.xnotnumeric","widget",[_490,_495.x],null,null,true);
return;
}
x=_495.x;
}
if(_495&&typeof _495.y!="undefined"){
if(_495.y&&typeof _495.y!="number"){
ColdFusion.handleError(null,"messagebox.create.ynotnumeric","widget",[_490,_495.y],null,null,true);
return;
}
y=_495.y;
}
if(_495&&_495.icon){
icon=_495.icon;
if(icon){
icon=icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.create.invalidicon","widget",[_490,icon],null,null,true);
}
}
}
if(_495&&_495.bodystyle){
_4a2=_495.bodystyle;
}
$MB.init(_490,type,_493,_492,_499,_498,_497,_49a,_49d,_49b,_494,icon,_49f,x,y,_49c,_4a2);
ColdFusion.Log.info("messagebox.create.created","widget",[_490,type]);
};
$MB.updateMessage=function(_4a3,_4a4){
var _4a5=$MB.getMessageBoxObject(_4a3);
_4a5.messageText=_4a4;
ColdFusion.Log.info("messagebox.updatemessage.updated","widget",[_4a3]);
};
$MB.updateTitle=function(_4a6,_4a7){
var _4a8=$MB.getMessageBoxObject(_4a6);
_4a8.title=_4a7;
ColdFusion.Log.info("messagebox.updatetitle.updated","widget",[_4a6]);
};
$MB.update=function(_4a9,_4aa){
var _4ab=$MB.getMessageBoxObject(_4a9);
var _4ac={};
if(!_4aa||typeof _4aa!="object"){
ColdFusion.handleError(null,"messagebox.update.invalidconfigobject","widget",[_4a9],null,null,true);
return;
}
if(_4aa.name&&typeof _4aa.name=="string"){
ColdFusion.handleError(null,"messagebox.update.nameupdatenotallowed","widget",[_4a9],null,null,true);
return;
}
if(_4aa.type&&typeof _4aa.type=="string"){
ColdFusion.handleError(null,"messagebox.update.typeupdatenotallowed","widget",[_4a9],null,null,true);
return;
}
if(_4aa.message){
if(typeof _4aa.message==="string"||typeof _4aa.message=="object"){
_4ac.messageText=_4aa.message;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidmessage","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.title){
if(typeof _4aa.title==="string"||typeof _4aa.title=="object"){
_4ac.title=_4aa.title;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidtitle","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.labelok!=null||typeof _4aa.labelok!="undefined"){
if(typeof _4aa.labelok==="string"||typeof _4aa.labelok=="object"){
_4ac.label_OK=_4aa.labelok;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelok","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.labelno!=null||typeof _4aa.labelno!="undefined"){
if(typeof _4aa.labelno==="string"||typeof _4aa.labelno=="object"){
_4ac.label_NO=_4aa.labelno;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelno","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.labelyes!=null||typeof _4aa.labelyes!="undefined"){
if(typeof _4aa.labelyes==="string"||typeof _4aa.labelyes=="object"){
_4ac.label_YES=_4aa.labelyes;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelyes","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.labelcancel!=null||typeof _4aa.labelcancel!="undefined"){
if(typeof _4aa.labelcancel==="string"||typeof _4aa.labelcancel=="object"){
_4ac.label_CANCEL=_4aa.labelcancel;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidlabelcancel","widget",[_4a9],null,null,true);
return;
}
}
if(typeof _4aa.modal=="boolean"){
_4ac.modal=_4aa.modal;
}
if(typeof _4aa.multiline==="boolean"){
if(_4ab.type.toLowerCase()!="prompt"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeformultiline","widget",[_4a9],null,null,true);
return;
}
_4ac.multiline=_4aa.multiline;
}
if(_4aa&&_4aa.width){
if(typeof _4aa.width==="number"||typeof _4aa.width=="object"){
_4ac.width=_4aa.width;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidwidth","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.icon!=null||typeof _4aa.icon!="undefined"){
if(typeof _4aa.icon==="string"){
icon=_4aa.icon.toUpperCase();
if(icon!="ERROR"&&icon!="INFO"&&icon!="QUESTION"&&icon!="WARNING"){
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_4a9],null,null,true);
return;
}
_4ac.icon=_4aa.icon;
}else{
if(typeof _4aa.icon=="object"&&_4aa.icon==null){
_4ac.icon=null;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidicon","widget",[_4a9],null,null,true);
return;
}
}
}
if(_4aa.callbackhandler!=null||typeof _4aa.callbackhandler!="undefined"){
if(typeof _4aa.callbackhandler==="function"||typeof _4aa.callbackhandler==="object"){
_4ac.callBack_Fn=_4aa.callbackhandler;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidcallbackhandler","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.x!=null||typeof _4aa.x!="undefined"){
if(typeof _4aa.x==="number"||typeof _4aa.x=="object"){
_4ac.x=_4aa.x;
}else{
ColdFusion.handleError(null,"messagebox.update.xnotnumeric","widget",[_4a9,_4aa.x],null,null,true);
return;
}
}
if(_4aa.y!=null||typeof _4aa.y!="undefined"){
if(typeof _4aa.y==="number"||typeof _4aa.y=="object"){
_4ac.y=_4aa.y;
}else{
ColdFusion.handleError(null,"messagebox.update.ynotnumeric","widget",[_4a9,_4aa.y],null,null,true);
return;
}
}
if(_4aa.bodystyle!=null||typeof _4aa.bodystyle!="undefined"){
if(typeof _4aa.bodystyle==="string"||typeof _4aa.bodystyle=="object"){
_4ac.bodyStyle=_4aa.bodystyle;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbodystyle","widget",[_4a9],null,null,true);
return;
}
}
if(_4aa.buttontype!=null||typeof _4aa.buttontype!="undefined"){
if(typeof _4aa.buttontype==="string"||typeof _4aa.buttontype==="object"){
buttonType=_4aa.buttontype;
if(_4ab.type.toUpperCase()!=="CONFIRM"){
ColdFusion.handleError(null,"messagebox.update.invalidtypeandbuttontypecombination","widget",[_4a9],null,null,true);
return;
}else{
if(buttonType.toUpperCase()!="YESNO"&&buttonType.toUpperCase()!="YESNOCANCEL"){
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_4a9],null,null,true);
return;
}
}
_4ac.buttonType=_4aa.buttontype;
}else{
ColdFusion.handleError(null,"messagebox.update.invalidbuttontype","widget",[_4a9],null,null,true);
return;
}
}
for(key in _4ac){
_4ab[key]=_4ac[key];
}
ColdFusion.Log.info("messagebox.update.updated","messagebox",[_4a9]);
};
$MB.getMessageBoxObject=function(_4ad){
var _4ae=ColdFusion.objectCache[_4ad];
if(_4ae==null||typeof (_4ae)=="undefined"){
ColdFusion.handleError(null,"messagebox.getmessageboxobject.missingmessageboxid","widget",[_4ad],null,null,true);
}
return _4ae;
};
$MB.isMessageBoxDefined=function(_4af){
var _4b0=ColdFusion.objectCache[_4af];
if(_4b0==null||typeof (_4b0)=="undefined"){
return false;
}else{
return true;
}
};
$MB.beforeShowHandler=function(_4b1){
var _4b2=$MB.getMessageBoxObject(CURRENT_MESSAGEBOX_ID);
var _4b3=_4b2.x;
var _4b4=_4b2.y;
var _4b5=_4b2.bodyStyle;
var _4b6=_4b1.body.parent();
var id=_4b6.id;
var ele=document.getElementById(id);
if(null!=_4b5){
ele.style.cssText=_4b5;
}
if(_4b3&&_4b4&&typeof _4b3=="number"&&typeof _4b4=="number"&&_4b3>=0&&_4b4>=0){
_4b1.setPosition(_4b3,_4b4);
}else{
_4b1.center();
}
};
