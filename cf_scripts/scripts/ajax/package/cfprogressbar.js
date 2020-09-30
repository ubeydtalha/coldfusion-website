/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.ProgressBar){
ColdFusion.ProgressBar={};
}
var $P=ColdFusion.ProgressBar;
ColdFusion.ProgressBar.create=function(_1a3,_1a4,_1a5,_1a6,_1a7,_1a8,_1a9,_1aa,_1ab,_1ac){
var _1ad={renderTo:_1a3,interval:_1a6,onComplete:_1aa,autodisplay:_1a9,onError:_1ac};
var _1ae={renderTo:_1a3};
if(_1a8!=null&&typeof (_1a8)!=undefined){
_1ad.width=_1a8;
_1ae.width=_1a8;
}else{
_1ae.width=400;
}
if(_1a7!=null&&typeof (_1a7)!=undefined){
_1ad.height=_1a7;
_1ae.height=_1a7;
}else{
_1ad.autoHeight=true;
_1ae.autoHeight=true;
}
if(_1a4!=null){
_1ad.manual=true;
_1ad.status_retrieval_fn=_1a4;
}else{
_1ad.manual=false;
_1ad.duration=_1a5;
}
_1ad.hidden=!_1a9;
_1ae.hidden=_1ad.hidden;
if(_1ab!=null&&typeof _1ab!="undefined"){
_1ad.cls=_1ab;
_1ae.cls=_1ab;
}
var _1af=new Ext.ProgressBar(_1ae);
_1ad.progressBarComp=_1af;
ColdFusion.objectCache[_1a3]=_1ad;
ColdFusion.Log.info("progressbar.create.created","widget",[_1a3]);
};
$P.start=function(_1b0){
var _1b1=$P.getProgressBarObject(_1b0);
var _1b2=ColdFusion.objectCache[_1b0];
if(!_1b1.isVisible()){
_1b1=_1b1.show();
}
_1b2.started=true;
if(_1b2.manual==false){
var _1b3=_1b2.interval;
var _1b4=_1b2.duration;
var _1b5=_1b4/_1b3;
_1b1.wait({interval:_1b3,duration:_1b4,increment:_1b5,fn:$P.automaticPBCompleteHandler,scope:_1b2});
}else{
var _1b6=setInterval(_1b2.status_retrieval_fn,_1b2.interval);
_1b2.processId=_1b6;
}
ColdFusion.Log.info("progressbar.start.started","widget",[_1b0]);
};
$P.stop=function(_1b7,_1b8){
var pBar=$P.getProgressBarObject(_1b7);
var _1ba=ColdFusion.objectCache[_1b7];
var _1bb=_1ba.processId;
if(typeof _1ba.started!="undefined"&&_1ba.started==true){
_1ba.started=false;
}else{
ColdFusion.Log.info("progressbar.stop.nonrunning","widget",[_1b7]);
return;
}
if(_1bb!=null&&typeof (_1bb)!="undefined"){
clearInterval(_1bb);
}
if(typeof _1ba.manual!="undefined"&&_1ba.manual==false){
pBar.reset();
}
if(_1b8&&_1b8==true){
var _1bc=_1ba.onComplete;
if(_1bc!=null&&_1bc.call){
_1bc.call();
}
}
ColdFusion.Log.info("progressbar.stop.stopped","widget",[_1b7]);
};
$P.hide=function(_1bd){
var pBar=$P.getProgressBarObject(_1bd);
if(pBar.isVisible()){
pBar.hide();
}
ColdFusion.Log.info("progressbar.hide.hidden","widget",[_1bd]);
};
$P.show=function(_1bf){
var pBar=$P.getProgressBarObject(_1bf);
if(!pBar.isVisible()){
pBar.show();
}
ColdFusion.Log.info("progressbar.show.shown","widget",[_1bf]);
};
$P.reset=function(_1c1){
var pBar=$P.getProgressBarObject(_1c1);
if(typeof pBar!="undefined"){
pBar.reset();
}
ColdFusion.Log.info("progressbar.reset.reset","widget",[_1c1]);
};
$P.updateStatus=function(_1c3,_1c4,_1c5){
var pBar=$P.getProgressBarObject(_1c3);
if(typeof (_1c4)=="undefined"||typeof (_1c4)!="number"){
ColdFusion.handleError(null,"progressbar.updatestatus.invalidstatus","widget",[_1c3,_1c4],null,null,true);
return;
}
if(typeof pBar!="undefined"){
pBar.updateProgress(_1c4,_1c5);
}
ColdFusion.Log.info("progressbar.updatestatus.updated","widget",[_1c3]);
};
$P.update=function(_1c7,_1c8){
var _1c9={};
var _1ca=ColdFusion.objectCache[_1c7];
if(_1ca==null||typeof (_1ca)=="undefined"){
ColdFusion.handleError(null,"progressbar.update.notfound","widget",[_1c7],null,null,true);
return;
}
if(_1c8.duration){
if(typeof _1c8.duration==="number"||typeof _1c8.duration=="object"){
_1c9.duration=_1c8.duration;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidduration","widget",[_1c7],null,null,true);
return;
}
}
if(_1c8.interval){
if(typeof _1c8.interval==="number"||typeof _1c8.interval=="object"){
_1c9.interval=_1c8.interval;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidinterval","widget",[_1c7],null,null,true);
return;
}
}
if(_1c8.oncomplete){
if(typeof _1c8.oncomplete==="function"||typeof _1c8.oncomplete=="object"){
_1c9.onComplete=_1c8.oncomplete;
}else{
ColdFusion.handleError(null,"progressbar.update.invalidoncomplete","widget",[_1c7],null,null,true);
return;
}
}
for(key in _1c9){
_1ca[key]=_1c9[key];
}
ColdFusion.Log.info("progressbar.update.updated","widget",[_1c7]);
};
$P.loadStatus=function(data,_1cc){
var _1cd=ColdFusion.AjaxProxy.JSON.decode(data);
var _1ce=_1cd.MESSAGE;
var _1cf=_1cd.STATUS;
var pBar=$P.getProgressBarObject(_1cc._cf_progressbarid);
pBar.updateProgress(_1cf,_1ce);
if(_1cf&&(_1cf===1||_1cf==1||_1cf>1)){
$P.stop(_1cc._cf_progressbarid,true);
}
};
$P.automaticPBCompleteHandler=function(){
var _1d1=this.progressBarComp;
_1d1.updateProgress(1);
if(this.onComplete&&typeof this.onComplete=="function"){
this.onComplete.call(_1d1,_1d1);
}
};
$P.errorHandler=function(_1d2,_1d3,_1d4){
var pbId=_1d4.bindToParams._cf_progressbarid;
var _1d6=ColdFusion.objectCache[pbId];
var _1d7=_1d6.onError;
if(_1d7!=null&&typeof _1d7==="function"){
_1d7.call(null,_1d2,_1d3);
}
$P.stop(pbId);
};
$P.getProgressBarObject=function(_1d8){
var _1d9=ColdFusion.objectCache[_1d8];
if(_1d9==null||typeof (_1d9)=="undefined"){
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarid","widget",[_1d8],null,null,true);
return;
}
if(_1d9.progressBarComp&&typeof _1d9.progressBarComp!="undefined"){
return _1d9.progressBarComp;
}else{
ColdFusion.handleError(null,"progressbar.getProgressBarObject.missingprogressbarcomponent","widget",[_1d8],null,null,true);
return;
}
};
