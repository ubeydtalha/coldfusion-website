/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
var cf_ws={URL_PROTOCOL:"ws",URL_CONTEXTROOT:"/cfusion",URL_DEFAULT_PAGE:"/cfusion",URL_PORT:_cf_websocket_port,CONNECTING:0,OPEN:1,CLOSING:2,CLOSED:3,APP_ERROR_CODE:4001,CHANNEL_ERROR_CODE:-1,validRE:/^("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t])+?$/,$:function(_830){
return document.getElementById(_830);
},isWebSocketSupported:function(){
return ((window.WebSocket!==null&&window.WebSocket!==undefined)||(window.MozWebSocket!==null&&window.MozWebSocket!==undefined));
},CFWebSocketWrapper:function(){
this.open=function(_831,_832){
if(self.WebSocket||self.MozWebSocket){
if(!this.wsConnection){
var _833=this;
if("MozWebSocket" in window){
this.wsConnection=new MozWebSocket(_831,"json");
}else{
this.wsConnection=new WebSocket(_831);
}
this.wsConnection.connectionOptions=_832;
this.onWelcome=_832.OnWelcome;
this.wsConnection.onopen=function(_834){
if(_832.OnWelcome){
_832.OnWelcome(_833);
}
};
this.wsConnection.onmessage=function(_835){
var _836=_833.streamToToken(_835.data);
if(_836.code&&_832.onError&&(_836.code==cf_ws.APP_ERROR_CODE||_836.code==cf_ws.CHANNEL_ERROR_CODE)){
_832.onError(_836,_833);
}else{
if(_832.OnMessage){
if(_836.data){
if(cf_ws.validRE.test(_836.data)){
_836.data=_833.streamToToken(_836.data);
}
}
_832.OnMessage(_836,_833);
}
}
};
this.wsConnection.onclose=function(_837){
if(this.wsConnection&&this.wsConnection.readyState==cf_ws.OPEN){
this.wsConnection.readyState=cf_ws.CLOSED;
if(_832.OnClose){
_832.OnClose(_833);
}
}
};
this.wsConnection.onerror=function(_838){
this.wsConnection.readyState=cf_ws.CLOSED;
if(_832.onError){
_832.onError(null,_833);
}
};
}
}else{
throw new Error("Your browser does not have WebSockets support");
}
},this.sendStream=function(_839){
if(this.wsConnection&&this.wsConnection.readyState==cf_ws.OPEN){
this.wsConnection.send(_839);
}else{
throw new Error("Connection not established.");
}
},this.isConnected=function(){
return (this.wsConnection!=null&&this.wsConnection.readyState==cf_ws.OPEN);
},this.forceClose=function(_83a){
},this.close=function(_83b){
if(this.wsConnection){
this.wsConnection.OnWelcome=null;
this.wsConnection.onMessage=null;
if(this.wsConnection.readyState==cf_ws.OPEN){
this.wsConnection.readyState=cf_ws.CLOSING;
this.wsConnection.close();
}
if(this.wsConnection.connectionOptions.OnClose){
this.wsConnection.connectionOptions.OnClose(this.wsConnection.connectionOptions);
}
this.wsConnection=null;
}
},this.getId=function(){
},this.checkCallbacks=function(_83c){
var _83d="utid"+_83c.utid;
},this.createDefaultResult=function(){
return {code:0,msg:"Ok",localeKey:"jws.jsc.res.Ok",args:null,tid:jws.CUR_TOKEN_ID};
},this.tokenToStream=function(_83e){
return ColdFusion.JSON.encode(_83e);
},this.streamToToken=function(data){
if(typeof data=="number"){
return data;
}
try{
return ColdFusion.JSON.decode(data);
}
catch(e){
return data;
}
},this.processResponsePacket=function(_840){
var _841=ColdFusion.JSON.decode(_840.data);
if(_841.type){
if(_841.type=="welcome"&&_841.usid){
this.fSessionId=_841.usid;
this.fClientId=_841.sourceId;
if(this.fOnWelcome){
this.fOnWelcome(_841);
}
}else{
if(_841.type=="goodBye"){
if(this.fOnGoodBye){
this.fOnGoodBye(_841);
}
this.fSessionId=null;
this.fUsername=null;
}else{
if(_841.type=="close"){
this.close({timeout:0});
}else{
if(_841.type=="response"){
this.checkCallbacks(_841);
}else{
if(aToken.type=="event"){
if(aToken.name=="connect"){
this.processConnected(aToken);
}
if(aToken.name=="disconnect"){
this.processDisconnected(aToken);
}
}
}
}
}
}
}else{
this.checkCallbacks(aToken);
}
},this.sendToken=function(_842){
if(this.isConnected()){
var _843=ColdFusion.JSON.encode(_842);
this.wsConnection.send(_843);
}else{
throw new Error("Connection not established.");
}
},this.startKeepAlive=function(_844){
},this.stopKeepAlive=function(){
};
}};
if(!cf_ws.isWebSocketSupported()){
var swfobject=function(){
var D="undefined",r="object",S="Shockwave Flash",W="ShockwaveFlash.ShockwaveFlash",q="application/x-shockwave-flash",R="SWFObjectExprInst",x="onreadystatechange",O=window,j=document,t=navigator,T=false,U=[h],o=[],N=[],I=[],l,Q,E,B,J=false,a=false,n,G,m=true,M=function(){
var aa=typeof j.getElementById!=D&&typeof j.getElementsByTagName!=D&&typeof j.createElement!=D,ah=t.userAgent.toLowerCase(),Y=t.platform.toLowerCase(),ae=Y?/win/.test(Y):/win/.test(ah),ac=Y?/mac/.test(Y):/mac/.test(ah),af=/webkit/.test(ah)?parseFloat(ah.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,X=!+"\v1",ag=[0,0,0],ab=null;
if(typeof t.plugins!=D&&typeof t.plugins[S]==r){
ab=t.plugins[S].description;
if(ab&&!(typeof t.mimeTypes!=D&&t.mimeTypes[q]&&!t.mimeTypes[q].enabledPlugin)){
T=true;
X=false;
ab=ab.replace(/^.*\s+(\S+\s+\S+$)/,"$1");
ag[0]=parseInt(ab.replace(/^(.*)\..*$/,"$1"),10);
ag[1]=parseInt(ab.replace(/^.*\.(.*)\s.*$/,"$1"),10);
ag[2]=/[a-zA-Z]/.test(ab)?parseInt(ab.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0;
}
}else{
if(typeof O.ActiveXObject!=D){
try{
var ad=new ActiveXObject(W);
if(ad){
ab=ad.GetVariable("$version");
if(ab){
X=true;
ab=ab.split(" ")[1].split(",");
ag=[parseInt(ab[0],10),parseInt(ab[1],10),parseInt(ab[2],10)];
}
}
}
catch(Z){
}
}
}
return {w3:aa,pv:ag,wk:af,ie:X,win:ae,mac:ac};
}(),k=function(){
if(!M.w3){
return;
}
if((typeof j.readyState!=D&&j.readyState=="complete")||(typeof j.readyState==D&&(j.getElementsByTagName("body")[0]||j.body))){
f();
}
if(!J){
if(typeof j.addEventListener!=D){
j.addEventListener("DOMContentLoaded",f,false);
}
if(M.ie&&M.win){
j.attachEvent(x,function(){
if(j.readyState=="complete"){
j.detachEvent(x,arguments.callee);
f();
}
});
if(O==top){
(function(){
if(J){
return;
}
try{
j.documentElement.doScroll("left");
}
catch(X){
setTimeout(arguments.callee,0);
return;
}
f();
})();
}
}
if(M.wk){
(function(){
if(J){
return;
}
if(!/loaded|complete/.test(j.readyState)){
setTimeout(arguments.callee,0);
return;
}
f();
})();
}
s(f);
}
}();
function f(){
if(J){
return;
}
try{
var Z=j.getElementsByTagName("body")[0].appendChild(C("span"));
Z.parentNode.removeChild(Z);
}
catch(aa){
return;
}
J=true;
var X=U.length;
for(var Y=0;Y<X;Y++){
U[Y]();
}
}
function K(X){
if(J){
X();
}else{
U[U.length]=X;
}
}
function s(Y){
if(typeof O.addEventListener!=D){
O.addEventListener("load",Y,false);
}else{
if(typeof j.addEventListener!=D){
j.addEventListener("load",Y,false);
}else{
if(typeof O.attachEvent!=D){
i(O,"onload",Y);
}else{
if(typeof O.onload=="function"){
var X=O.onload;
O.onload=function(){
X();
Y();
};
}else{
O.onload=Y;
}
}
}
}
}
function h(){
if(T){
V();
}else{
H();
}
}
function V(){
var X=j.getElementsByTagName("body")[0];
var aa=C(r);
aa.setAttribute("type",q);
var Z=X.appendChild(aa);
if(Z){
var Y=0;
(function(){
if(typeof Z.GetVariable!=D){
var ab=Z.GetVariable("$version");
if(ab){
ab=ab.split(" ")[1].split(",");
M.pv=[parseInt(ab[0],10),parseInt(ab[1],10),parseInt(ab[2],10)];
}
}else{
if(Y<10){
Y++;
setTimeout(arguments.callee,10);
return;
}
}
X.removeChild(aa);
Z=null;
H();
})();
}else{
H();
}
}
function H(){
var ag=o.length;
if(ag>0){
for(var af=0;af<ag;af++){
var Y=o[af].id;
var ab=o[af].callbackFn;
var aa={success:false,id:Y};
if(M.pv[0]>0){
var ae=c(Y);
if(ae){
if(F(o[af].swfVersion)&&!(M.wk&&M.wk<312)){
w(Y,true);
if(ab){
aa.success=true;
aa.ref=z(Y);
ab(aa);
}
}else{
if(o[af].expressInstall&&A()){
var ai={};
ai.data=o[af].expressInstall;
ai.width=ae.getAttribute("width")||"0";
ai.height=ae.getAttribute("height")||"0";
if(ae.getAttribute("class")){
ai.styleclass=ae.getAttribute("class");
}
if(ae.getAttribute("align")){
ai.align=ae.getAttribute("align");
}
var ah={};
var X=ae.getElementsByTagName("param");
var ac=X.length;
for(var ad=0;ad<ac;ad++){
if(X[ad].getAttribute("name").toLowerCase()!="movie"){
ah[X[ad].getAttribute("name")]=X[ad].getAttribute("value");
}
}
P(ai,ah,Y,ab);
}else{
p(ae);
if(ab){
ab(aa);
}
}
}
}
}else{
w(Y,true);
if(ab){
var Z=z(Y);
if(Z&&typeof Z.SetVariable!=D){
aa.success=true;
aa.ref=Z;
}
ab(aa);
}
}
}
}
}
function z(aa){
var X=null;
var Y=c(aa);
if(Y&&Y.nodeName=="OBJECT"){
if(typeof Y.SetVariable!=D){
X=Y;
}else{
var Z=Y.getElementsByTagName(r)[0];
if(Z){
X=Z;
}
}
}
return X;
}
function A(){
return !a&&F("6.0.65")&&(M.win||M.mac)&&!(M.wk&&M.wk<312);
}
function P(aa,ab,X,Z){
a=true;
E=Z||null;
B={success:false,id:X};
var ae=c(X);
if(ae){
if(ae.nodeName=="OBJECT"){
l=g(ae);
Q=null;
}else{
l=ae;
Q=X;
}
aa.id=R;
if(typeof aa.width==D||(!/%$/.test(aa.width)&&parseInt(aa.width,10)<310)){
aa.width="310";
}
if(typeof aa.height==D||(!/%$/.test(aa.height)&&parseInt(aa.height,10)<137)){
aa.height="137";
}
j.title=j.title.slice(0,47)+" - Flash Player Installation";
var ad=M.ie&&M.win?"ActiveX":"PlugIn",ac="MMredirectURL="+O.location.toString().replace(/&/g,"%26")+"&MMplayerType="+ad+"&MMdoctitle="+j.title;
if(typeof ab.flashvars!=D){
ab.flashvars+="&"+ac;
}else{
ab.flashvars=ac;
}
if(M.ie&&M.win&&ae.readyState!=4){
var Y=C("div");
X+="SWFObjectNew";
Y.setAttribute("id",X);
ae.parentNode.insertBefore(Y,ae);
ae.style.display="none";
(function(){
if(ae.readyState==4){
ae.parentNode.removeChild(ae);
}else{
setTimeout(arguments.callee,10);
}
})();
}
u(aa,ab,X);
}
}
function p(Y){
if(M.ie&&M.win&&Y.readyState!=4){
var X=C("div");
Y.parentNode.insertBefore(X,Y);
X.parentNode.replaceChild(g(Y),X);
Y.style.display="none";
(function(){
if(Y.readyState==4){
Y.parentNode.removeChild(Y);
}else{
setTimeout(arguments.callee,10);
}
})();
}else{
Y.parentNode.replaceChild(g(Y),Y);
}
}
function g(ab){
var aa=C("div");
if(M.win&&M.ie){
aa.innerHTML=ab.innerHTML;
}else{
var Y=ab.getElementsByTagName(r)[0];
if(Y){
var ad=Y.childNodes;
if(ad){
var X=ad.length;
for(var Z=0;Z<X;Z++){
if(!(ad[Z].nodeType==1&&ad[Z].nodeName=="PARAM")&&!(ad[Z].nodeType==8)){
aa.appendChild(ad[Z].cloneNode(true));
}
}
}
}
}
return aa;
}
function u(ai,ag,Y){
var X,aa=c(Y);
if(M.wk&&M.wk<312){
return X;
}
if(aa){
if(typeof ai.id==D){
ai.id=Y;
}
if(M.ie&&M.win){
var ah="";
for(var ae in ai){
if(ai[ae]!=Object.prototype[ae]){
if(ae.toLowerCase()=="data"){
ag.movie=ai[ae];
}else{
if(ae.toLowerCase()=="styleclass"){
ah+=" class=\""+ai[ae]+"\"";
}else{
if(ae.toLowerCase()!="classid"){
ah+=" "+ae+"=\""+ai[ae]+"\"";
}
}
}
}
}
var af="";
for(var ad in ag){
if(ag[ad]!=Object.prototype[ad]){
af+="<param name=\""+ad+"\" value=\""+ag[ad]+"\" />";
}
}
aa.outerHTML="<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\""+ah+">"+af+"</object>";
N[N.length]=ai.id;
X=c(ai.id);
}else{
var Z=C(r);
Z.setAttribute("type",q);
for(var ac in ai){
if(ai[ac]!=Object.prototype[ac]){
if(ac.toLowerCase()=="styleclass"){
Z.setAttribute("class",ai[ac]);
}else{
if(ac.toLowerCase()!="classid"){
Z.setAttribute(ac,ai[ac]);
}
}
}
}
for(var ab in ag){
if(ag[ab]!=Object.prototype[ab]&&ab.toLowerCase()!="movie"){
e(Z,ab,ag[ab]);
}
}
aa.parentNode.replaceChild(Z,aa);
X=Z;
}
}
return X;
}
function e(Z,X,Y){
var aa=C("param");
aa.setAttribute("name",X);
aa.setAttribute("value",Y);
Z.appendChild(aa);
}
function y(Y){
var X=c(Y);
if(X&&X.nodeName=="OBJECT"){
if(M.ie&&M.win){
X.style.display="none";
(function(){
if(X.readyState==4){
b(Y);
}else{
setTimeout(arguments.callee,10);
}
})();
}else{
X.parentNode.removeChild(X);
}
}
}
function b(Z){
var Y=c(Z);
if(Y){
for(var X in Y){
if(typeof Y[X]=="function"){
Y[X]=null;
}
}
Y.parentNode.removeChild(Y);
}
}
function c(Z){
var X=null;
try{
X=j.getElementById(Z);
}
catch(Y){
}
return X;
}
function C(X){
return j.createElement(X);
}
function i(Z,X,Y){
Z.attachEvent(X,Y);
I[I.length]=[Z,X,Y];
}
function F(Z){
var Y=M.pv,X=Z.split(".");
X[0]=parseInt(X[0],10);
X[1]=parseInt(X[1],10)||0;
X[2]=parseInt(X[2],10)||0;
return (Y[0]>X[0]||(Y[0]==X[0]&&Y[1]>X[1])||(Y[0]==X[0]&&Y[1]==X[1]&&Y[2]>=X[2]))?true:false;
}
function v(ac,Y,ad,ab){
if(M.ie&&M.mac){
return;
}
var aa=j.getElementsByTagName("head")[0];
if(!aa){
return;
}
var X=(ad&&typeof ad=="string")?ad:"screen";
if(ab){
n=null;
G=null;
}
if(!n||G!=X){
var Z=C("style");
Z.setAttribute("type","text/css");
Z.setAttribute("media",X);
n=aa.appendChild(Z);
if(M.ie&&M.win&&typeof j.styleSheets!=D&&j.styleSheets.length>0){
n=j.styleSheets[j.styleSheets.length-1];
}
G=X;
}
if(M.ie&&M.win){
if(n&&typeof n.addRule==r){
n.addRule(ac,Y);
}
}else{
if(n&&typeof j.createTextNode!=D){
n.appendChild(j.createTextNode(ac+" {"+Y+"}"));
}
}
}
function w(Z,X){
if(!m){
return;
}
var Y=X?"visible":"hidden";
if(J&&c(Z)){
c(Z).style.visibility=Y;
}else{
v("#"+Z,"visibility:"+Y);
}
}
function L(Y){
var Z=/[\\\"<>\.;]/;
var X=Z.exec(Y)!=null;
return X&&typeof encodeURIComponent!=D?encodeURIComponent(Y):Y;
}
var d=function(){
if(M.ie&&M.win){
window.attachEvent("onunload",function(){
var ac=I.length;
for(var ab=0;ab<ac;ab++){
I[ab][0].detachEvent(I[ab][1],I[ab][2]);
}
var Z=N.length;
for(var aa=0;aa<Z;aa++){
y(N[aa]);
}
for(var Y in M){
M[Y]=null;
}
M=null;
for(var X in swfobject){
swfobject[X]=null;
}
swfobject=null;
});
}
}();
return {registerObject:function(ab,X,aa,Z){
if(M.w3&&ab&&X){
var Y={};
Y.id=ab;
Y.swfVersion=X;
Y.expressInstall=aa;
Y.callbackFn=Z;
o[o.length]=Y;
w(ab,false);
}else{
if(Z){
Z({success:false,id:ab});
}
}
},getObjectById:function(X){
if(M.w3){
return z(X);
}
},embedSWF:function(ab,ah,ae,ag,Y,aa,Z,ad,af,ac){
var X={success:false,id:ah};
if(M.w3&&!(M.wk&&M.wk<312)&&ab&&ah&&ae&&ag&&Y){
w(ah,false);
K(function(){
ae+="";
ag+="";
var aj={};
if(af&&typeof af===r){
for(var al in af){
aj[al]=af[al];
}
}
aj.data=ab;
aj.width=ae;
aj.height=ag;
var am={};
if(ad&&typeof ad===r){
for(var ak in ad){
am[ak]=ad[ak];
}
}
if(Z&&typeof Z===r){
for(var ai in Z){
if(typeof am.flashvars!=D){
am.flashvars+="&"+ai+"="+Z[ai];
}else{
am.flashvars=ai+"="+Z[ai];
}
}
}
if(F(Y)){
var an=u(aj,am,ah);
if(aj.id==ah){
w(ah,true);
}
X.success=true;
X.ref=an;
}else{
if(aa&&A()){
aj.data=aa;
P(aj,am,ah,ac);
return;
}else{
w(ah,true);
}
}
if(ac){
ac(X);
}
});
}else{
if(ac){
ac(X);
}
}
},switchOffAutoHideShow:function(){
m=false;
},ua:M,getFlashPlayerVersion:function(){
return {major:M.pv[0],minor:M.pv[1],release:M.pv[2]};
},hasFlashPlayerVersion:F,createSWF:function(Z,Y,X){
if(M.w3){
return u(Z,Y,X);
}else{
return undefined;
}
},showExpressInstall:function(Z,aa,X,Y){
if(M.w3&&A()){
P(Z,aa,X,Y);
}
},removeSWF:function(X){
if(M.w3){
y(X);
}
},createCSS:function(aa,Z,Y,X){
if(M.w3){
v(aa,Z,Y,X);
}
},addDomLoadEvent:K,addLoadEvent:s,getQueryParamValue:function(aa){
var Z=j.location.search||j.location.hash;
if(Z){
if(/\?/.test(Z)){
Z=Z.split("?")[1];
}
if(aa==null){
return L(Z);
}
var Y=Z.split("&");
for(var X=0;X<Y.length;X++){
if(Y[X].substring(0,Y[X].indexOf("="))==aa){
return L(Y[X].substring((Y[X].indexOf("=")+1)));
}
}
}
return "";
},expressInstallCallback:function(){
if(a){
var X=c(R);
if(X&&l){
X.parentNode.replaceChild(l,X);
if(Q){
w(Q,true);
if(M.ie&&M.win){
l.style.display="block";
}
}
if(E){
E(B);
}
}
a=false;
}
}};
}();
if(swfobject.hasFlashPlayerVersion("10.0.0")){
eval((function(x){
var d="";
var p=0;
while(p<x.length){
if(x.charAt(p)!="`"){
d+=x.charAt(p++);
}else{
var l=x.charCodeAt(p+3)-28;
if(l>4){
d+=d.substr(d.length-x.charCodeAt(p+1)*96-x.charCodeAt(p+2)+3104-l,l);
}else{
d+="`";
}
p+=4;
}
}
return d;
})("function FABridge(target,b` )!Name){this.` 2\"=` 9\";` .!remoteTypeCache={}` ,(Instanc` '1F`!0#` .*local` %2`!I\"ID=`!`$.next` %\"ID++` @\"name=`!p&` .#extL` r$ID=0;` [%i`!\\#s[` V%]=this` 8'dMap` 9\"`!<$` <#return ` '!}` G%TYPE_ASINSTANCE=1` a&` 4#FUNCTION=2` ,+J` 1&3` F,NONYMOUS=4`!r(itCallbacks={}` 0&userType` (*addToU` 2%`%3$(){for(var i=0;i<arguments.length;i++){` k.[` @%[i]]={typ`#r!:` ,(,enriched:false};}`!F(rgsToArray`!E&args){var result=[];`!P-`!N*` C\"[i]=args[i];}`$7#` 4\";};`'`%`%,$Factory(objID`']#fb_` 7$_id=` 6!`$z*`(?-__invokeJS`'1$`!v'f`&L\"`!P!0];var throughArgs` 3!.concat();` /'.shift()` M!`&Q\"`'o&extrac`'u#FromID(`!#\")`!d$` M\".`!T\"`'s%`!X!` D\",`!\"')`'3'addInitializa`)@\"`&:\"`$5&`(u&,c` 6#`\"G\"inst`!\\&`(q&` G&];if(inst!=undefined){` ^$.call` :!`\" $;}var ` 8$Li` r*`'r'` t,` F)=null`'5'` A5=` J)[];}` %(.push` q%)`&'(`%B&`*|#`#;$ed`#$'`# \"objects=doc`(?!.getEle`(J!ByTagName(\"` A\"\"`%<\"ol=` P#`'n$var activeO` i#[`\"T!ol>0`)\x7f,ol`(?\"if(typeof`!<$[i].SetVariable!=\"`$-%\"){` r)[`! )`!?#]`!N$`),!}`$H!embed`!}=` A!`\"6#el=` O\"`\"*.E` g\"`\"5\"e`\".)j=0;j<el;j`\"-*` e\"[j`!x>` w\"`\"2#` '\"`\"/%` ]%`\"/$aol=`\"O0`!g\"e` 5$` Z)` 7!searchStr=\"`%@&=\"+`1Z'if(aol==1&&!ael||` &$ael==1`'/'attach`4A#`$2*0]`4F(;}else if(` ^\"&&!ao`'x(` W/`\"i#` U0`,f\"lash_found=`/F!`!r#>1`$,&k=0;k<aol;k++`'j\"params`#/*[k].childNodes`/T%l=0;l<` K\"`#<$l` [)=` 7\"[l`%M!` (!.nodeType`\"B!` -\"t`&B\".toLowerCase()==\"` 9!\"` >$n` /0`\"A!vars` >%value.indexOf(`$g%)>=0`#uBk`#D*`#<(true;break;}}if(` 1'){` 0$}if(!` /'`%T!`#j(m=0;m<ael;m`#&$` J!Var`#q$`$v#m].attributes.getNamedItem(`\"T\"Vars\")`#O!Valu`$\x7f!` 0%`\"1P`!0%`\"W)`\"2%`4?$`\"d!`1=&nex`29#ID=0;`0c.={}` +'dMap` %)refCount` P(`3$/`2+&id`#2\"`/9#D=id>>16`3H$` }*`0M#ID];`!)'`\"Q(` n'`!k#`\"S(`!%!new`\";#` ;#=new`! %` C1`!#%`1h)` X-`+s!`1`$s`2cKs`3'$`3z$`0^*` >%`)X$`0u!` -%[i]`4`\"`!D-);}delete`#A'`!75`#K'blockedMethods={toString:true,get` #\"se` \"#call` %!` Y'prototype={root:`$4%`\">$ this.deser`4Q\"(` ,!targe`1~!Root());},releaseAS`*7#` U4` U#` ?,(` Y'`)7!` 2$` ^&`+k!`2'(` ,!!=\"`3g\"\"` \x7f%`._\"`.w&ret=`!)/` z)` x\".fb_`&9$_id)`'_$ret;}},create`!H&class`'4\"`\"l@` Y\"` K');},makeID` j&token` h$` Y\"`(n$<<16)+` <!;},getPropertyFromAS` Z&objRef,prop`!X\"if(`*R->0){throw new Error(\"You are trying to`(K! recursively into the Flash Player which is not allowed. In most cases` P!JavaScript setTimeout `!r$, can be used as a workaround.\"`3n$`!{-++;retVal`${)`\"{#`\"x\"`\"d-` E)handle`\"_\"` 2\"`+K&` }%--`%E'Val;}},s`#|&In`#i7,`'4&`#(~`#(~`#[K`\"\x7f#In`#v.,` C!`(G&`#\"\"`#WccallASF`\"-#`$3&funcID,args`#1~`#1~`#_Pinvoke`\"s&`\"l$`$ +`\"~!`#Ai`1l\"`(<)ID,func`%J!`#2~`#2~`#oAargs`#K\"`#_+`$28`#7\"`\"\x7f1`#^b`!#\"Local`(8;`3T\"sult;var`\"m!`!6\"l` Q(Cache[` S\"];if` _!!=undefined){` ^\"`\"Z,func.apply(null`&q\"`3M(`&s\");}`!z%`!F!`2s!TypeFromNam`4C'objType`4>.remoteType`!h\"` >'];},`4Q\"Proxy`'&,t` g%var ` Q#`\"%\"`!8+(` B%;instanceFactory.prototype=` Z#`#K!` >$=new` $%` L#`!8\");`!s'I` ;#`!y%ID]=` O$`$\x7f$` '%`#!!`!~0`\"e0` g0;},addTypeDataTo` 7!` b&t` 2#`\"r\"new`\"s!new AS`!2!(this`#:!Data.n`\"t!var accessors=` 4%` *%;for(`\"w!=0;i<` /%.length;i++){`!t!add`4.$ToType(`!=#,` L%[i]);}var m`(o!`!&'` *#`! +` /#`! )`,;(blocked`)\\\"s[` H#[i]]=`'c(`!X$` B\"`!O+` K&);}}`&h1` D#.`&($]=` +#`$}$` '$`$=!`\"X*`$5(`3x%`$>\"c=` ($.charAt(0`$+\"setterNam`&q\"g` %&if(c>=\"a\"&&c<=\"z\"){` 4&=\"get\"+c.toUpperCase()+` |%substr(1);` w&=\"s` -C`.0\"` }-` B$` b.` 1%}ty[` 4&]=`\"i%val`$6#b`$j\"s`(=!`#9!InAS`'-!.fb_`(]$_id`#;%,val);};ty[`!K&` r'`(i*` z#`,b(` ,(`)U\"`!4!From` |;));}`%&\"`&&(`$})`&0\"`%&\"ty`&s#`!&X`4](`!H1` y&,`(7%argsToArray(argument`/<\"`,)\"`0J$`,(+`0U\"`&\x7f\"`!9\"`.;!;if`!4\"`(:\"`0z1==nul`$n$` ,8`\"['`\"5)` F$`2Q$`!l<;}`1F%` t<`\"F*ID`\"C*`+U!`2^!__`!L\"_id__`+<)` ,/`!0!makeID`\"w\"next`4c%ID++`0M#`4,3` a*`\"r\"`\")%` /.;},`%W%`!v&valu`+N#`4.\"={}`+6!t`.=!of ` =!`$\\!==\"number\"||t==\"string` &#boolean` (\"null` $!`\"W'` x#` i\"`*n! if`!:\"`2B%of `$B!` E%[]`/I+` K!`/I)` D\"[i]`#K\"`'z&` F!`.v#`!'$t==\"`\"T$\"` T$`.y!=`%f%TYPE_JSFUNCTION;` >#` j!` ~\"`%?)`#<#`!w8`3@\"` s8ASINSTANCE`!!*`\"I\"`)b*`.)#` R7NONYMOUS` Y/`%X%` 5\";},`+,'`%M&packedV`%M,`%L*` :'`%4H` L'`%b$` &)`%b.`#p!handleError`!R)`#o&` +'`%gG` K'`%|8`.2(` H'`&-/object\"){` n6newTypes`!$)`!\"!addTypeDataTo`*G!`!\"(` P%`!1\"` y$aRefID in`$'(.newRefs` r#create`&d!(` J\",` :/[` 5\"]);}`#C*`&B\"`&:+PRIMITIVE`#U%` F(`*;+` M<A`))%`%**`0},` \\)`),,` c>`) $` t-` :_`)0$`\"S8`)/-addRef`)1&obj`$L#target.incRef(obj`*Z+);},releas`)o'` N-` ;#` I6`(n'`0'-if(`/{(`*+&&&`,5\"indexOf(\"__FLASHERROR\")==0`+2\"my` t!Messag`,h$split(\"||\");if(`#=%refCount>0){` $---;}throw new `*b\"` p*[1]);`#X#`&R'{` %*}};`.j#`3-!`\"I!`3!\",typeName`#:#` 0\"=` 7\"`4%\"` :$`->!Name`!($this;` q%.proto`%_!{get`.-'rop` |\"` M'`!\"#`+V)` ,(`&w\"pertyFromAS` 8\"`$\\*,` r%);},s`!!0,`$n#` p(s` r&In` [;` Y#;},call` v&func` ;!arg`+g$` x#callASMethod` g1` N*`'|/` b*` 8\"` e!`'i1` @*` 8#` G$};"));
(function(){
if(window.WEB_SOCKET_FORCE_FLASH){
}else{
if(window.WebSocket){
return;
}else{
if(window.MozWebSocket){
window.WebSocket=MozWebSocket;
return;
}
}
}
var _8ce;
if(window.WEB_SOCKET_LOGGER){
_8ce=WEB_SOCKET_LOGGER;
}else{
if(window.console&&window.console.log&&window.console.error){
_8ce=window.console;
}else{
_8ce={log:function(){
},error:function(){
}};
}
}
if(swfobject.getFlashPlayerVersion().major<10){
_8ce.error("Flash Player >= 10.0.0 is required.");
return;
}
if(location.protocol=="file:"){
_8ce.error("WARNING: web-socket-js doesn't work in file:///... URL "+"unless you set Flash Security Settings properly. "+"Open the page via Web server i.e. http://...");
}
window.WebSocket=function(url,_8d0,_8d1,_8d2,_8d3){
var self=this;
self.__id=WebSocket.__nextId++;
WebSocket.__instances[self.__id]=self;
self.readyState=WebSocket.CONNECTING;
self.bufferedAmount=0;
self.__events={};
if(!_8d0){
_8d0=[];
}else{
if(typeof _8d0=="string"){
_8d0=[_8d0];
}
}
self.__createTask=setTimeout(function(){
WebSocket.__addTask(function(){
self.__createTask=null;
WebSocket.__flash.create(self.__id,url,_8d0,_8d1||null,_8d2||0,_8d3||null,_cf_flash_policy_port||1243);
});
},0);
};
WebSocket.prototype.send=function(data){
if(this.readyState==WebSocket.CONNECTING){
throw "INVALID_STATE_ERR: Web Socket connection has not been established";
}
var _8d6=WebSocket.__flash.send(this.__id,encodeURIComponent(data));
if(_8d6<0){
return true;
}else{
this.bufferedAmount+=_8d6;
return false;
}
};
WebSocket.prototype.close=function(){
if(this.__createTask){
clearTimeout(this.__createTask);
this.__createTask=null;
this.readyState=WebSocket.CLOSED;
return;
}
if(this.readyState==WebSocket.CLOSED||this.readyState==WebSocket.CLOSING){
return;
}
this.readyState=WebSocket.CLOSING;
WebSocket.__flash.close(this.__id);
};
WebSocket.prototype.addEventListener=function(type,_8d8,_8d9){
if(!(type in this.__events)){
this.__events[type]=[];
}
this.__events[type].push(_8d8);
};
WebSocket.prototype.removeEventListener=function(type,_8db,_8dc){
if(!(type in this.__events)){
return;
}
var _8dd=this.__events[type];
for(var i=_8dd.length-1;i>=0;--i){
if(_8dd[i]===_8db){
_8dd.splice(i,1);
break;
}
}
};
WebSocket.prototype.dispatchEvent=function(_8df){
var _8e0=this.__events[_8df.type]||[];
for(var i=0;i<_8e0.length;++i){
_8e0[i](_8df);
}
var _8e2=this["on"+_8df.type];
if(_8e2){
_8e2.apply(this,[_8df]);
}
};
WebSocket.prototype.__handleEvent=function(_8e3){
if("readyState" in _8e3){
this.readyState=_8e3.readyState;
}
if("protocol" in _8e3){
this.protocol=_8e3.protocol;
}
var _8e4;
if(_8e3.type=="open"||_8e3.type=="error"){
_8e4=this.__createSimpleEvent(_8e3.type);
}else{
if(_8e3.type=="close"){
_8e4=this.__createSimpleEvent("close");
_8e4.wasClean=_8e3.wasClean?true:false;
_8e4.code=_8e3.code;
_8e4.reason=_8e3.reason;
}else{
if(_8e3.type=="message"){
var data=decodeURIComponent(_8e3.message);
_8e4=this.__createMessageEvent("message",data);
}else{
throw "unknown event type: "+_8e3.type;
}
}
}
this.dispatchEvent(_8e4);
};
WebSocket.prototype.__createSimpleEvent=function(type){
if(document.createEvent&&window.Event){
var _8e7=document.createEvent("Event");
_8e7.initEvent(type,false,false);
return _8e7;
}else{
return {type:type,bubbles:false,cancelable:false};
}
};
WebSocket.prototype.__createMessageEvent=function(type,data){
if(document.createEvent&&window.MessageEvent&&!window.opera){
var _8ea=document.createEvent("MessageEvent");
_8ea.initMessageEvent("message",false,false,data,null,null,window,null);
return _8ea;
}else{
return {type:type,data:data,bubbles:false,cancelable:false};
}
};
WebSocket.CONNECTING=0;
WebSocket.OPEN=1;
WebSocket.CLOSING=2;
WebSocket.CLOSED=3;
WebSocket.__initialized=false;
WebSocket.__flash=null;
WebSocket.__instances={};
WebSocket.__tasks=[];
WebSocket.__nextId=0;
WebSocket.loadFlashPolicyFile=function(url){
WebSocket.__addTask(function(){
WebSocket.__flash.loadManualPolicyFile(url);
});
};
WebSocket.__initialize=function(){
if(WebSocket.__initialized){
return;
}
WebSocket.__initialized=true;
if(WebSocket.__swfLocation){
window.WEB_SOCKET_SWF_LOCATION=WebSocket.__swfLocation;
}
if(!window.WEB_SOCKET_SWF_LOCATION){
_8ce.error("[WebSocket] set WEB_SOCKET_SWF_LOCATION to location of WebSocketMain.swf");
return;
}
if(!window.WEB_SOCKET_SUPPRESS_CROSS_DOMAIN_SWF_ERROR&&!WEB_SOCKET_SWF_LOCATION.match(/(^|\/)WebSocketMainInsecure\.swf(\?.*)?$/)&&WEB_SOCKET_SWF_LOCATION.match(/^\w+:\/\/([^\/]+)/)){
var _8ec=RegExp.$1;
if(location.host!=_8ec){
_8ce.error("[WebSocket] You must host HTML and WebSocketMain.swf in the same host "+"('"+location.host+"' != '"+_8ec+"'). "+"See also 'How to host HTML file and SWF file in different domains' section "+"in README.md. If you use WebSocketMainInsecure.swf, you can suppress this message "+"by WEB_SOCKET_SUPPRESS_CROSS_DOMAIN_SWF_ERROR = true;");
}
}
var _8ed=document.createElement("div");
_8ed.id="webSocketContainer";
_8ed.style.position="absolute";
if(WebSocket.__isFlashLite()){
_8ed.style.left="0px";
_8ed.style.top="0px";
}else{
_8ed.style.left="-100px";
_8ed.style.top="-100px";
}
var _8ee=document.createElement("div");
_8ee.id="webSocketFlash";
_8ed.appendChild(_8ee);
document.body.appendChild(_8ed);
swfobject.embedSWF(WEB_SOCKET_SWF_LOCATION,"webSocketFlash","1","1","10.0.0",null,null,{hasPriority:true,swliveconnect:true,allowScriptAccess:"always"},null,function(e){
if(!e.success){
_8ce.error("[WebSocket] swfobject.embedSWF failed");
}
});
};
WebSocket.__onFlashInitialized=function(){
setTimeout(function(){
WebSocket.__flash=document.getElementById("webSocketFlash");
WebSocket.__flash.setCallerUrl(location.href);
WebSocket.__flash.setDebug(!!window.WEB_SOCKET_DEBUG);
for(var i=0;i<WebSocket.__tasks.length;++i){
WebSocket.__tasks[i]();
}
WebSocket.__tasks=[];
},0);
};
WebSocket.__onFlashEvent=function(){
setTimeout(function(){
try{
var _8f1=WebSocket.__flash.receiveEvents();
for(var i=0;i<_8f1.length;++i){
WebSocket.__instances[_8f1[i].webSocketId].__handleEvent(_8f1[i]);
}
}
catch(e){
_8ce.error(e);
}
},0);
return true;
};
WebSocket.__log=function(_8f3){
_8ce.log(decodeURIComponent(_8f3));
};
WebSocket.__error=function(_8f4){
_8ce.error(decodeURIComponent(_8f4));
};
WebSocket.__addTask=function(task){
if(WebSocket.__flash){
task();
}else{
WebSocket.__tasks.push(task);
}
};
WebSocket.__isFlashLite=function(){
if(!window.navigator||!window.navigator.mimeTypes){
return false;
}
var _8f6=window.navigator.mimeTypes["application/x-shockwave-flash"];
if(!_8f6||!_8f6.enabledPlugin||!_8f6.enabledPlugin.filename){
return false;
}
return _8f6.enabledPlugin.filename.match(/flashlite/i)?true:false;
};
if(!window.WEB_SOCKET_DISABLE_AUTO_INITIALIZATION){
swfobject.addDomLoadEvent(function(){
WebSocket.__initialize();
});
}
})();
WebSocket.__swfLocation=_cf_ajaxscriptsrc+"/ajax/resources/websocket/WebSocketMain.swf";
WEB_SOCKET_SWF_LOCATION=_cf_ajaxscriptsrc+"/ajax/resources/websocket/WebSocketMain.swf";
}else{
WebSocket=null;
}
}
if(!this.JSON){
this.JSON={};
}
(function(){
function f(n){
return n<10?"0"+n:n;
}
if(typeof Date.prototype.toJSON!=="function"){
Date.prototype.toJSON=function(key){
return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z":null;
};
String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(key){
return this.valueOf();
};
}
var cx=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,escapable=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,gap,indent,meta={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r","\"":"\\\"","\\":"\\\\"},rep;
function quote(_8fb){
escapable.lastIndex=0;
return escapable.test(_8fb)?"\""+_8fb.replace(escapable,function(a){
var c=meta[a];
return typeof c==="string"?c:"\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
})+"\"":"\""+_8fb+"\"";
}
function str(key,_8ff){
var i,k,v,length,mind=gap,partial,value=_8ff[key];
if(value&&typeof value==="object"&&typeof value.toJSON==="function"){
value=value.toJSON(key);
}
if(typeof rep==="function"){
value=rep.call(_8ff,key,value);
}
switch(typeof value){
case "string":
return quote(value);
case "number":
return isFinite(value)?String(value):"null";
case "boolean":
case "null":
return String(value);
case "object":
if(!value){
return "null";
}
gap+=indent;
partial=[];
if(Object.prototype.toString.apply(value)==="[object Array]"){
length=value.length;
for(i=0;i<length;i+=1){
partial[i]=str(i,value)||"null";
}
v=partial.length===0?"[]":gap?"[\n"+gap+partial.join(",\n"+gap)+"\n"+mind+"]":"["+partial.join(",")+"]";
gap=mind;
return v;
}
if(rep&&typeof rep==="object"){
length=rep.length;
for(i=0;i<length;i+=1){
k=rep[i];
if(typeof k==="string"){
v=str(k,value);
if(v){
partial.push(quote(k)+(gap?": ":":")+v);
}
}
}
}else{
for(k in value){
if(Object.hasOwnProperty.call(value,k)){
v=str(k,value);
if(v){
partial.push(quote(k)+(gap?": ":":")+v);
}
}
}
}
v=partial.length===0?"{}":gap?"{\n"+gap+partial.join(",\n"+gap)+"\n"+mind+"}":"{"+partial.join(",")+"}";
gap=mind;
return v;
}
}
if(typeof JSON.stringify!=="function"){
JSON.stringify=function(_901,_902,_903){
var i;
gap="";
indent="";
if(typeof _903==="number"){
for(i=0;i<_903;i+=1){
indent+=" ";
}
}else{
if(typeof _903==="string"){
indent=_903;
}
}
rep=_902;
if(_902&&typeof _902!=="function"&&(typeof _902!=="object"||typeof _902.length!=="number")){
throw new Error("JSON.stringify");
}
return str("",{"":_901});
};
}
if(typeof JSON.parse!=="function"){
JSON.parse=function(text,_906){
var j;
function walk(_908,key){
var k,v,value=_908[key];
if(value&&typeof value==="object"){
for(k in value){
if(Object.hasOwnProperty.call(value,k)){
v=walk(value,k);
if(v!==undefined){
value[k]=v;
}else{
delete value[k];
}
}
}
}
return _906.call(_908,key,value);
}
text=String(text);
cx.lastIndex=0;
if(cx.test(text)){
text=text.replace(cx,function(a){
return "\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4);
});
}
if(/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){
j=eval("("+text+")");
return typeof _906==="function"?walk({"":j},""):j;
}
throw new SyntaxError("JSON.parse");
};
}
}());
var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(_90c){
var _90d="";
var chr1,chr2,chr3,enc1,enc2,enc3,enc4;
var i=0;
_90c=Base64._utf8_encode(_90c);
while(i<_90c.length){
chr1=_90c.charCodeAt(i++);
chr2=_90c.charCodeAt(i++);
chr3=_90c.charCodeAt(i++);
enc1=chr1>>2;
enc2=((chr1&3)<<4)|(chr2>>4);
enc3=((chr2&15)<<2)|(chr3>>6);
enc4=chr3&63;
if(isNaN(chr2)){
enc3=enc4=64;
}else{
if(isNaN(chr3)){
enc4=64;
}
}
_90d=_90d+this._keyStr.charAt(enc1)+this._keyStr.charAt(enc2)+this._keyStr.charAt(enc3)+this._keyStr.charAt(enc4);
}
return _90d;
},decode:function(_910){
var _911="";
var chr1,chr2,chr3;
var enc1,enc2,enc3,enc4;
var i=0;
_910=_910.replace(/[^A-Za-z0-9\+\/\=]/g,"");
while(i<_910.length){
enc1=this._keyStr.indexOf(_910.charAt(i++));
enc2=this._keyStr.indexOf(_910.charAt(i++));
enc3=this._keyStr.indexOf(_910.charAt(i++));
enc4=this._keyStr.indexOf(_910.charAt(i++));
chr1=(enc1<<2)|(enc2>>4);
chr2=((enc2&15)<<4)|(enc3>>2);
chr3=((enc3&3)<<6)|enc4;
_911=_911+String.fromCharCode(chr1);
if(enc3!=64){
_911=_911+String.fromCharCode(chr2);
}
if(enc4!=64){
_911=_911+String.fromCharCode(chr3);
}
}
_911=Base64._utf8_decode(_911);
return _911;
},_utf8_encode:function(_915){
_915=_915.replace(/\r\n/g,"\n");
var _916="";
for(var n=0;n<_915.length;n++){
var c=_915.charCodeAt(n);
if(c<128){
_916+=String.fromCharCode(c);
}else{
if((c>127)&&(c<2048)){
_916+=String.fromCharCode((c>>6)|192);
_916+=String.fromCharCode((c&63)|128);
}else{
_916+=String.fromCharCode((c>>12)|224);
_916+=String.fromCharCode(((c>>6)&63)|128);
_916+=String.fromCharCode((c&63)|128);
}
}
}
return _916;
},_utf8_decode:function(_919){
var _91a="";
var i=0;
var c=c1=c2=0;
while(i<_919.length){
c=_919.charCodeAt(i);
if(c<128){
_91a+=String.fromCharCode(c);
i++;
}else{
if((c>191)&&(c<224)){
c2=_919.charCodeAt(i+1);
_91a+=String.fromCharCode(((c&31)<<6)|(c2&63));
i+=2;
}else{
c2=_919.charCodeAt(i+1);
c3=_919.charCodeAt(i+2);
_91a+=String.fromCharCode(((c&15)<<12)|((c2&63)<<6)|(c3&63));
i+=3;
}
}
}
return _91a;
}};
