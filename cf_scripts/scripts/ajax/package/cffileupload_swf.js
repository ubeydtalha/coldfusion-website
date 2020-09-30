/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.FileUpload){
ColdFusion.FileUpload={};
}
var $FS=ColdFusion.FileUpload;
$FS.defaultSWFLocation=_cf_ajaxscriptsrc+"/resources/cf/assets/MultiFileUpload.swf";
var isIE=(navigator.appVersion.indexOf("MSIE")!=-1)?true:false;
var isWin=(navigator.appVersion.toLowerCase().indexOf("win")!=-1)?true:false;
var isOpera=(navigator.userAgent.indexOf("Opera")!=-1)?true:false;
var defaultAddButtonLabel="Add Files";
var defaultUploadButtonLabel="Upload";
var defaultClearButtonLabel="Clear All";
var defaultDeleteButtonLabel="Delete";
var defaultAddIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/addfile.png";
var defaultUploadIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/upload.png";
var defaultClearIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/clear.gif";
var defaultDeleteIcon=_cf_ajaxscriptsrc+"/resources/cf/images/fileupload/delete.png";
var defaultUploadSize=10*1024*1024;
var fileUploadPrefix="cf_fileUpload_";
ColdFusion.FileUpload.create=function(_2a6,_2a7,_2a8,_2a9,_2aa,_2ab,_2ac,_2ad,_2ae,_2af,_2b0,_2b1,_2b2,_2b3,_2b4,_2b5,_2b6,_2b7,_2b8,_2b9,_2ba,_2bb,_2bc,_2bd,_2be,_2bf,_2c0,_2c1,_2c2,_2c3){
var _2c4={};
_2c4.uploadDivId=_2a6;
_2c4.fileUploadName=fileUploadPrefix+_2a6;
_2c4.url_withoutQuery=_2a7;
_2c4.url_queryString=_2a8;
_2c4.url_CF_cookie=_2a9;
_2c4.url=$FS.constructUrl(_2a7,_2a8,_2a9);
_2c4.onCompleteHandler=_2b1;
_2c4.onUploadCompleteHandler=_2b2;
_2c4.onErrorHandler=_2b3;
_2c4.progressbar=_2be;
if(_2b6==null){
_2b6="";
}
_2c4.bgcolor=_2b6;
if(_2b7==null){
_2b7="";
}
_2c4.selectcolor=_2b7;
if(_2b8==null){
_2b8="";
}
_2c4.rollovercolor=_2b8;
if(_2b9==null){
_2b9="";
}
_2c4.textcolor=_2b9;
if(_2bc==null){
_2bc="left";
}
_2c4.titletextalign=_2bc;
if(_2ba==null){
_2ba="";
}
_2c4.titletextcolor=_2ba;
if(_2bb==null){
_2bb="";
}
_2c4.headercolor=_2bb;
_2c4.bgcolor=_2b6;
_2c4.bgcolor=_2b6;
if(_2bd==null){
_2bd="";
}
_2c4.fileFilter=_2bd;
_2c4.disableUploadButton=_2c0;
if(_2c2==null||typeof _2c2=="undefined"){
_2c2="window";
}
_2c4.wmode=_2c2;
_2c4.stopOnError=_2c1;
if(_2aa==null||typeof _2aa==="undefined"){
_2aa=defaultAddButtonLabel;
}
_2c4.addIcon=defaultAddIcon;
_2c4.addButtonLabel=_2aa;
if(_2ac==null||typeof _2ac==="undefined"){
_2ac=defaultUploadButtonLabel;
}
_2c4.uploadButtonLabel=_2ac;
_2c4.uploadIcon=defaultUploadIcon;
if(_2ae==null||typeof _2ae==="undefined"){
_2ae="File Upload ";
}
_2c4.title=_2ae;
_2c4.swfLocation=$FS.defaultSWFLocation;
if(_2ab==null||typeof _2ab==="undefined"){
_2ab=defaultClearButtonLabel;
}
_2c4.clearButtonLabel=_2ab;
_2c4.clearIcon=defaultClearIcon;
if(_2ad==null||typeof _2ad==="undefined"){
_2ad=defaultDeleteButtonLabel;
}
_2c4.deleteButtonLabel=_2ad;
_2c4.deleteIcon=defaultDeleteIcon;
if(_2af==null||!typeof _2af==="Number"){
_2af=-1;
}
_2c4.maxFileSelect=_2af;
if(_2b0==null||!typeof _2b0==="number"){
_2b0=defaultUploadSize;
}
_2c4.maxUploadSize=_2b0;
if(_2b4==null||typeof _2b4==="undefined"){
_2b4=420;
}
_2c4.widthInPx=_2b4+"px";
_2c4.width=_2b4;
if(_2b5==null||typeof _2b5==="undefined"){
_2b5=300;
}
_2c4.heightInPx=_2b5+"px";
_2c4.height=_2b5;
_2c4.align=_2c3;
ColdFusion.objectCache[_2a6]=_2c4;
ColdFusion.objectCache[_2c4.fileUploadName]=_2c4;
var _2c5=$FS.constructMarkup(_2c4);
var _2c6=document.getElementById(_2a6);
_2c6.innerHTML=_2c5;
ColdFusion.Log.info("fileupload.initialized","widget",[_2a6]);
};
$FS.constructMarkup=function(_2c7){
var str="";
if(isIE&&isWin&&!isOpera){
str+="<object width=\""+_2c7.width+"\" height=\""+_2c7.height+"\"";
str+=" id=\""+_2c7.fileUploadName+"\" name=\""+_2c7.playerName+"\" type=\"application/x-shockwave-flash\" classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" ";
str+=" data=\""+_2c7.swfLocation+"\">";
str+="<param name=\"movie\" value=\""+_2c7.swfLocation+"\" />";
str+="<param name=\"quality\" value=\""+_2c7.quality+"\" />";
str+="<param name=\"allowFullScreen\" value=\""+_2c7.fullScreen+"\" />";
str+="<param name=\"allowScriptAccess\" value=\"sameDomain\" />";
str+="<param name=\"wmode\" value=\""+_2c7.wmode+"\" />";
str+="<param name=\"flashvars\" value=\"uniqueid="+_2c7.fileUploadName+"&url="+_2c7.url+"&addLabel="+_2c7.addButtonLabel+"&deleteLabel="+_2c7.deleteButtonLabel;
str+="&clearLabel="+_2c7.clearButtonLabel+"&uploadLabel="+_2c7.uploadButtonLabel+"&maxUploadSize="+_2c7.maxUploadSize+"&maxFileSelect="+_2c7.maxFileSelect+"&progress="+_2c7.progressbar;
str+="&stopOnError="+_2c7.stopOnError+"&hideUpload="+_2c7.disableUploadButton+"&bgcolor="+_2c7.bgcolor+"&fileFilter="+_2c7.fileFilter+"&deleteIcon="+_2c7.deleteIcon+"&title="+_2c7.title;
str+="&uploadIcon="+_2c7.uploadIcon+"&textcolor="+_2c7.textcolor+"&titletextcolor="+_2c7.titletextcolor+"&headercolor="+_2c7.headercolor+"&titletextalign="+_2c7.titletextalign+"&rollovercolor="+_2c7.rollovercolor+"&selectcolor="+_2c7.selectcolor+"\" />";
str+="</object>";
}else{
str="<embed src=\""+_2c7.swfLocation+"\" allowScriptAccess=\"samedomain\" pluginspage=\"http://www.adobe.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" wmode=\""+_2c7.wmode+"\"";
str+=" name=\""+_2c7.fileUploadName+"\" width=\""+_2c7.width+"\" height=\""+_2c7.height+"\" quality=\" "+_2c7.quality+"\"";
str+=" flashvars=\"uniqueid="+_2c7.fileUploadName+"&url="+_2c7.url+"&addLabel="+_2c7.addButtonLabel+"&deleteLabel="+_2c7.deleteButtonLabel;
str+="&clearLabel="+_2c7.clearButtonLabel+"&uploadLabel="+_2c7.uploadButtonLabel+"&maxUploadSize="+_2c7.maxUploadSize+"&maxFileSelect="+_2c7.maxFileSelect+"&progress="+_2c7.progressbar;
str+="&stopOnError="+_2c7.stopOnError+"&hideUpload="+_2c7.disableUploadButton+"&bgcolor="+_2c7.bgcolor+"&fileFilter="+_2c7.fileFilter+"&deleteIcon="+_2c7.deleteIcon+"&title="+_2c7.title;
str+="&uploadIcon="+_2c7.uploadIcon+"&textcolor="+_2c7.textcolor+"&titletextcolor="+_2c7.titletextcolor+"&headercolor="+_2c7.headercolor+"&titletextalign="+_2c7.titletextalign+"&rollovercolor="+_2c7.rollovercolor+"&selectcolor="+_2c7.selectcolor+"\" />";
}
return str;
};
$FS.constructUrl=function(_2c9,_2ca,_2cb){
var url=_2c9;
if(_2ca!=null){
url+="?"+_2ca;
if(_2cb!=null){
url+="%26"+_2cb;
}
}else{
if(_2cb!=null){
url+="?"+_2cb;
}
}
return url;
};
coldfusion_FileUploadSwf_complete=function(name,_2ce){
var _2cf=$FS.getFileUploadComponent(name);
var _2d0=ColdFusion.objectCache[name];
var _2d1=_2d0.onCompleteHandler;
if(_2d1!=null&&typeof _2d1=="function"){
_2d1.call(this,_2ce);
}
$FS.addResultToArray(_2ce,_2d0);
};
coldfusion_FileUploadSwf_onError=function(name,_2d3){
var _2d4=$FS.getFileUploadComponent(name);
var _2d5=ColdFusion.objectCache[name];
var _2d6=_2d5.onErrorHandler;
if(_2d6!=null&&typeof _2d6=="function"){
_2d6.call(this,_2d3);
}
$FS.addResultToArray(_2d3,_2d5);
};
coldfusion_FileUploadSwf_UploadCompete=function(name){
var _2d8=$FS.getFileUploadComponent(name);
var _2d9=ColdFusion.objectCache[name];
var _2da=_2d9.onUploadCompleteHandler;
var _2db=_2d9.resultArray;
if(_2da!=null&&typeof _2da=="function"){
_2da.call(this,_2db);
}
_2d9.resultArray=new Array();
};
$FS.addResultToArray=function(_2dc,_2dd){
var _2de=_2dd.resultArray;
if(_2de==null||typeof _2de=="undefined"){
_2de=_2dd.resultArray=new Array();
}
_2de.push(_2dc);
};
$FS.cancelUpload=function(name){
var _2e0=fileUploadPrefix+name;
var _2e1=$FS.getFileUploadComponent(_2e0);
if(_2e1!=null){
_2e1.cancelFileUpload();
}else{
ColdFusion.handleError(null,"fileupload.cancelupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.cancelupload.cancelled","widget",[name]);
};
$FS.getSelectedFiles=function(name){
var _2e3=fileUploadPrefix+name;
var _2e4=$FS.getFileUploadComponent(_2e3);
if(_2e4!=null){
return _2e4.getSelectedFileArray();
}else{
ColdFusion.handleError(null,"fileupload.getSelectedFiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.getSelectedFiles.selected","widget",[name]);
};
$FS.clearAllFiles=function(name){
var _2e6=fileUploadPrefix+name;
var _2e7=$FS.getFileUploadComponent(_2e6);
if(_2e7!=null){
_2e7.clearAllUpload();
}else{
ColdFusion.handleError(null,"fileupload.clearallfiles.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.clearallfiles.cleared","widget",[name]);
};
$FS.setURL=function(name,src){
var _2ea=$FS.getFileUploadComponent(fileUploadPrefix+name);
var _2eb=ColdFusion.objectCache[name];
if(_2eb==null||typeof (_2eb)=="undefined"){
ColdFusion.handleError(null,"fileupload.setURL.notfound","widget",[name],null,null,true);
}
if(!src||src.length==0){
ColdFusion.handleError(null,"fileupload.setURL.invalidurl","widget",[name],null,null,true);
}
var _2ec=null;
if(src.indexOf("?")>0){
_2ec=src.substring(src.indexOf("?")+1);
_2ec=escape(_2ec);
src=src.substring(0,src.indexOf("?"));
}
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _2ed=_2eb.url_withoutQuery;
_2ed=unescape(_2ed);
var _2ee="";
if(_2ed||_2ed.indexOf("/")>-1){
_2ee=_2ed.substring(0,_2ed.lastIndexOf("/")+1);
}
var _2ef=_2ee+src;
var _2f0=_2ef.split("/");
var _2f1=new Array();
var _2f2=0;
for(var i=0;i<_2f0.length;i++){
if(_2f0[i]==".."){
_2f1[--_2f2]="";
}else{
_2f1[_2f2++]=_2f0[i];
}
}
src=_2f1[0];
for(var i=1;i<_2f2;i++){
src=src+"/"+_2f1[i];
}
}
var _2f4=$FS.constructUrl(src,_2ec,_2eb.url_CF_cookie);
_2eb.url=_2f4;
_2ea.setSrc(_2f4);
ColdFusion.Log.info("fileupload.setURL.urlset","widget",[name,_2f4]);
};
$FS.startUpload=function(name){
var _2f6=fileUploadPrefix+name;
var _2f7=$FS.getFileUploadComponent(_2f6);
if(_2f7!=null){
_2f7.submitUploadForm();
}else{
ColdFusion.handleError(null,"fileupload.startupload.notfound","widget",[name],null,null,true);
}
ColdFusion.Log.info("fileupload.startupload.started","widget",[name]);
};
$FS.getFileUploadComponent=function(name){
if(navigator.appName.indexOf("Microsoft")!=-1){
if(window[name]!=null){
return window[name];
}else{
return document[name];
}
}else{
return document[name];
}
};
