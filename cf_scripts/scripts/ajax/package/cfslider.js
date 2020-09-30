/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Slider){
ColdFusion.Slider={};
}
var $SL=ColdFusion.Slider;
ColdFusion.Slider.init=function(_174,name,_176,_177,_178,_179,_17a,_17b,_17c,_17d,tip,_17f,_180){
var _181={renderTo:_174,id:name};
if(_17c!=null&&typeof (_17c)!="undefined"){
_181.ClicktoChange=_17c;
}else{
_181.ClicktoChange=false;
}
if(_17d!=null&&typeof (_17d)!="undefined"){
_181.increment=_17d;
}else{
_181.increment=1;
}
if(_17a!=null&&typeof (_17a)!=undefined){
_181.minValue=_17a;
}else{
_181.minValue=0;
}
if(_179!=null&&typeof (_179)!=undefined){
_181.value=_179;
}else{
_181.value=_181.minValue;
}
if(_177!=null&&typeof (_177)!=undefined){
_181.width=_177;
}else{
_181.width=200;
}
if(_178!=null&&typeof (_178)!="undefined"){
_181.height=_178;
}else{
_181.height=100;
}
if(_17b!=null&&typeof (_17b)!=undefined){
_181.maxValue=_17b;
}else{
_181.maxValue=100;
}
if(_176!=null&&typeof (_176)!=undefined){
_181.vertical=_176;
}else{
_181.vertical=false;
}
if(_17f!=null&&typeof (_17f)=="function"){
_181.onChange=_17f;
}
if(_180!=null&&typeof (_180)!="undefined"){
_181.onDrg=_180;
}
Ext.define("Ext.ux.ST",{extend:"Ext.slider.Tip",minWidth:25,minHeight:25,offsets:[0,-10],init:function(_182){
_182.on("dragstart",this.onSlide,this);
_182.on("drag",this.onSlide,this);
_182.on("dragend",this.hide,this);
_182.on("destroy",this.destroy,this);
},onSlide:function(_183,e,_185){
this.show();
this.body.update(this.getText(_183));
this.el.alignTo(_185.el,"b-t?",this.offsets);
this.doAutoRender();
},getText:function(_186){
return _186.getValue()==0?"0":_186.getValue();
}});
if(tip!=null&&typeof (tip)!="undefined"){
if(tip){
_181.plugins=new Ext.ux.ST();
}else{
_181.useTips=false;
}
}
var _187=Ext.create("Ext.slider.Single",_181);
_187.on("drag",$SL.onDragHandler,_181);
_187.on("changecomplete",$SL.onChangeHandler,_181);
_181.sliderComp=_187;
ColdFusion.objectCache[name]=_181;
ColdFusion.Log.info("slider.initialized","widget",[name]);
};
$SL.onDragHandler=function(_188,_189){
var _18a=this.onDrg;
if(_18a!=null&&typeof (_18a)=="function"){
_18a.call(this,_188,_189);
}
};
$SL.onChangeHandler=function(_18b,_18c){
var _18d=this.onChange;
if(_18d!=null&&typeof (_18d)=="function"){
_18d.call(this,_18b,_18c);
}
};
$SL.getValue=function(_18e){
var _18f=ColdFusion.objectCache[_18e];
if(_18f!=null||typeof (_18f)!="undefined"){
var _190=_18f.sliderComp;
if(_190){
return _190.getValue();
}
}else{
ColdFusion.handleError(null,"slider.getvalue.notfound","widget",[_18e],null,null,true);
}
};
$SL.getSliderObject=function(_191){
var _192=ColdFusion.objectCache[_191];
if(_192!=null||typeof (_192)!="undefined"){
return _192.sliderComp;
}else{
return null;
}
};
$SL.setValue=function(_193,_194){
var _195=ColdFusion.objectCache[_193];
if(_195!=null||typeof (_195)!="undefined"){
var _196=_195.sliderComp;
if(_196){
return _196.setValue(_194,true);
}
}else{
ColdFusion.handleError(null,"slider.setvalue.notfound","widget",[_193],null,null,true);
}
};
$SL.show=function(_197){
var _198=ColdFusion.objectCache[_197];
if(_198!=null||typeof (_198)!="undefined"){
var _199=_198.sliderComp;
if(_199){
return _199.show();
}
}else{
ColdFusion.handleError(null,"slider.show.notfound","widget",[_197],null,null,true);
}
ColdFusion.Log.info("slider.show.shown","widget",[_197]);
};
$SL.hide=function(_19a){
var _19b=ColdFusion.objectCache[_19a];
if(_19b!=null||typeof (_19b)!="undefined"){
var _19c=_19b.sliderComp;
if(_19c){
return _19c.hide();
}
}else{
ColdFusion.handleError(null,"slider.hide.notfound","widget",[_19a],null,null,true);
}
ColdFusion.Log.info("slider.hide.hidden","widget",[_19a]);
};
$SL.enable=function(_19d){
var _19e=ColdFusion.objectCache[_19d];
if(_19e!=null||typeof (_19e)!="undefined"){
var _19f=_19e.sliderComp;
if(_19f){
return _19f.enable();
}
}else{
ColdFusion.handleError(null,"slider.enable.notfound","widget",[_19d],null,null,true);
}
ColdFusion.Log.info("slider.enable.enabled","widget",[_19d]);
};
$SL.disable=function(_1a0){
var _1a1=ColdFusion.objectCache[_1a0];
if(_1a1!=null||typeof (_1a1)!="undefined"){
var _1a2=_1a1.sliderComp;
if(_1a2){
return _1a2.disable();
}
}else{
ColdFusion.handleError(null,"slider.disable.notfound","widget",[_1a0],null,null,true);
}
ColdFusion.Log.info("slider.disable.disabled","widget",[_1a0]);
};
