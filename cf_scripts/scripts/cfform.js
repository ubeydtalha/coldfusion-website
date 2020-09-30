/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
var _CF_error_messages=new Array();
var _CF_error_fields=new Object();
var _CF_FirstErrorField=null;
var _CF_submit_status=new Array();
_CF_signalLoad=function(){
_CF_loaded=1;
};
_CF_onError=function(_91d,_91e,_91f,_920){
if(_CF_error_fields[_91e]==null){
if(_CF_FirstErrorField==null){
_CF_FirstErrorField=_91e;
}
_CF_error_exists=true;
_CF_error_fields[_91e]=_920;
_CF_error_messages[_CF_error_messages.length]=_920;
}
};
_CF_onErrorAlert=function(_921){
var _922="";
for(var i=0;i<_921.length;i++){
_922+=_921[i]+"\n";
}
alert(_922);
return false;
};
updateHiddenValue=function(val,form,name){
if(form==null||form==""){
form=0;
}
if(document.forms[form]==null||document.forms[form][name]==null){
return;
}
document.forms[form][name].value=val;
};
_CF_hasValue=function(obj,_928,_929){
if(_928=="TEXT"||_928=="FILE"||_928=="PASSWORD"||_928=="CFTEXTAREA"||_928=="TEXTAREA"||_928=="CFTEXTINPUT"||_928=="DATEFIELD"){
if(obj.value.length==0){
return false;
}else{
if(_929){
str=obj.value.replace(/^\s+/,"").replace(/\s+$/,"");
if(str.length==0){
return false;
}
}
}
return true;
}else{
if(_928=="SELECT"){
for(i=0;i<obj.length;i++){
if(obj.options[i].selected&&obj.options[i].value.length>0){
return true;
}
}
return false;
}else{
if(_928=="SINGLE_VALUE_RADIO"||_928=="SINGLE_VALUE_CHECKBOX"){
if(obj.checked){
return true;
}else{
return false;
}
}else{
if(_928=="RADIO"||_928=="CHECKBOX"){
if(obj.length==undefined&&obj.checked){
return true;
}else{
for(i=0;i<obj.length;i++){
if(obj[i].checked){
return true;
}
}
}
return false;
}else{
if(_928=="CFTREE"){
if(obj["value"].length>0){
return true;
}else{
return false;
}
}else{
if(_928=="RICHTEXT"){
var _92a=FCKeditorAPI.GetInstance(obj.id);
var val=_92a.GetXHTML();
if(val.length==0){
return false;
}else{
if(_929){
str=val.replace(/^\s+/,"").replace(/\s+$/,"");
if(str.length==0){
return false;
}
}
return true;
}
}else{
return true;
}
}
}
}
}
}
};
_CF_checkdate=function(_92c,_92d){
_92c=_92c.replace(/^\s+/,"").replace(/\s+$/,"");
_92c=_92c=_92c.replace(/{d \'/,"").replace(/'}/,"");
if(_92d){
if(_92c.length==0){
return false;
}
}else{
if(_92c.length==0){
return true;
}
}
if(_92c.length==0){
return true;
}
isplit=_92c.indexOf("/");
splitchr="/";
if(isplit==-1){
isplit=_92c.indexOf(".");
splitchr=".";
}
if(isplit==-1){
isplit=_92c.indexOf("-");
splitchr="-";
}
if(isplit==-1||isplit==_92c.length){
return false;
}
var _92e=_92c.substring(0,isplit);
if(_92e.length==4){
sYear=_92c.substring(0,isplit);
isplit=_92c.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_92c.length){
return false;
}
sMonth=_92c.substring((sYear.length+1),isplit);
sDay=_92c.substring(isplit+1);
}else{
sMonth=_92c.substring(0,isplit);
isplit=_92c.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_92c.length){
return false;
}
sDay=_92c.substring((sMonth.length+1),isplit);
sYear=_92c.substring(isplit+1);
}
if((sDay.length==0)||(sMonth.length==0)||(sYear.length==0)){
return false;
}
if(!_CF_checkinteger(sMonth)){
return false;
}else{
if(!_CF_checkrange(sMonth,1,12)){
return false;
}else{
if(!_CF_checkinteger(sYear)){
return false;
}else{
if(sYear.length!=1&&sYear.length!=2&&sYear.length!=4){
return false;
}else{
if(!_CF_checkrange(sYear,0,9999)){
return false;
}else{
if(!_CF_checkinteger(sDay)){
return false;
}else{
if(!_CF_checkday(sYear,sMonth,sDay)){
return false;
}else{
return true;
}
}
}
}
}
}
}
};
_CF_checkeurodate=function(_92f,_930){
_92f=_92f.replace(/^\s+/,"").replace(/\s+$/,"");
_92f=_92f=_92f.replace(/{d \'/,"").replace(/'}/,"");
if(_930){
if(_92f.length==0){
return false;
}
}else{
if(_92f.length==0){
return true;
}
}
isplit=_92f.indexOf("/");
splitchr="/";
if(isplit==-1){
isplit=_92f.indexOf(".");
splitchr=".";
}
if(isplit==-1){
isplit=_92f.indexOf("-");
splitchr="-";
}
if(isplit==-1||isplit==_92f.length){
return false;
}
var _931=_92f.substring(0,isplit);
if(_931.length==4){
sYear=_92f.substring(0,isplit);
isplit=_92f.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_92f.length){
return false;
}
sMonth=_92f.substring((sYear.length+1),isplit);
sDay=_92f.substring(isplit+1);
}else{
sDay=_92f.substring(0,isplit);
isplit=_92f.indexOf(splitchr,isplit+1);
if(isplit==-1||(isplit+1)==_92f.length){
return false;
}
sMonth=_92f.substring((sDay.length+1),isplit);
sYear=_92f.substring(isplit+1);
}
if(!_CF_checkinteger(sMonth)){
return false;
}else{
if(!_CF_checkrange(sMonth,1,12)){
return false;
}else{
if(!_CF_checkinteger(sYear)){
return false;
}else{
if(!_CF_checkrange(sYear,0,null)){
return false;
}else{
if(!_CF_checkinteger(sDay)){
return false;
}else{
if(!_CF_checkday(sYear,sMonth,sDay)){
return false;
}else{
return true;
}
}
}
}
}
}
};
_CF_checkday=function(_932,_933,_934){
maxDay=31;
if(_933==4||_933==6||_933==9||_933==11){
maxDay=30;
}else{
if(_933==2){
if(_932%4>0){
maxDay=28;
}else{
if(_932%100==0&&_932%400>0){
maxDay=28;
}else{
maxDay=29;
}
}
}
}
return _CF_checkrange(_934,1,maxDay);
};
_CF_checkinteger=function(_935,_936){
_935=_935.replace(/^\s+/,"").replace(/\s+$/,"");
_935=_935.replace(/[$Â£Â¥â‚¬,~+]?/g,"");
if(_936){
if(_935.length==0){
return false;
}
}else{
if(_935.length==0){
return true;
}
}
var _937=".";
var _938=_935.indexOf(_937);
if(_938==-1){
return _CF_checknumber(_935);
}else{
return false;
}
};
_CF_numberrange=function(_939,_93a,_93b,_93c){
if(_93c){
if(_939.length==0){
return false;
}
}else{
if(_939.length==0){
return true;
}
}
if(_93a!=null){
if(_939<_93a){
return false;
}
}
if(_93b!=null){
if(_939>_93b){
return false;
}
}
return true;
};
_CF_checknumber=function(_93d,_93e){
var _93f=" .+-0123456789";
var _940=" .0123456789";
var _941;
var _942=false;
var _943=false;
var _944=false;
_93d=_93d.replace(/^\s+/,"").replace(/\s+$/,"");
_93d=_93d.replace(/[$Â£Â¥â‚¬,~+]?/g,"");
if(_93e){
if(_93d.length==0){
return false;
}
}else{
if(_93d.length==0){
return true;
}
}
_941=_93f.indexOf(_93d.charAt(0));
if(_941==1){
_942=true;
}else{
if(_941<1){
return false;
}
}
for(var i=1;i<_93d.length;i++){
_941=_940.indexOf(_93d.charAt(i));
if(_941<0){
return false;
}else{
if(_941==1){
if(_942){
return false;
}else{
_942=true;
}
}else{
if(_941==0){
if(_942||_944){
_943=true;
}
}else{
if(_943){
return false;
}else{
_944=true;
}
}
}
}
}
return true;
};
_CF_checkrange=function(_946,_947,_948,_949){
_946=_946.replace(/^\s+/,"").replace(/\s+$/,"");
if(_949){
if(_946.length==0){
return false;
}
}else{
if(_946.length==0){
return true;
}
}
if(!_CF_checknumber(_946)){
return false;
}else{
return (_CF_numberrange((eval(_946)),_947,_948));
}
return true;
};
_CF_checktime=function(_94a,_94b){
_94a=_94a.replace(/^\s+/,"").replace(/\s+$/,"");
_94a=_94a.replace(/\s+:\s+/,":");
_94a=_94a=_94a.replace(/{t \'/,"").replace(/'}/,"");
if(_94b){
if(_94a.length==0){
return false;
}
}else{
if(_94a.length==0){
return true;
}
}
var _94c=_CF_checkregex(_94a,/^((([0-1]?\d)|(2[0-3])):[0-5]?\d)?(:[0-5]?\d)? ?([AP]M|[AP]m|[ap]m|[ap]M)?$/,_94b);
return _94c;
};
_CF_checkphone=function(_94d,_94e){
_94d=_94d.replace(/^\s+/,"").replace(/\s+$/,"");
if(_94e){
if(_94d.length==0){
return false;
}
}else{
if(_94d.length==0){
return true;
}
}
if(_94d.length==0){
return true;
}
return _CF_checkregex(_94d,/^(((1))?[ ,\-,\.]?([\\(]?([1-9][0-9]{2})[\\)]?))?[ ,\-,\.]?([^0-1]){1}([0-9]){2}[ ,\-,\.]?([0-9]){4}(( )((x){0,1}([0-9]){1,5}){0,1})?$/,_94e);
};
_CF_checkzip=function(_94f,_950){
_94f=_94f.replace(/^\s+/,"").replace(/\s+$/,"");
if(_950){
if(_94f.length==0){
return false;
}
}else{
if(_94f.length==0){
return true;
}
}
return _CF_checkregex(_94f,/^([0-9]){5,5}$|(([0-9]){5,5}(-| ){1}([0-9]){4,4}$)/,_950);
};
_CF_checkcreditcard=function(_951,_952){
_951=_951.replace(/^\s+/,"").replace(/\s+$/,"");
if(_952){
if(_951.length==0){
return false;
}
}else{
if(_951.length==0){
return true;
}
}
if(_951.length==0){
return true;
}
var _953=" -";
var _954="";
var _955;
for(var i=0;i<_951.length;i++){
_955=_953.indexOf(_951.charAt(i));
if(_955<0){
_954+=_951.substring(i,(i+1));
}
}
if(_954.length<13||_954.length>19){
return false;
}
if(_954.charAt(0)=="+"){
return false;
}
if(!_CF_checkinteger(_954)){
return false;
}
var _957=_954.length%2==1?false:true;
var _958=0;
var _959;
for(var i=0;i<_954.length;i++){
_959=eval(_954.charAt(i));
if(_957){
_959*=2;
_958+=(_959%10);
if((_959/10)>=1){
_958++;
}
_957=false;
}else{
_958+=_959;
_957=true;
}
}
return (_958%10)==0?true:false;
};
_CF_checkssn=function(_95a,_95b){
_95a=_95a.replace(/^\s+/,"").replace(/\s+$/,"");
if(_95b){
if(_95a.length==0){
return false;
}
}else{
if(_95a.length==0){
return true;
}
}
return _CF_checkregex(_95a,/^[0-9]{3}(-| )[0-9]{2}(-| )[0-9]{4}$/,_95b);
};
_CF_checkEmail=function(_95c,_95d){
_95c=_95c.replace(/^\s+/,"").replace(/\s+$/,"");
if(_95d){
if(_95c.length==0){
return false;
}
}else{
if(_95c.length==0){
return true;
}
}
return _CF_checkregex(_95c,/^[a-zA-Z_0-9-'\+~]+(\.[a-zA-Z_0-9-'\+~]+)*@([a-zA-Z_0-9-]+\.)+[a-zA-Z]*$/,_95d);
};
_CF_checkURL=function(_95e,_95f){
_95e=_95e.replace(/^\s+/,"").replace(/\s+$/,"");
if(_95f){
if(_95e.length==0){
return false;
}
}else{
if(_95e.length==0){
return true;
}
}
return _CF_checkregex(_95e.toLowerCase(),/^((http|https|ftp|file)\:\/\/([a-zA-Z0-0]*:[a-zA-Z0-0]*(@))?[a-zA-Z0-9-\.]+(\.[a-zA-Z]{2,3})?(:[a-zA-Z0-9]*)?\/?([a-zA-Z0-9-\._\?\,\'\/\+&amp;%\$#\=~])*)|((mailto)\:[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]*)|((news)\:[a-zA-Z0-9\.]*)$/,_95f);
};
_CF_checkUUID=function(_960,_961){
_960=_960.replace(/^\s+/,"").replace(/\s+$/,"");
if(_961){
if(_960.length==0){
return false;
}
}else{
if(_960.length==0){
return true;
}
}
return _CF_checkregex(_960,/[A-Fa-f0-9]{8,8}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{16,16}/,_961);
};
_CF_checkGUID=function(_962,_963){
_962=_962.replace(/^\s+/,"").replace(/\s+$/,"");
if(_963){
if(_962.length==0){
return false;
}
}else{
if(_962.length==0){
return true;
}
}
return _CF_checkregex(_962,/[A-Fa-f0-9]{8,8}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{4,4}-[A-Fa-f0-9]{12,12}/,_963);
};
_CF_checkBoolean=function(_964,_965){
_964=_964.replace(/^\s+/,"").replace(/\s+$/,"");
if(_965){
if(_964.length==0){
return false;
}
}else{
if(_964.length==0){
return true;
}
}
if(_964.toUpperCase()=="TRUE"||_964.toUpperCase()=="YES"||(_CF_checknumber(_964)&&_964!="0")){
return true;
}else{
if(_964.toUpperCase()=="FALSE"||_964.toUpperCase()=="NO"||_964=="0"){
return true;
}else{
return false;
}
}
};
_CF_setFormParam=function(_966,_967,_968){
var _969="document['"+_966+"']['"+_967+"']";
var obj=eval(_969);
if(obj==undefined){
return false;
}else{
obj.value=_968;
return true;
}
};
_CF_checkregex=function(_96b,_96c,_96d){
if(_96d){
if(_96b.length==0){
return false;
}
}else{
if(_96b.length==0){
return true;
}
}
return _96c.test(_96b);
};
