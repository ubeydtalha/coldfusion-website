/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Layout){
ColdFusion.Layout={};
}
var ACCORDION_TITLE_ICON_CSS_TEMPLATE=".{0} { background-image:url({1}); }";
if(!ColdFusion.MapVsAccordion){
ColdFusion.MapVsAccordion={};
}
ColdFusion.Layout.initializeTabLayout=function(id,_1db,_1dc,_1dd,_1de){
Ext.QuickTips.init();
var _1df;
if(_1dc){
_1df={renderTo:id,height:_1dc};
}else{
_1df={renderTo:id,autoHeight:true};
}
if(_1dd&&_1dd!="undefined"){
_1df.width=_1dd;
}else{
_1df.autoWidth=true;
}
if(_1db){
_1df.tabPosition="bottom";
}else{
_1df.enableTabScroll=true;
}
_1df.plain=!_1de;
var _1e0=new Ext.tab.Panel(_1df);
ColdFusion.objectCache[id]=_1e0;
return _1e0;
};
ColdFusion.Layout.getTabLayout=function(_1e1){
var _1e2=ColdFusion.objectCache[_1e1];
if(!_1e2||!(_1e2 instanceof Ext.TabPanel)){
ColdFusion.handleError(null,"layout.gettablayout.notfound","widget",[_1e1],null,null,true);
}
return _1e2;
};
ColdFusion.Layout.onTabActivate=function(tab){
tab._cf_visible=true;
if(tab._cf_dirtyview){
var _1e4=ColdFusion.bindHandlerCache[tab._cf_body];
if(_1e4){
_1e4();
}
tab._cf_dirtyview=false;
}
};
ColdFusion.Layout.onTabDeactivate=function(tab){
tab._cf_visible=false;
if(tab._cf_refreshOnActivate){
tab._cf_dirtyview=true;
}
};
ColdFusion.Layout.onTabClose=function(tab){
tab._cf_visible=false;
};
ColdFusion.Layout.addTab=function(_1e7,_1e8,name,_1ea,_1eb,_1ec,_1ed,_1ee,_1ef){
if(_1eb!=null&&_1eb.length==0){
_1eb=null;
}
var _1f0=_1e7.initialConfig.autoHeight;
if(typeof _1f0=="undefined"){
_1f0=false;
}
var _1f1=Ext.getCmp(name);
if(_1f1){
alert("Component with the name "+name+" already exists. Please use unique names for all the components. Layout will not be rendered");
return;
}
_1f1=new Ext.Panel({title:_1ea,contentEl:_1e8,_cf_body:_1e8,id:name,closable:_1ec,tabTip:_1eb,autoScroll:_1ef,autoShow:true,autoHeight:_1f0});
var tab=_1e7.add(_1f1);
if(_1ee){
_1f1.setDisabled(true);
}
tab._cf_visible=false;
tab._cf_dirtyview=true;
tab._cf_refreshOnActivate=_1ed;
tab.addListener("activate",ColdFusion.Layout.onTabActivate);
tab.addListener("deactivate",ColdFusion.Layout.onTabDeactivate);
tab.addListener("close",ColdFusion.Layout.onTabClose);
ColdFusion.objectCache[name]=tab;
var _1f3=tab.height;
if(_1f3&&_1f3>1){
var _1f4=document.getElementById(_1e8);
_1f4.style.height=_1f3;
}
};
ColdFusion.Layout.enableTab=function(_1f5,_1f6){
var _1f7=ColdFusion.objectCache[_1f5];
var _1f8=ColdFusion.objectCache[_1f6];
if(_1f7&&(_1f7 instanceof Ext.TabPanel)&&_1f8){
_1f8.setDisabled(false);
ColdFusion.Log.info("layout.enabletab.enabled","widget",[_1f6,_1f5]);
}else{
ColdFusion.handleError(null,"layout.enabletab.notfound","widget",[_1f5],null,null,true);
}
};
ColdFusion.Layout.disableTab=function(_1f9,_1fa){
var _1fb=ColdFusion.objectCache[_1f9];
var _1fc=ColdFusion.objectCache[_1fa];
if(_1fb&&(_1fb instanceof Ext.TabPanel)&&_1fc){
_1fc.setDisabled(true);
ColdFusion.Log.info("layout.disabletab.disabled","widget",[_1fa,_1f9]);
}else{
ColdFusion.handleError(null,"layout.disabletab.notfound","widget",[_1f9],null,null,true);
}
};
ColdFusion.Layout.selectTab=function(_1fd,_1fe){
var _1ff=ColdFusion.objectCache[_1fd];
var tab=ColdFusion.objectCache[_1fe];
if(_1ff&&(_1ff instanceof Ext.TabPanel)&&tab){
_1ff.setActiveTab(tab);
ColdFusion.Log.info("layout.selecttab.selected","widget",[_1fe,_1fd]);
}else{
ColdFusion.handleError(null,"layout.selecttab.notfound","widget",[_1fd],null,null,true);
}
};
ColdFusion.Layout.hideTab=function(_201,_202){
var _203=ColdFusion.objectCache[_201];
if(_203&&(_203 instanceof Ext.TabPanel)){
var _204=ColdFusion.objectCache[_202];
var _205=false;
if(_204){
if(_203.getActiveTab()&&_203.getActiveTab().getId()==_202){
var i;
for(i=0;i<_203.items.length;i++){
var _207=_203.getComponent(i);
if(_207.hidden==false){
_205=true;
_207.show();
break;
}
}
if(_205==false){
document.getElementById(_202).style.display="none";
}
}
_204.tab.hide();
ColdFusion.Log.info("layout.hidetab.hide","widget",[_202,_201]);
}
}else{
ColdFusion.handleError(null,"layout.hidetab.notfound","widget",[_201],null,null,true);
}
};
ColdFusion.Layout.showTab=function(_208,_209){
var _20a=ColdFusion.objectCache[_208];
var _20b=ColdFusion.objectCache[_209];
if(_20a&&(_20a instanceof Ext.TabPanel)&&_20b){
_20b.tab.show();
ColdFusion.Log.info("layout.showtab.show","widget",[_209,_208]);
}else{
ColdFusion.handleError(null,"layout.showtab.notfound","widget",[_208],null,null,true);
}
};
ColdFusion.Layout.disableSourceBind=function(_20c){
var _20d=ColdFusion.objectCache[_20c];
if(_20d==null||_20d=="undefined"){
ColdFusion.handleError(null,"layout.disableSourceBind.notfound","widget",[_20c],null,null,true);
}
_20d._cf_dirtyview=false;
};
ColdFusion.Layout.enableSourceBind=function(_20e){
var _20f=ColdFusion.objectCache[_20e];
if(_20f==null||_20f=="undefined"){
ColdFusion.handleError(null,"layout.enableSourceBind.notfound","widget",[_20e],null,null,true);
}
_20f._cf_dirtyview=true;
};
ColdFusion.Layout.createTab=function(_210,_211,_212,_213,_214){
var _215=ColdFusion.objectCache[_210];
var _216=_211;
if(_210&&typeof (_210)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidname","widget",null,null,null,true);
return;
}
if(!_210||ColdFusion.trim(_210)==""){
ColdFusion.handleError(null,"layout.createtab.emptyname","widget",null,null,null,true);
return;
}
if(_211&&typeof (_211)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidareaname","widget",null,null,null,true);
return;
}
if(!_211||ColdFusion.trim(_211)==""){
ColdFusion.handleError(null,"layout.createtab.emptyareaname","widget",null,null,null,true);
return;
}
if(_212&&typeof (_212)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidtitle","widget",null,null,null,true);
return;
}
if(!_212||ColdFusion.trim(_212)==""){
ColdFusion.handleError(null,"layout.createtab.emptytitle","widget",null,null,null,true);
return;
}
if(_213&&typeof (_213)!="string"){
ColdFusion.handleError(null,"layout.createtab.invalidurl","widget",null,null,null,true);
return;
}
if(!_213||ColdFusion.trim(_213)==""){
ColdFusion.handleError(null,"layout.createtab.emptyurl","widget",null,null,null,true);
return;
}
_211="cf_layoutarea"+_211;
if(_215&&(_215 instanceof Ext.TabPanel)){
var _217=null;
var ele=document.getElementById(_211);
if(ele!=null){
ColdFusion.handleError(null,"layout.createtab.duplicateel","widget",[_211],null,null,true);
return;
}
var _219=false;
var _21a=false;
var _21b=false;
var _21c=false;
var _21d=false;
var _21e=null;
if((_215.items.length<=0)){
_21b=true;
}
if(_214!=null){
if(typeof (_214)!="object"){
ColdFusion.handleError(null,"layout.createtab.invalidconfig","widget",null,null,null,true);
return;
}
if(typeof (_214.closable)!="undefined"&&_214.closable==true){
_219=true;
}
if(typeof (_214.disabled)!="undefined"&&_214.disabled==true){
_21a=true;
}
if(typeof (_214.selected)!="undefined"&&_214.selected==true){
_21b=true;
}
if(typeof (_214.inithide)!="undefined"&&_214.inithide==true){
_21c=true;
}
if(typeof (_214.tabtip)!="undefined"&&_214.tabtip!=null){
_21e=_214.tabtip;
}
}
var _21f=document.getElementById(_210);
if(_21f){
var _220=document.getElementById(_210);
var _221=document.createElement("div");
_221.id=_211;
_221.className="ytab";
if(_214!=null&&typeof (_214.align)!="undefined"){
_221.align=_214.align;
}
var _222="";
if(_215.tabheight){
_222="height:"+_215.tabheight+";";
}
if(_214!=null&&typeof (_214.style)!="undefined"){
var _223=new String(_214.style);
_223=_223.toLowerCase();
_222=_222+_223;
}
if(_214!=null&&typeof (_214.overflow)!="undefined"){
var _224=new String(_214.overflow);
_224=_224.toLowerCase();
if(_224!="visible"&&_224!="auto"&&_224!="scroll"&&_224!="hidden"){
ColdFusion.handleError(null,"layout.createtab.invalidoverflow","widget",null,null,null,true);
return;
}
if(_224.toLocaleLowerCase()==="hidden"){
_21d=false;
}
_222=_222+"overflow:"+_224+";";
}else{
_222=_222+"; overflow:auto;";
}
_221.style.cssText=_222;
_220.appendChild(_221);
}
ColdFusion.Layout.addTab(_215,_211,_216,_212,_21e,_219,false,_21a,_21d);
ColdFusion.Log.info("layout.createtab.success","http",[_211,_210]);
if(_21b==true){
ColdFusion.Layout.selectTab(_210,_216);
}
if(_21c==true){
ColdFusion.Layout.hideTab(_210,_216);
}
if(_213!=null&&typeof (_213)!="undefined"&&_213!=""){
if(_213.indexOf("?")!=-1){
_213=_213+"&";
}else{
_213=_213+"?";
}
var _225;
var _226;
if(_214){
_225=_214.callbackHandler;
_226=_214.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_211,_213,"GET",null,_225,_226);
}
}else{
ColdFusion.handleError(null,"layout.createtab.notfound","widget",[_210],null,null,true);
}
};
ColdFusion.Layout.getBorderLayout=function(_227){
var _228=ColdFusion.objectCache[_227];
if(!_228){
ColdFusion.handleError(null,"layout.getborderlayout.notfound","widget",[_227],null,null,true);
}
return _228;
};
ColdFusion.Layout.showArea=function(_229,_22a){
var _22b=ColdFusion.Layout.convertPositionToDirection(_22a);
var _22c=ColdFusion.objectCache[_229];
var _22d;
if(_22c){
var _22e=_22c.items;
for(var i=0;i<_22e.getCount();i++){
var _230=_22e.items[i];
if(_230 instanceof Ext.Panel&&_230.region==_22b){
_22d=_230;
break;
}
}
if(_22d){
_22d.show();
_22d.expand();
ColdFusion.Log.info("layout.showarea.shown","widget",[_22a,_229]);
}else{
ColdFusion.handleError(null,"layout.showarea.areanotfound","widget",[_22a],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.showarea.notfound","widget",[_229],null,null,true);
}
};
ColdFusion.Layout.hideArea=function(_231,_232){
var _233=ColdFusion.Layout.convertPositionToDirection(_232);
var _234=ColdFusion.objectCache[_231];
var _235;
if(_234){
var _236=_234.items;
for(var i=0;i<_236.getCount();i++){
var _238=_236.items[i];
if(_238 instanceof Ext.Panel&&_238.region==_233){
_235=_238;
break;
}
}
if(_235){
_235.hide();
ColdFusion.Log.info("layout.hidearea.hidden","widget",[_232,_231]);
}else{
ColdFusion.handleError(null,"layout.hidearea.areanotfound","widget",[_232],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.hidearea.notfound","widget",[_231],null,null,true);
}
};
ColdFusion.Layout.collapseArea=function(_239,_23a){
var _23b=ColdFusion.Layout.convertPositionToDirection(_23a);
var _23c=ColdFusion.objectCache[_239];
var _23d;
if(_23c){
var _23e=_23c.items;
for(var i=0;i<_23e.getCount();i++){
var _240=_23e.items[i];
if(_240 instanceof Ext.Panel&&_240.region==_23b){
_23d=_240;
break;
}
}
if(_23d){
_23d.collapse();
ColdFusion.Log.info("layout.collpasearea.collapsed","widget",[_23a,_239]);
}else{
ColdFusion.handleError(null,"layout.collpasearea.areanotfound","widget",[_23a],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.collpasearea.notfound","widget",[_23a],null,null,true);
}
};
ColdFusion.Layout.expandArea=function(_241,_242){
var _243=ColdFusion.Layout.convertPositionToDirection(_242);
var _244=ColdFusion.objectCache[_241];
var _245;
if(_244){
var _246=_244.items;
for(var i=0;i<_246.getCount();i++){
var _248=_246.items[i];
if(_248 instanceof Ext.Panel&&_248.region==_243){
_245=_248;
break;
}
}
if(_245){
_245.expand();
ColdFusion.Log.info("layout.expandarea.expanded","widget",[_242,_241]);
}else{
ColdFusion.handleError(null,"layout.expandarea.areanotfound","widget",[_242],null,null,true);
}
}else{
ColdFusion.handleError(null,"layout.expandarea.notfound","widget",[_242],null,null,true);
}
};
ColdFusion.Layout.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
if(typeof (value)==Object){
value=$G.printObject(value);
}
str+=value;
}
return str;
};
ColdFusion.Layout.InitAccordion=function(_24b,_24c,_24d,_24e,_24f,_250,_251,_252){
var _253=false;
if(_24d.toUpperCase()=="LEFT"){
_253=true;
}
if(_250==null||typeof (_250)=="undefined"){
_24f=false;
}
var _254={activeOnTop:_24c,collapseFirst:_253,titleCollapse:_24e,fill:_24f};
var _255={renderTo:_24b,layoutConfig:_254,items:_252,layout:"accordion"};
if(_250==null||typeof (_250)=="undefined"){
_255.autoHeight=true;
_255.height=600;
}else{
_255.height=_250;
}
_255.flex=1;
if(_251==null||typeof (_251)=="undefined"){
_255.autoWidth=true;
}else{
_255.width=_251;
}
_255.align="stretch";
_255.preventRegister=true;
var _256=new Ext.Panel(_255);
ColdFusion.objectCache[_24b]=_256;
ColdFusion.Log.info("layout.accordion.initialized","widget",[_24b]);
return _256;
};
ColdFusion.Layout.InitAccordionChildPanel=function(_257,_258,_259,_25a,_25b,_25c,_25d,_25e){
if(_259==null||typeof (_259)==undefined||_259.length==0){
_259="  ";
}
var _25f={contentEl:_257,id:_258,title:_259,collapsible:_25a,closable:_25b,autoScroll:_25c,_cf_body:_257};
if(_25d&&typeof _25d=="string"){
_25f.iconCls=_25d;
}
_25f.preventRegister=true;
var _260=new Ext.Panel(_25f);
_260._cf_visible=false;
_260._cf_dirtyview=true;
_260._cf_refreshOnActivate=_25e;
_260.on("expand",ColdFusion.Layout.onAccordionPanelExpand,this);
_260.on("collapse",ColdFusion.Layout.onAccordionPanelCollapse,this);
_260.on("hide",ColdFusion.Layout.onAccordionPanelHide,this);
_260.on("show",ColdFusion.Layout.onAccordionPanelExpand,this);
ColdFusion.objectCache[_258]=_260;
ColdFusion.Log.info("layout.accordion.childinitialized","widget",[_258]);
return _260;
};
ColdFusion.Layout.getAccordionLayout=function(_261){
var _262=ColdFusion.objectCache[_261];
if(!_262||!(_262 instanceof Ext.Panel)){
ColdFusion.handleError(null,"layout.getaccordionlayout.notfound","widget",[_261],null,null,true);
}
return _262;
};
ColdFusion.Layout.onAccordionPanelExpand=function(_263){
_263._cf_visible=true;
if(_263._cf_dirtyview){
var _264=ColdFusion.bindHandlerCache[_263._cf_body];
if(_264){
_264();
}
_263._cf_dirtyview=false;
}
var el=Ext.get(_263.contentEl);
el.move("left",1);
el.move("right",1);
var _266=ColdFusion.MapVsAccordion[_263._cf_body];
if(_266!=undefined){
var _267=$MAP.getMapPanelObject(_266);
if(_267!=undefined){
if(_267.initShow===true){
$MAP.show(_266);
}
}
}
};
ColdFusion.Layout.onAccordionPanelCollapse=function(_268){
_268._cf_visible=false;
if(_268._cf_refreshOnActivate){
_268._cf_dirtyview=true;
}
};
ColdFusion.Layout.onAccordionPanelHide=function(_269){
_269._cf_visible=false;
};
ColdFusion.Layout.hideAccordion=function(_26a,_26b){
var _26c=ColdFusion.objectCache[_26a];
var _26d=ColdFusion.objectCache[_26b];
if(!_26c||!_26c instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.layoutnotfound","widget",[_26a],null,null,true);
}
if(!_26d||!_26d instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.hideaccordion.panelnotfound","widget",[_26b],null,null,true);
}
_26d.hide();
ColdFusion.Log.info("layout.hideaccordion.hidden","widget",[_26b,_26a]);
};
ColdFusion.Layout.showAccordion=function(_26e,_26f){
var _270=ColdFusion.objectCache[_26e];
var _271=ColdFusion.objectCache[_26f];
if(!_270||!_270 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.layoutnotfound","widget",[_26e],null,null,true);
}
if(!_271||!_271 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.showaccordion.panelnotfound","widget",[_26f],null,null,true);
}
_271.show();
ColdFusion.Log.info("layout.showaccordion.shown","widget",[_26f,_26e]);
};
ColdFusion.Layout.expandAccordion=function(_272,_273){
var _274=ColdFusion.objectCache[_272];
var _275=ColdFusion.objectCache[_273];
if(!_274||!_274 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.layoutnotfound","widget",[_272],null,null,true);
}
if(!_275||!_275 instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.expandaccordion.panelnotfound","widget",[_273],null,null,true);
}
_275.expand();
ColdFusion.Log.info("layout.expandaccordion.expanded","widget",[_273,_272]);
};
ColdFusion.Layout.selectAccordion=function(_276,_277){
return ColdFusion.Layout.expandAccordion(_276,_277);
};
ColdFusion.Layout.collapseAccordion=function(_278,_279){
var _27a=ColdFusion.objectCache[_278];
var _27b=ColdFusion.objectCache[_279];
if(!_27a||!_27a instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.layoutnotfound","widget",[_278],null,null,true);
}
if(!_27b||!_27b instanceof Ext.Panel){
ColdFusion.handleError(null,"layout.collapseaccordion.panelnotfound","widget",[_279],null,null,true);
}
_27b.collapse();
ColdFusion.Log.info("layout.collapseaccordion.collapsed","widget",[_279,_278]);
};
ColdFusion.Layout.createAccordionPanel=function(_27c,_27d,_27e,url,_280){
var _281=ColdFusion.objectCache[_27c];
var _282=_27d;
if(_27c&&typeof (_27c)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidname","widget",[_27c],null,null,true);
return;
}
if(!_27c||ColdFusion.trim(_27c)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyname","widget",[_27c],null,null,true);
return;
}
if(_27d&&typeof (_27d)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidaccordionpanelname","widget",[_27d],null,null,true);
return;
}
if(!_27d||ColdFusion.trim(_27d)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.emptyaccordionpanelname","widget",[_27d],null,null,true);
return;
}
if(_27e&&typeof (_27e)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_27d],null,null,true);
return;
}
if(!_27e||ColdFusion.trim(_27e)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitle","widget",[_27d],null,null,true);
return;
}
if(url&&typeof (url)!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_27d],null,null,true);
return;
}
if(!url||ColdFusion.trim(url)==""){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidurl","widget",[_27d],null,null,true);
return;
}
_27d="cf_layoutarea"+_282;
if(_281&&(_281 instanceof Ext.Panel)){
var _283=null;
var ele=document.getElementById(_27d);
if(ele!=null){
ColdFusion.handleError(null,"layout.createaccordionpanel.duplicateel","widget",[_27d],null,null,true);
return;
}
var _285=true;
var _286;
var _287=false;
var _288=null;
if(_280!=null){
if(typeof (_280)!="object"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidconfig","widget",[_27d],null,null,true);
return;
}
}
if(_280&&typeof (_280.selected)!="undefined"&&_280.selected==true){
_287=true;
}
if(_280&&_280.titleicon){
if(typeof _280.titleicon!="string"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidtitleicon","widget",[_27d],null,null,true);
return;
}
var _289=Ext.String.format(ACCORDION_TITLE_ICON_CSS_TEMPLATE,_27d,_280.titleicon);
Ext.util.CSS.createStyleSheet(_289,_27d+"_cf_icon");
_288=_27d;
}
var _28a=_281.layoutConfig;
var _28b=true;
if(_28a&&typeof _28a.fill!="undefined"){
_28b=_28a.fill;
}
if(_280!=null&&typeof (_280.overflow)!="undefined"){
var _286=new String(_280.overflow);
_286=_286.toLowerCase();
if(_286!="visible"&&_286!="auto"&&_286!="scroll"&&_286!="hidden"){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflow","widget",[_27d],null,null,true);
return;
}
if(!_28b&&(_286=="auto"||_286=="scroll")){
ColdFusion.handleError(null,"layout.createaccordionpanel.invalidoverflowforfillheight","widget",[_27d],null,null,true);
return;
}
if(_286=="hidden"){
_285=false;
}
}else{
_286="auto";
_285=true;
}
var _28c=document.getElementById(_27c);
if(_28c){
var _28d=document.getElementById(_27c);
var _28e=document.createElement("div");
_28e.id=_27d;
if(_280!=null&&typeof (_280.align)!="undefined"){
_28e.align=_280.align;
}
var _28f="";
if(_281.height){
_28f="height:"+_281.height+";";
}
if(_280!=null&&typeof (_280.style)!="undefined"){
var _290=new String(_280.style);
_290=_290.toLowerCase();
_28f=_28f+_290;
}
_28f=_28f+"overflow:"+_286+";";
_28e.style.cssText=_28f;
_28d.appendChild(_28e);
}
var _291=true;
var _292=true;
itemobj=ColdFusion.Layout.InitAccordionChildPanel(_27d,_282,_27e,_292,_291,_285,_288,false);
_281.add(itemobj);
if(url!=null&&typeof (url)!="undefined"&&url!=""){
if(url.indexOf("?")!=-1){
url=url+"&";
}else{
url=url+"?";
}
var _293;
var _294;
if(_280){
_293=_280.callbackHandler;
_294=_280.errorHandler;
}
ColdFusion.Ajax.replaceHTML(_27d,url,"GET",null,_293,_294);
}
_281.updateLayout();
if(_287){
ColdFusion.Layout.expandAccordion(_27c,_282);
}
ColdFusion.Log.info("layout.createaccordionpanel.created","widget",[_27d]);
}else{
ColdFusion.handleError(null,"layout.createaccordionpanel.layoutnotfound","widget",[_27c],null,null,true);
}
};
ColdFusion.Layout.initViewport=function(_295,item){
var _297=new Array();
_297[0]=item;
var _298={items:_297,layout:"fit",name:_295};
var _299=new Ext.Viewport(_298);
return _299;
};
ColdFusion.Layout.convertPositionToDirection=function(_29a){
if(_29a.toUpperCase()=="LEFT"){
return "west";
}else{
if(_29a.toUpperCase()=="RIGHT"){
return "east";
}else{
if(_29a.toUpperCase()=="CENTER"){
return "center";
}else{
if(_29a.toUpperCase()=="BOTTOM"){
return "south";
}else{
if(_29a.toUpperCase()=="TOP"){
return "north";
}
}
}
}
}
};
ColdFusion.Layout.addMapInAccordionMapping=function(_29b,map){
ColdFusion.MapVsAccordion[_29b]=map;
};
