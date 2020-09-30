/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
var KT_focusedEl=null;
KT_validateSingle=function(_96e,_96f){
var _970=_96e.charCodeAt(0);
switch(_96f){
case "9":
if(_970<58&&_970>47){
return true;
}
break;
case "A":
if((_970<91&&_970>64)||(_970<123&&_970>96)){
return true;
}
break;
case "X":
if((_970<91&&_970>64)||(_970<123&&_970>96)||(_970<58&&_970>47)){
return true;
}
break;
case "?":
return true;
break;
default:
return true;
break;
}
};
KT_maskDefaultValue=function(_971){
switch(_971){
case "9":
return "0";
break;
case "A":
return "a";
break;
case "X":
return "0";
break;
case "?":
return "0";
break;
default:
return "0";
break;
}
};
KT_isSpecialChar=function(_972){
if(_972=="9"||_972=="A"||_972=="X"||_972=="?"){
return true;
}else{
return false;
}
};
mask_onValueChanged=function(){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
if(KT_focusedEl==null||KT_focusedEl.mask==null||KT_focusedEl.mask==""){
return;
}
var mask=KT_focusedEl.mask;
var val=KT_focusedEl.value;
var i=0;
var _976=false;
if(val==KT_focusedEl.oldText){
return;
}
if(val.length>mask.length){
val=val.substr(0,mask.length);
_976=true;
}
for(;i<mask.length;i++){
if(val.charCodeAt(i).toString()!="NaN"){
if(KT_isSpecialChar(mask.charAt(i))){
if(KT_validateSingle(val.charAt(i),mask.charAt(i))){
continue;
}else{
val=KT_focusedEl.oldText;
i=mask.length;
break;
}
}else{
if(val.charAt(i)!=mask.charAt(i)){
if(i==val.length-1){
var _977=val.substr(val.length-1,val.length);
val=val.substr(0,val.length-1)+mask.charAt(i)+_977;
_976=true;
continue;
}else{
val=KT_focusedEl.oldText;
i=mask.length;
}
break;
}
}
}else{
if(val.length<KT_focusedEl.oldText.length){
break;
}
for(;i<mask.length;i++){
if(!KT_isSpecialChar(mask.charAt(i))){
val+=mask.charAt(i);
_976=true;
}else{
break;
}
}
break;
}
}
if(val.length>mask.length){
val=val.substr(0,mask.length);
_976=true;
}
if(KT_focusedEl.value!=val){
KT_focusedEl.value=val;
}
KT_focusedEl.oldText=val;
if(_976){
}
};
mask_parseFirstTime=function(_978,mask){
var _97a="";
var _97b="";
cond=1;
imask=0;
ival=0;
cnt=0;
while(cond==1){
cond=1;
if(!KT_isSpecialChar(mask.charAt(imask))){
if(_978.charCodeAt(ival).toString()!="NaN"){
if(mask.charAt(imask)==_978.charAt(ival)){
imask++;
ival++;
}else{
_978=_978.substr(0,ival)+mask.charAt(imask)+_978.substr(ival,_978.length);
imask=0;
ival=0;
cond=1;
}
}else{
_978+=KT_maskDefaultValue(mask.charAt(imask));
}
}else{
imask++;
ival++;
}
if(imask>=mask.length||ival>=_978.length){
cond=0;
}
}
for(i=0;i<mask.length;i++){
if(KT_isSpecialChar(mask.charAt(i))){
_97a+=mask.charAt(i);
if(_978.charCodeAt(i).toString()!="NaN"){
_97b+=_978.charAt(i);
}else{
_97b+=KT_maskDefaultValue(mask.charAt(i));
}
}
}
oldvalue=_978;
_978=_97b;
var _97c="";
for(i=0;i<_97a.length;i++){
if(!KT_validateSingle(_978.charAt(i),_97a.charAt(i))){
_97c+=KT_maskDefaultValue(_97a.charAt(i));
}else{
_97c+=_978.charAt(i);
}
}
var _97d="";
var j=0;
for(i=0;i<mask.length;i++){
if(KT_isSpecialChar(mask.charAt(i))){
_97d+=_97c.charAt(j++);
}else{
_97d+=mask.charAt(i);
}
}
return _97d;
};
mask_onSetFocus=function(obj,mask){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
if(typeof obj.mask=="undefined"){
ret="";
if(obj.value!=""){
ret=mask_parseFirstTime(obj.value,mask);
}
obj.value=ret;
obj.mask=mask;
}
KT_focusedEl=obj;
if(typeof KT_focusedEl.oldText=="undefined"){
KT_focusedEl.oldText=obj.value;
mask_onValueChanged();
}
};
mask_onKillFocus=function(){
if((typeof window.getSelection=="undefined"&&typeof document.selection=="undefined")){
return;
}
mask_onValueChanged();
KT_focusedEl=null;
};
