/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Window){
ColdFusion.Window={};
}
ColdFusion.Window.windowIdCounter=1;
ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE="WINDOW_DIV_ID .x-window-tc , WINDOW_DIV_ID .x-window-tl, WINDOW_DIV_ID .x-window-tr, WINDOW_DIV_ID .x-window-bc, WINDOW_DIV_ID .x-window-br, WINDOW_DIV_ID"+" .x-window-bl, WINDOW_DIV_ID  .x-window-ml, WINDOW_DIV_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
ColdFusion.Window.create=function(_4d4,_4d5,url,_4d7){
if(_4d4==null){
ColdFusion.handleError(null,"window.create.nullname","widget",null,null,null,true);
return;
}
if(_4d4==""){
ColdFusion.handleError(null,"window.create.emptyname","widget",null,null,null,true);
return;
}
var _4d8=ColdFusion.objectCache[_4d4];
var _4d9=false;
if(typeof (_4d8)!="undefined"&&_4d8!=null){
if(_4d8.callfromtag){
ColdFusion.handleError(null,"window.create.duplicatename","widget",[_4d4]);
}
if(typeof (_4d8.isConfObj)!="undefined"&&_4d8.isConfObj==true){
_4d9=true;
if(_4d7!=null&&typeof (_4d7.initshow)!="undefined"){
if(_4d7.initshow==false){
return;
}
}
}else{
if(!_4d7||(_4d7&&_4d7.initshow!==false)){
ColdFusion.Window.show(_4d4);
}
return;
}
}
if(!_4d8){
ColdFusion.Log.info("window.create.creating","widget",[_4d4]);
}
var _4da=ColdFusion.Window.createHTML(_4d4,_4d5,url,_4d7,_4d9);
var _4db=ColdFusion.objectCache[_4d4];
if(_4db!=null&&typeof (_4db.isConfObj)!="undefined"&&_4db.isConfObj==true){
return;
}
return ColdFusion.Window.createJSObj(_4d4,url,_4da);
};
ColdFusion.Window.createHTML=function(_4dc,_4dd,url,_4df,_4e0){
var _4e1=null;
var _4e2=null;
if(_4df&&_4df.divid){
_4e1=document.getElementById(_4df.divid);
}
if(_4e1==null){
_4e1=document.createElement("div");
_4e2="cf_window"+ColdFusion.Window.windowIdCounter;
ColdFusion.Window.windowIdCounter++;
_4e1.id=_4e2;
_4e1.className="x-hidden";
}
var _4e3=false;
var _4e4=null;
if(_4df!=null&&typeof (_4df.headerstyle)!="undefined"&&_4df.headerstyle!=null){
var _4e5=new String(_4df.headerstyle);
_4e5=_4e5.toLowerCase();
var _4e6=_4e5.indexOf("background-color");
if(_4e6>=0){
_4e3=true;
var _4e7=_4e5.indexOf(";",_4e6+17);
if(_4e7<0){
_4e7=_4e5.length;
}
_4e4=_4e5.substring(_4e6+17,_4e7);
}
}
var _4e8=document.getElementById(_4dc+"_title-html");
if(_4e3==true&&_4e4){
var _4e9="#"+_4df.divid;
var _4ea="NAME_ID .x-window-tc , NAME_ID .x-window-tl, NAME_ID .x-window-tr, NAME_ID .x-window-bc, NAME_ID .x-window-br, NAME_ID .x-window-bl,NAME_ID .x-window-ml, NAME_ID .x-window-mr { background-image: none; background-color: COLOR_ID; }";
var _4eb=ColdFusion.Util.replaceAll(ColdFusion.Window.TITLE_BGCOLOR_TEMPLATE,"WINDOW_DIV_ID",_4e9);
var _4eb=ColdFusion.Util.replaceAll(_4eb,"COLOR_ID",_4e4);
Ext.util.CSS.createStyleSheet(_4eb);
}
if(_4e8==null){
_4e8=document.createElement("div");
_4e8.id=_4dc+"_title-html";
var _4ec="x-window-header";
_4e8.className=_4ec;
if(_4dd){
_4e8.innerHTML=_4dd;
}else{
_4e8.innerHTML="&nbsp;";
}
}
var _4ed=document.getElementById(_4dc+"-body");
if(_4ed==null){
_4ed=document.createElement("div");
_4ed.id=_4dc+"-body";
_4e1.appendChild(_4ed);
}
var _4ee;
_4ee=ColdFusion.Window.getUpdatedConfigObj(_4df,_4dc);
if(_4df){
_4ee.header={style:_4df.headerstyle};
}
if(typeof (_4ee)=="undefined"){
_4e1.innerHTML="";
return;
}
if(_4e2){
_4ee.divid=_4e2;
}
_4ee.title=_4dd;
if(typeof (_4ee.initshow)!="undefined"&&_4ee.initshow===false){
_4ee.url=url;
ColdFusion.objectCache[_4dc]=_4ee;
ColdFusion.objectCache[_4dc+"-body"]=_4ee;
}
_4ee.items=[{html:_4e1.innerHTML}];
return _4ee;
};
ColdFusion.Window.createJSObj=function(_4ef,url,_4f1){
var _4f2;
var _4f3=false;
if(typeof (_4f1.childlayoutid)&&_4f1.childlayoutid!=null){
_4f3=true;
_4f1.layout="border";
_4f1.items=ColdFusion.objectCache[_4f1.childlayoutid];
}else{
var elem=document.getElementById(_4ef+"-body");
if(elem){
elem.parentNode.removeChild(elem);
}
_4f1.layout="fit";
}
if(typeof (_4f1.autoScroll)=="undefined"){
_4f1.autoScroll=true;
}
if(_4f1.onShow){
_4f1._cf_onShow=_4f1.onShow;
_4f1.onShow=null;
}
if(_4f1.onHide){
_4f1._cf_onHide=_4f1.onHide;
_4f1.onHide=null;
}
_4f2=new Ext.Window(_4f1);
_4f2.show();
_4f2.hide();
_4f2.cfwindowname=_4ef;
_4f2.tempx=_4f1.tempx;
_4f2.tempy=_4f1.tempy;
_4f2.divid=_4f1.divid;
if(typeof (_4f1.headerstyle)!="undefined"&&_4f1.headerstyle!=null){
var _4f5=document.getElementById(_4ef+"_title");
_4f5=_4f5||document.getElementById(_4f2.id+"_header_hd-textEl");
if(_4f5!=null){
_4f5.style.cssText="background:none;"+_4f1.headerstyle;
}
}
if(typeof (_4f1.bodystyle)!="undefined"&&_4f1.bodystyle!=null){
var _4f6=document.getElementById(_4ef+"-body");
if(_4f6){
var _4f7=_4f6.parentNode;
}
if(_4f7!=null){
_4f7.style.cssText=_4f1.bodystyle;
}
}
_4f2.isConfObj=false;
_4f2._cf_body=_4ef+"-body";
ColdFusion.objectCache[_4ef]=_4f2;
if(_4f3){
var _4f8=_4f2.getLayout();
var _4f9=ColdFusion.objectCache[_4f1.childlayoutid];
}
_4f2.addListener("beforeclose",ColdFusion.Window.beforeCloseHandler);
var _4fa=null;
if(typeof (url)!="undefined"&&url!=""){
_4fa=url;
}
if(_4fa==null){
if(typeof (_4f1.initshow)=="undefined"||_4f1.initshow==true){
_4f2.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
ColdFusion.Window.showandhide(_4f2,_4f1);
}
return;
}
ColdFusion.objectCache[_4ef+"-body"]=_4f2;
if(typeof (_4f1.callfromtag)=="undefined"){
var _4fb;
var _4fc;
_4f2._cf_visible=false;
_4f2._cf_dirtyview=true;
_4f2.addListener("show",ColdFusion.Window.showHandler);
_4f2.addListener("hide",ColdFusion.Window.hideHandler);
_4f2.url=_4fa;
if(_4f1){
if(typeof (_4f1.initshow)=="undefined"||_4f1.initshow==true){
ColdFusion.Window.showandhide(_4f2,_4f1);
}
_4fb=_4f1.callbackHandler;
_4fc=_4f1.errorHandler;
}
}else{
_4f2.callfromtag=true;
_4f2._cf_visible=false;
_4f2._cf_dirtyview=true;
_4f2.addListener("show",ColdFusion.Window.showHandler);
_4f2.addListener("beforeshow",ColdFusion.Window.beforeShowHandler);
_4f2.addListener("hide",ColdFusion.Window.hideHandler);
if(typeof (_4f1.initshow)=="undefined"||_4f1.initshow==true){
ColdFusion.Window.showandhide(_4f2,_4f1);
}
}
};
ColdFusion.Window.showandhide=function(_4fd,_4fe){
if(typeof (_4fe.tempinitshow)!="undefined"&&_4fe.tempinitshow==false){
var _4ff=Ext.Element.get(_4fd.divid);
if(typeof _4ff!="undefined"){
_4ff.show();
}
_4ff.hide();
}else{
_4fd.show();
}
};
ColdFusion.Window.destroy=function(_500,_501){
if(_500){
var _502=ColdFusion.Window.getWindowObject(_500);
if(_502){
if(_501===true){
_502.destroy(true);
}else{
_502.destroy();
}
ColdFusion.objectCache[_500]=null;
}
}
};
ColdFusion.Window.resizeHandler=function(_503,_504,_505){
if(typeof (_503.fixedcenter)!="undefined"&&_503.fixedcenter==true){
_503.center();
}
};
ColdFusion.Window.beforeShowHandler=function(_506){
if(typeof (_506.fixedcenter)!="undefined"&&_506.fixedcenter==true){
_506.center();
}
};
ColdFusion.Window.beforeCloseHandler=function(_507){
if(_507.destroyonclose!="undefined"&&_507.destroyonclose==true){
ColdFusion.objectCache[_507.cfwindowname]=null;
return true;
}else{
_507.hide();
return false;
}
};
ColdFusion.Window.showHandler=function(_508){
_508._cf_visible=true;
if(_508._cf_dirtyview){
if(typeof (_508.callfromtag)=="undefined"){
ColdFusion.Ajax.replaceHTML(_508._cf_body,_508.url,"GET",null,_508.callbackHandler,_508.errorHandler);
}else{
var _509=ColdFusion.bindHandlerCache[_508._cf_body];
if(_509){
_509();
}
}
_508._cf_dirtyview=false;
}
};
ColdFusion.Window.hideHandler=function(_50a){
_50a._cf_visible=false;
if(_50a._cf_refreshOnShow){
_50a._cf_dirtyview=true;
}
};
ColdFusion.Window.xPosition=50;
ColdFusion.Window.yPosition=50;
ColdFusion.Window.resetHTML=function(_50b){
var _50c=document.getElementById(_50b);
if(_50c){
_50c.innerHTML="";
}
};
ColdFusion.Window.getUpdatedConfigObj=function(_50d,_50e){
var _50f={};
if(_50d!=null){
if(typeof (_50d)!="object"){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidconfig","widget",[_50e],null,null,true);
return;
}
for(var key in _50d){
if(key=="center"&&ColdFusion.Util.isBoolean(_50d["center"])){
_50f["fixedcenter"]=_50d["center"];
}else{
_50f[key]=_50d[key];
}
}
}
if(typeof (_50f.initshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_50f.initshow)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidinitshow","widget",[_50e],null,null,true);
return;
}else{
_50f.initshow=ColdFusion.Util.castBoolean(_50f.initshow);
_50f._cf_visible=_50f.initshow;
}
}
_50f.tempcenter=null;
if(typeof (_50f.fixedcenter)!="undefined"){
if(ColdFusion.Util.isBoolean(_50f.fixedcenter)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidcenter","widget",[_50e],null,null,true);
return;
}else{
_50f.fixedcenter=ColdFusion.Util.castBoolean(_50f.fixedcenter);
}
}
if(typeof (_50f.resizable)!="undefined"){
if(ColdFusion.Util.isBoolean(_50f.resizable)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidresizable","widget",[_50e],null,null,true);
return;
}else{
_50f.resizable=ColdFusion.Util.castBoolean(_50f.resizable);
}
}
if(typeof (_50f.draggable)!="undefined"){
if(ColdFusion.Util.isBoolean(_50f.draggable)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invaliddraggable","widget",[_50e],null,null,true);
return;
}else{
_50f.draggable=ColdFusion.Util.castBoolean(_50f.draggable);
}
}
if(typeof (_50f.closable)!="undefined"){
if(ColdFusion.Util.isBoolean(_50f.closable)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidclosable","widget",[_50e],null,null,true);
return;
}else{
_50f.closable=ColdFusion.Util.castBoolean(_50f.closable);
}
}
if(typeof (_50f.modal)!="undefined"){
if(ColdFusion.Util.isBoolean(_50f.modal)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidmodal","widget",[_50e],null,null,true);
return;
}else{
_50f.modal=ColdFusion.Util.castBoolean(_50f.modal);
}
}
if(typeof (_50f.refreshonshow)!="undefined"){
if(ColdFusion.Util.isBoolean(_50f.refreshonshow)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidrefreshonshow","widget",[_50e],null,null,true);
return;
}else{
_50f._cf_refreshOnShow=ColdFusion.Util.castBoolean(_50f.refreshonshow);
}
}
_50f.shadow=true;
if(!_50f.height){
_50f.height=300;
}else{
if(ColdFusion.Util.isInteger(_50f.height)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheight","widget",[_50e],null,null,true);
return;
}
}
if(!_50f.width){
_50f.width=500;
}else{
if(ColdFusion.Util.isInteger(_50f.width)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidwidth","widget",[_50e],null,null,true);
return;
}
}
var _511=false;
if(_50f.minwidth){
if(ColdFusion.Util.isInteger(_50f.minwidth)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_50e],null,null,true);
return;
}
var _512=_50f.minwidth;
var _513=_50f.width;
if(typeof (_512)!="number"){
_512=parseInt(_512);
}
if(typeof (_513)!="number"){
_513=parseInt(_513);
}
if(_512>_513){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminwidth","widget",[_50e],null,null,true);
return;
}
_50f.minWidth=_50f.minwidth;
_511=true;
}
if(_50f.minheight){
if(ColdFusion.Util.isInteger(_50f.minheight)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidminheight","widget",[_50e],null,null,true);
return;
}
var _514=_50f.minheight;
var _515=_50f.height;
if(typeof (_514)!="number"){
_514=parseInt(_514);
}
if(typeof (_515)!="number"){
_515=parseInt(_515);
}
if(_514>_515){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidheightvalue","widget",[_50e],null,null,true);
return;
}
_50f.minHeight=_50f.minheight;
_511=true;
}
if(_50f.x){
if(ColdFusion.Util.isInteger(_50f.x)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidx","widget",[_50e],null,null,true);
return;
}
}
if(_50f.y){
if(ColdFusion.Util.isInteger(_50f.y)==false){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.invalidy","widget",[_50e],null,null,true);
return;
}
}
if(typeof (_50f.x)=="undefined"&&(typeof (_50f.fixedcenter)=="undefined"||_50f.fixedcenter==false)){
_50f.x=ColdFusion.Window.xPosition;
ColdFusion.Window.xPosition+=15;
}
if(typeof (_50f.y)=="undefined"&&(typeof (_50f.fixedcenter)=="undefined"||_50f.fixedcenter==false)){
_50f.y=ColdFusion.Window.yPosition;
ColdFusion.Window.yPosition+=15;
}
if(typeof (_50f.initshow)!="undefined"&&_50f.initshow===false){
_50f.tempinitshow=false;
if(typeof (_50f.fixedcenter)!="undefined"&&_50f.fixedcenter===true){
_50f.tempcenter=_50f.fixedcenter;
_50f.fixedcenter=null;
}else{
_50f.tempx=_50f.x;
_50f.tempy=_50f.y;
}
_50f.x=-10000;
_50f.y=-10000;
}
_50f.constraintoviewport=true;
_50f.initshow=true;
if(_50f.resizable!=null&&_50f.resizable==false&&_511==true){
ColdFusion.Window.resetHTML(_50e);
ColdFusion.handleError(null,"window.getupdatedconfigobject.minhwnotallowed","widget",[_50e],null,null,true);
return;
}
_50f.collapsible=false;
_50f.shadow=true;
_50f.isConfObj=true;
return _50f;
};
ColdFusion.Window.show=function(_516){
var _517=ColdFusion.objectCache[_516];
if(typeof (_517)!="undefined"&&_517!=null){
if(typeof (_517.isConfObj)!="undefined"&&_517.isConfObj==true){
_517.initshow=true;
var _518=ColdFusion.Window.createHTML(_516,null,_517.url,_517,true);
ColdFusion.Window.createJSObj(_516,_517.url,_518);
}else{
if(_517.isVisible()==false){
_517.show();
ColdFusion.Log.info("window.show.shown","widget",[_516]);
}
if(_517.tempcenter!=null){
_517.center();
_517.tempcenter=null;
}else{
if(_517.getEl()&&_517.getEl().getX()>0&&_517.getEl().getY()>0){
_517.tempx=null;
_517.tempy=null;
}else{
if(_517.tempx!=null&&_517.tempy!=null){
_517.setPosition(_517.tempx,_517.tempy);
_517.tempx=null;
_517.tempy=null;
}else{
var x=_517.getEl().getX();
var y=_517.getEl().getY();
_517.setPosition(x+1,y+1);
_517.setPosition(x,y);
}
}
}
}
}else{
ColdFusion.handleError(null,"window.show.notfound","widget",[_516],null,null,true);
}
};
ColdFusion.Window.hide=function(_51b){
var _51c=ColdFusion.objectCache[_51b];
if(_51c){
if(_51c.isVisible&&_51c.isVisible()==true){
_51c.hide();
ColdFusion.Log.info("window.hide.hidden","widget",[_51b]);
}
}else{
ColdFusion.handleError(null,"window.hide.notfound","widget",[_51b],null,null,true);
}
};
ColdFusion.Window.onShow=function(_51d,_51e){
var _51f=ColdFusion.objectCache[_51d];
if(typeof (_51f)!="undefined"&&_51f!=null){
_51f._cf_onShow=_51e;
if(_51f.addListener){
_51f.addListener("show",ColdFusion.Window.onShowWrapper);
}
}else{
ColdFusion.handleError(null,"window.onshow.notfound","widget",[_51d],null,null,true);
}
};
ColdFusion.Window.onShowWrapper=function(_520){
_520._cf_onShow.call(null,_520.cfwindowname);
};
ColdFusion.Window.onHide=function(_521,_522){
var _523=ColdFusion.objectCache[_521];
if(typeof (_523)!="undefined"&&_523!=null){
_523._cf_onHide=_522;
if(_523.addListener){
_523.addListener("hide",ColdFusion.Window.onHideWrapper);
}
}else{
ColdFusion.handleError(null,"window.onhide.notfound","widget",[_521],null,null,true);
}
};
ColdFusion.Window.onHideWrapper=function(_524){
_524._cf_onHide.call(null,_524.cfwindowname);
};
ColdFusion.Window.getWindowObject=function(_525){
if(!_525){
ColdFusion.handleError(null,"window.getwindowobject.emptyname","widget",null,null,null,true);
return;
}
var _526=ColdFusion.objectCache[_525];
if(_526==null||(typeof (_526.isConfObj)=="undefined"&&Ext.Window.prototype.isPrototypeOf(_526)==false)){
ColdFusion.handleError(null,"window.getwindowobject.notfound","widget",[_525],null,null,true);
return;
}
if(typeof (_526.isConfObj)!="undefined"&&_526.isConfObj==true){
_526.initshow=true;
var _527=ColdFusion.Window.createHTML(_525,null,_526.url,_526,true);
ColdFusion.Window.createJSObj(_525,_526.url,_527);
ColdFusion.Window.hide(_525);
_526=ColdFusion.objectCache[_525];
}
return _526;
};
