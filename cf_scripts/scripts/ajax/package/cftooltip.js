/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tooltip){
ColdFusion.Tooltip={};
}
ColdFusion.Tooltip.setToolTipOut=function(_377,_378){
var _379=_378.tooltip;
_379.tooltipout=true;
};
ColdFusion.Tooltip.getToolTip=function(_37a,_37b){
var _37c=ColdFusion.objectCache[_37b.context];
if(!_37c){
if(_37b.style){
_37b.styleObj=ColdFusion.Tooltip.parseStyle(_37b.style);
}
_37c=new YAHOO.widget.Tooltip(_37b.context+"_cf_tooltip",_37b);
ColdFusion.objectCache[_37b.context]=_37c;
_37c.doShow(_37a,_37b.context);
if(_37b._cf_url){
var _37d=function(req,_37f){
_37f.tooltip.cfg.setProperty("text",req.responseText);
if(_37f.tooltip.tooltipout==false){
_37f.tooltip.doShow(_37f.event,_37f.id);
}
};
YAHOO.util.Event.addListener(_37b.context,"mouseout",ColdFusion.Tooltip.setToolTipOut,{"tooltip":_37c});
_37c.cfg.setProperty("text",_cf_loadingtexthtml);
_37c.doShow(_37a,_37b.context);
try{
ColdFusion.Log.info("tooltip.gettooltip.fetch","widget",[_37b.context]);
ColdFusion.Ajax.sendMessage(_37b._cf_url,"GET",_37b._cf_query,true,_37d,{tooltip:_37c,event:_37a,id:_37b.context});
}
catch(e){
tooltipdiv=ColdFusion.DOM.getElement(_37b.context);
tooltipdiv.innerHTML="";
ColdFusion.globalErrorHandler(null,e,tooltipdiv);
}
}
}
_37c.tooltipout=false;
};
ColdFusion.Tooltip.parseStyle=function(_380){
var _381={};
if(_380&&typeof _380==="string"){
var _382=_380.split(";");
for(var i=0;i<_382.length;i++){
var temp=_382[i];
tempArray=temp.split(":");
if(tempArray.length===2){
var key=tempArray[0];
key=key.toLowerCase();
var _386=tempArray[1];
switch(key){
case "width":
_381.width=_386;
break;
case "color":
_381.color=_386;
break;
case "background-color":
_381[key]=_386;
break;
case "padding":
_381.padding=_386;
break;
default:
_381[key]=_386;
}
}
}
}
return _381;
};
