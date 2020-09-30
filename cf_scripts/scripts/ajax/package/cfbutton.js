/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Button){
ColdFusion.Button={};
}
var $BT=ColdFusion.Button;
ColdFusion.Button.init=function(_813,_814,icon,tips,_817,_818,_819,_81a,_81b){
var _81c={renderTo:_813,enableToggle:_81b,text:_814,onClick:_817,onToggle:_818,onMouseOver:_819,onMouseout:_81a,tooltip:tips,icon:icon};
var _81d={renderTo:_813,enableToggle:_81b,text:_814};
if(tips!=null&&typeof tips!="undefined"){
_81d.tooltip=tips;
Ext.QuickTips.init();
}
if(icon!=null&&typeof icon!="undefined"){
_81d.icon=icon;
}
if(icon&&_814){
_81d.iconCls="x-btn-text-icon";
}else{
if(icon&&!_814){
_81d.iconCls="x-btn-icon";
}
}
var _81e=new Ext.Button(_81d);
if(_817!=null&&typeof _817=="function"){
_81e.on("click",_817,_81c);
}
if(_818!=null&&typeof _818=="function"){
_81e.on("toggle",_818,_81c);
}
if(_819!=null&&typeof _819=="function"){
_81e.on("mouseover",_819,_81c);
}
if(_81a!=null&&typeof _81a=="function"){
_81e.on("mouseout",_81a,_81c);
}
_81c.buttonComp=_81e;
ColdFusion.objectCache[_813]=_81c;
ColdFusion.Log.info("button.initialized","widget",[_813]);
};
$BT.show=function(_81f){
var _820=$BT.getButtonObject(_81f);
if(_820!=null){
_820.show();
}
ColdFusion.Log.info("button.show.shown","widget",[_81f]);
};
$BT.hide=function(_821){
var _822=$BT.getButtonObject(_821);
if(_822!=null){
_822.hide();
}
ColdFusion.Log.info("button.hide.hidden","widget",[_821]);
};
$BT.disable=function(_823){
var _824=$BT.getButtonObject(_823);
if(_824!=null){
_824.disable();
}
ColdFusion.Log.info("button.disable.disabled","widget",[_823]);
};
$BT.enable=function(_825){
var _826=$BT.getButtonObject(_825);
if(_826!=null){
_826.enable();
}
ColdFusion.Log.info("button.enable.enabled","widget",[_825]);
};
$BT.getButtonObject=function(_827){
var _828=$BT.getButtonConfigObj(_827);
if(_828!=null){
return _828.buttonComp;
}else{
ColdFusion.handleError(null,"button.component.notFound","widget",[_827],null,null,true);
}
};
$BT.setLabel=function(_829,_82a){
var _82b=$BT.getButtonObject(_829);
if(_82b!=null){
_82b.text=_82a;
}
};
$BT.getButtonConfigObj=function(_82c){
var _82d=ColdFusion.objectCache[_82c];
if(_82d==null||typeof (_82d)=="undefined"){
ColdFusion.handleError(null,"button.component.notFound","widget",[_82c],null,null,true);
}
return _82d;
};
$BT.toggle=function(_82e){
var _82f=$BT.getButtonObject(_82e);
if(_82f!=null){
_82f.toggle();
}
};
