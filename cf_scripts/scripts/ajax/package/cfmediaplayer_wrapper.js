/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.MediaPlayer){
ColdFusion.MediaPlayer={};
}
var $MP=ColdFusion.MediaPlayer;
$MP.defaultSWFLocation=_cf_ajaxscriptsrc+"/resources/cf/assets/StrobeMediaPlayback.swf",$MP.defaultOptions={swf:$MP.defaultSWFLocation,width:480,height:275,src:"",javascriptControls:true,playButtonOverlay:true,loop:false,autoPlay:false,controlBarMode:"docked",javascriptCallbackFunction:"triggerHandler"};
$MP.playerMap={};
$MP.playerWrapperMap={};
$MP.playerOptionsMap={};
$MP.jsFunctionMap={};
$MP.titleDataMap={};
$MP.videoMonitorMap={};
$MP.bindInfoMap={};
$MP.bindElements={};
$MP.baseURI;
$MP.fancyBoxLeftBorderOffset=5;
$MP.fancyBoxBottonBorderOffset=6;
$MP.hasHTML5VideoPlaybackSupport=!!document.createElement("video").canPlayType;
String.prototype.trim=function(){
return this.replace(/^\s+|\s+$/g,"");
};
ColdFusion.MediaPlayer.init=function(_6e5){
var _6e6=$MP.defaultOptions;
_6e6.id=_6e5.id;
var _6e7={};
var _6e8={};
var _6e9={};
var _6ea=null;
var _6eb={onStart:null,onComplete:null,onPause:null,onError:null,onLoad:null,onStartCallback:playbackStart,onPauseCallback:playbackPause};
if(_6e5.width!=null&&typeof (_6e5.width)!="undefined"){
_6e6.width=_6e5.width;
}else{
_6e6.width=480;
}
if(_6e5.height!=null&&typeof (_6e5.height)!="undefined"){
_6e6.height=_6e5.height;
}else{
_6e6.height=275;
}
if(_6e5.baseURI!=null){
$MP.baseURI=_6e5.baseURI;
}
if(_6e5.src!=null&&_6e5.src!=""){
_6e6.src=resolveSource(_6e5.src);
}else{
_6e6.src="";
}
if(_6e5.PosterImage!=null&&_6e5.PosterImage!=""){
_6e6.poster=resolveSource(_6e5.PosterImage);
}else{
_6e6.poster="";
}
if(_6e5.javascriptControls==null){
_6e6.javascriptControls=true;
}
if(_6e5.playButtonOverlay==null){
_6e6.playButtonOverlay=true;
}
if(_6e5.repeat!=null){
if(_6e5.repeat=="true"){
_6e6.loop=true;
}else{
_6e6.loop=false;
}
}else{
_6e6.loop=false;
}
if(_6e5.autoPlay!=null){
if(_6e5.autoPlay=="true"){
_6e6.autoPlay=true;
}else{
_6e6.autoPlay=false;
}
}else{
_6e6.autoPlay=false;
}
if(_6e5.bgcolor!=null){
_6e6.backgroundColor=_6e5.bgcolor;
_6e8.bgColor=_6e5.bgcolor;
}
if(_6e5.controlbar!=null){
if(_6e5.controlbar==false){
_6e6.controlBarMode="none";
}else{
_6e6.controlBarMode="docked";
}
}
if(_6e5.skin!=null){
_6e6.skin=resolveSource(_6e5.skin);
}else{
_6e6.skin="";
}
if(_6e5.onComplete!=null){
_6eb.onComplete=_6e5.onComplete;
}
if(_6e5.onLoad!=null){
_6eb.onLoad=_6e5.onLoad;
}
if(_6e5.onStart!=null){
_6eb.onStart=_6e5.onStart;
}
if(_6e5.onPause!=null){
_6eb.onPause=_6e5.onPause;
}
if(_6e5.onError!=null){
_6eb.onError=_6e5.onError;
}
if(_6e5.onBind!=null){
_6eb.onBind=_6e5.onBind;
}
if(_6e5.hideTitle!=null){
_6e7.hideTitle=_6e5.hideTitle;
}
if(_6e5.title!=null){
_6e7.title=_6e5.title;
}
if(_6e5.title_text_color!=null){
_6e7.title_text_color=_6e5.title_text_color;
}
if(_6e5.title_bgcolor!=null){
_6e7.title_bgcolor=_6e5.title_bgcolor;
}
if(_6e5.border_left!=null){
_6e8.border_left=_6e5.border_left;
}
if(_6e5.border_right!=null){
_6e8.border_right=_6e5.border_right;
}
if(_6e5.border_top!=null){
_6e8.border_top=_6e5.border_top;
}
if(_6e5.border_bottom!=null){
_6e8.border_bottom=_6e5.border_bottom;
}
if(_6e5.progress_color!=null){
_6e9.progress_color=_6e5.progress_color;
}
if(_6e5.progress_bgcolor!=null){
_6e9.progress_bgcolor=_6e5.progress_bgcolor;
}
if(_6e5.controls_color!=null){
_6e9.controls_color=_6e5.controls_color;
}
if(_6e5.controlbar_bgcolor!=null){
_6e9.controlbar_bgcolor=_6e5.controlbar_bgcolor;
}
if(!_6e6.javascriptControls){
$(".strobeMediaPlaybackControlBar,.smp-error,.playoverlay").show();
}
if(_6e5.bindData!=null&&_6e5.bindData!="undefined"){
_6ea=$.extend(true,{},_6e6);
handleBindingMediaPlayer(_6ea,_6e5.bindData,_6e5.type,_6eb);
return;
}
handleWmode(_6e5,_6e6);
playerInitialization(_6e6,_6e5.type,_6eb,_6e7,_6e8,_6e9);
};
function handleWmode(_6ec,_6ed){
if(navigator.platform.indexOf("Linux")!=-1){
_6ed.wmode="direct";
return;
}
if(_6ec.wmode!=null){
_6ed.wmode=_6ec.wmode;
}else{
_6ed.wmode="direct";
}
var _6ee=document.getElementById(_6ed.id+"_"+"videoTitle");
if((_6ee!==null&&(_6ec.hideTitle==null||_6ec.hideTitle==false))||(_6ed.backgroundColor!=null&&_6ed.backgroundColor.trim()!="")){
_6ed.wmode="transparent";
}
}
function isValidSourceElementExist(_6ef,type){
if(_6ef.src!=null&&_6ef.src!=""){
if(type=="html"&&$MP.hasHTML5VideoPlaybackSupport&&isHTMLFileFormatSupported(_6ef.src)){
return true;
}else{
if(type=="flash"&&isFlashSupported()&&isFlashFileFormatSupported(_6ef.src)){
return true;
}
}
}
var _6f1=document.getElementById(_6ef.id+"_extendData");
if(_6f1==null||_6f1.childNodes==null||!isFlashSupported()){
return false;
}
var _6f2=_6f1.getElementsByTagName("source");
for(var k=0;k<_6f2.length;k++){
var src=_6f2[k].getAttribute("src");
if(type=="html"&&$MP.hasHTML5VideoPlaybackSupport&&isHTMLFileFormatSupported(src)){
return true;
}else{
if(type=="flash"&&isFlashSupported()&&isFlashFileFormatSupported(src)){
return true;
}
}
}
return false;
}
function hideTitle(id){
var _6f6=document.getElementById(id+"_"+"videoTitle");
if(_6f6==null){
id=id.substring(0,id.indexOf("_strobemediaplayback-video"));
_6f6=document.getElementById(id+"_"+"videoTitle");
}
if(_6f6!=null){
$("#"+id+"_"+"videoTitle").fadeOut(600,null);
}
}
function playbackStart(id){
var _6f8=getFuncMap(id);
if(_6f8.onStart!=null){
_6f8.onStart();
}
var _6f9=getWrapper(id);
if(_6f9!=null){
_6f9.playOverlay.fadeOut(600);
}
hideTitle(id);
}
function showTitle(id){
var _6fb=document.getElementById(id+"_"+"videoTitle");
if(_6fb==null){
id=id.substring(0,id.indexOf("_strobemediaplayback-video"));
_6fb=document.getElementById(id+"_"+"videoTitle");
}
if(_6fb!=null){
$("#"+id+"_"+"videoTitle").fadeIn(1,null);
}
}
function playbackPause(id){
var _6fd=getFuncMap(id);
if(_6fd.onPause!=null){
_6fd.onPause();
}
var _6fe=getWrapper(id);
if(_6fe!=null){
_6fe.playOverlay.fadeIn(600);
}
showTitle(id);
}
function playbackComplete(id){
var _700=getFuncMap(id);
if(_700.onComplete!=null){
_700.onComplete();
}
var _701=getWrapper(id);
if(_701!=null){
_701.playOverlay.fadeIn(600);
_701.slider.css("left",0+"px");
_701.currenttime.html("0:00");
}
showTitle(id);
}
function updateFlashVideoSource(_702){
if(_702.src!=null&&_702.src!=""){
if(isFlashSupported()&&isFlashFileFormatSupported(_702.src)){
return;
}
}
var _703=document.getElementById(_702.id+"_extendData");
if(_703==null||_703.childNodes==null||!isFlashSupported()){
return;
}
var _704=_703.getElementsByTagName("source");
for(var k=0;k<_704.length;k++){
var src=_704[k].getAttribute("src");
if(isFlashSupported()&&isFlashFileFormatSupported(src)){
_702.src=resolveSource(src);
return;
}
}
return;
}
function playerInitialization(_707,type,_709,_70a,_70b,_70c){
var _70d=true;
var _70e=isValidSourceElementExist(_707,"html");
var _70f=isValidSourceElementExist(_707,"flash");
var _710=$MP.handleUserDefinedFlashParams(_707,type);
if(_710){
_707.favorFlashOverHtml5Video=true;
}else{
if(isFlashSupported()){
if(type==null||type=="flash"){
if(_70f){
_707.favorFlashOverHtml5Video=true;
}else{
if(_70e){
_707.favorFlashOverHtml5Video=false;
}else{
_70d=false;
}
}
}else{
if(_70e){
_707.favorFlashOverHtml5Video=false;
}else{
if(_70f){
_707.favorFlashOverHtml5Video=true;
}else{
_70d=false;
}
}
}
}else{
if($MP.hasHTML5VideoPlaybackSupport){
_707.favorFlashOverHtml5Video=false;
}else{
_70d=false;
}
}
}
if(_707.favorFlashOverHtml5Video){
updateFlashVideoSource(_707);
}
if(!_70d){
if($MP.hasHTML5VideoPlaybackSupport){
_707.favorFlashOverHtml5Video=false;
}else{
$(".playoverlay").hide();
ColdFusion.MediaPlayer.logError(_707.id,"The video could not be loaded");
return;
}
}
var _711={"tablet":{"startSize":{"width":+_707.width,"height":+_707.height},"name":_707.id+"_"+"strobemediaplayback-video"},"smartphone":{"startSize":{"width":+_707.width,"height":+_707.height},"name":_707.id+"_"+"strobemediaplayback-video"},"default":{"startSize":{"width":+_707.width,"height":+_707.height},"name":_707.id+"_"+"strobemediaplayback-video"}};
strobeMediaPlayback.draw(_707.id+"_"+"strobemediaplayback-video",_711,_707);
var _712=$("#"+_707.id+"_"+"strobemediaplayback-video");
var _713=$("#"+_707.id);
var _714=_713.get(0);
var _715;
if(_714==null){
_707.id=_707.id+"_strobemediaplayback-video";
$MP.playerOptionsMap[_707.id]=_707;
$MP.videoMonitorMap[_707.id]={paused:true,muted:false};
}else{
_715=$("#"+_707.id+"_"+"strobemediaplayback-video  .html5player").strobemediaplaybackhtml5(_707,_709);
$MP.playerMap[_707.id]=_714;
$MP.playerWrapperMap[_707.id]=_715;
$MP.playerOptionsMap[_707.id]=_707;
}
$MP.jsFunctionMap[_707.id]=_709;
$MP.titleDataMap[_707.id]=_70a;
if(_714!=null&&_714.nodeName!=null&&_714.nodeName.toLowerCase()=="video"){
handleVolumeSlider(_707.id);
_714.volume=0.6;
handlePlayoverlay(_707.id,_707.width,_707.height);
handleErrorElement(_707.id,_707.width,_707.height);
var _716=$MP.playerWrapperMap[_707.id];
_716.playOverlay.css("display","block");
_712.css("width","100%");
_712.css("height","100%");
handlebackgroundColor(_707);
handleControlsStyle(_707.id,_70c);
_715.useHTML5=true;
var _717=document.getElementById(_707.id+"_extendData");
if(_717!=null){
$MP.handleUserDefinedHTML5Element(_714,_707.id+"_extendData");
}else{
handleTitle(_707.id,_707.src,_70a);
var _718=getFuncMap(_707.id);
var _719=document.getElementById(_707.id);
var _71a=_719.getElementsByTagName("source");
if(_71a!=null&&_71a.length!=0){
_71a[0].setAttribute("onerror","onError(event)");
}
}
}else{
handleTitle(_707.id,_707.src,_70a);
}
handleBorderStyle(_707.id,_70b);
if($MP.bindInfoMap[_707.id]==null){
var _71b=document.getElementById(_707.id+"_extendData");
if(_71b==null){
var id=_707.id.substring(0,_707.id.indexOf("_"));
_71b=document.getElementById(id+"_extendData");
}
if(_71b!=null&&_71b.parentNode!=null){
_71b.parentNode.removeChild(_71b);
}
}
}
function handleVolumeChangeUI(_71d,_71e){
var _71f=getWrapper(_71d);
if(_71e<=0){
_71f.volumeHigh.css("background-position","0px -72px");
}else{
if(_71e<=0.3){
_71f.volumeHigh.css("background-position","-24px -72px");
}else{
if(_71e<=0.7){
_71f.volumeHigh.css("background-position","-48px -72px");
}else{
_71f.volumeHigh.css("background-position","-72px -72px");
}
}
}
}
function handleVolumeSlider(_720){
var _721=getWrapper(_720);
var _722=_721.volumeSlider;
_722.slider({orientation:"vertical",range:"min",min:0,max:90,value:60,slide:function(_723,ui){
var _725=ui.value/100;
_721.currentVolume=_725;
handleChangeVolume(_720,_725);
}});
_721.volumeHigh.mouseover(function(){
var _726=getWrapper(_720);
var _727=_726.volumeSlider;
_727.css("display","block");
_726.volumeContainer.css("display","block");
});
_721.volumeHigh.mouseout(function(_728){
var _729=getWrapper(_720);
var _72a=_729.volumeSlider;
var _72b=_729.volumeContainer;
var _72c=_728.relatedTarget;
if(_72c.className!="controls"){
_72a.css("display","none");
_72b.css("display","none");
}
});
_721.volumeHigh.click(function(_72d){
var _72e=getWrapper(_720);
if(_72e.currentVolume==null){
_72e.currentVolume=0.6;
}
var pos=_721.volumeHigh.css("background-position");
if(pos.indexOf("0px")!=0){
_721.volumeHigh.css("background-position","0px -72px");
_721.volumeSlider.slider("value",0);
handleChangeVolume(_720,0);
}else{
_721.volumeSlider.slider("value",_72e.currentVolume*100);
if(_72e.currentVolume<=0.1){
_721.volumeHigh.css("background-position","0px -72px");
}else{
if(_72e.currentVolume<=0.3){
_721.volumeHigh.css("background-position","-24px -72px");
}else{
if(_72e.currentVolume<=0.7){
_721.volumeHigh.css("background-position","-48px -72px");
}else{
_721.volumeHigh.css("background-position","-72px -72px");
}
}
}
handleChangeVolume(_720,_72e.currentVolume);
}
});
_721.controlbar.mouseout(function(_730){
if(_730.relatedTarget==null){
return;
}
var _731=_730.relatedTarget.className;
if(_730.relatedTarget.className!="controls"&&_731!="volume-container"&&_731.indexOf("ui-slider")==-1){
var _732=getWrapper(_720);
var _733=_732.volumeSlider;
var _734=_732.volumeContainer;
_733.css("display","none");
_734.css("display","none");
}
});
}
function handleBindingMediaPlayer(_735,_736,type,_738){
var _739=document.getElementById(_735.id+"_"+"html5MediaPlayback");
if(_739==null){
return;
}
var _73a=_739.innerHTML;
if(_73a==null){
return;
}
var _73b={};
_73b.videoContent=_73a;
_73b.type=type;
_73b.player_options=_735;
_73b.jsfunction=_738;
$MP.bindInfoMap[_735.id]=_73b;
var _73c=-1;
var _73d=0;
var _73e=_736;
do{
var _73f;
_73c=_736.indexOf(",",_73d);
if(_73c!=-1){
_73f=_736.substring(_73d,_73c);
_73d=_73c+1;
_73e=_736.substring(_73c+1);
}else{
_73f=_73e;
}
var _740=_73f;
var _741;
if(_73f.indexOf("@")!=-1){
_740=_73f.substring(0,_73f.indexOf("@"));
_741=_73f.substring(_73f.indexOf("@")+1);
}else{
_740=_73f;
_741="onClick";
}
var _742=document.getElementById(_740);
if(_742==null){
continue;
}
handleTitle(_735.id,_735.src);
var _743=getVideoTitle(_735.src);
if(_741==null||_741.toLowerCase()=="onclick"){
bindFancyBox(false,true,_740,_741,_735,type,_738,_73a,_743);
}else{
var _744=document.getElementById(_740);
_741=_741.substring(2);
$("#"+_740).live(_741.toLowerCase(),function(e){
bindFancyBox(true,true,_740,_741,_735,type,_738,_73a,_743);
});
}
}while(_73c!=-1);
var _746=document.getElementById(_735.id+"_"+"mediacontainer");
_746.parentNode.removeChild(_746);
}
function bindFancyBox(fire,_748,_749,_74a,_74b,type,_74d,_74e,_74f){
var _750=document.getElementById(_74b.id+"_"+"videoTitle");
if(_750==null){
_74f="";
}else{
if(_74f==null||_74f==""){
_74f="video";
}
}
if(fire){
$("#"+_749).fancybox({content:_74e,overlayShow:true,overlayOpacity:0.7,width:_74b.width+$MP.fancyBoxLeftBorderOffset,height:_74b.height+$MP.fancyBoxBottonBorderOffset,title:_74f,autoDimensions:false,onComplete:function(){
var _751=$.extend(true,{},$MP.bindInfoMap[_74b.id].player_options);
if(_748&&_74d.onBind!=null){
_74d.onBind(_749,_74a);
}
var _752=$MP.bindInfoMap[_74b.id].player_options;
playerInitialization(_752,type,_74d);
handleBindEvents(_752,$MP.bindInfoMap[_74b.id]);
$MP.bindInfoMap[_74b.id].player_options=$.extend(true,{},_751);
}}).trigger("click");
}else{
$("#"+_749).fancybox({content:_74e,overlayShow:true,overlayOpacity:0.7,width:_74b.width+$MP.fancyBoxLeftBorderOffset,height:_74b.height+$MP.fancyBoxBottonBorderOffset,title:_74f,autoDimensions:false,onComplete:function(){
var _753=$.extend(true,{},$MP.bindInfoMap[_74b.id].player_options);
if(_748&&_74d.onBind!=null){
_74d.onBind(_749,_74a);
}
var _754=$MP.bindInfoMap[_74b.id].player_options;
playerInitialization(_754,type,_74d);
handleBindEvents(_754,$MP.bindInfoMap[_74b.id]);
$MP.bindInfoMap[_74b.id].player_options=$.extend(true,{},_753);
}});
}
}
function handleBindEvents(_755,_756){
var _757=$MP.getPlayer(_755.id);
if(_756.mute!=null){
_757.muted=mute;
}
if(_756.volume!=null){
handleChangeVolume(_755.id,_756.volume);
}
if(_756.startPlay!=null){
_757.start();
}
if(_756.stopPlay!=null){
_757.pause();
}
}
function updateVideoType(_758){
var _759=_758.childNodes;
if(_759==null){
return;
}
var _75a=_758.getElementsByTagName("source");
if(_75a==null||_75a.length===0){
return;
}
var _75b=_75a[0].getAttribute("src");
if(_75b==null){
return;
}
var type=_75a[0].getAttribute("type");
if(type!=null){
return;
}
if(_75b.lastIndexOf(".")==-1){
return;
}
var _75d=_75b.substring(_75b.lastIndexOf(".")+1);
_75d=_75d.toLowerCase();
if(_75d=="mp4"){
_75a[0].setAttribute("type","video/mp4");
}else{
if(_75d=="ogv"){
_75a[0].setAttribute("type","video/ogg");
}else{
if(_75d=="webm"){
_75a[0].setAttribute("type","video/webm");
}
}
}
}
$MP.handleUserDefinedHTML5Element=function(_75e,_75f){
var _760=document.getElementById(_75f);
var _761=_760.childNodes;
var _762=false;
updateVideoType(_75e);
if(_761!=null){
var _763=null;
for(var k=0;k<_761.length;k++){
var _765=_761[k];
if(_765.tagName!=null&&_765.tagName.toLowerCase()=="video"){
_763=_765;
break;
}
}
if(_763==null){
return;
}
_761=_763.childNodes;
var _766=null;
var _767;
for(var i=0;i<_761.length;i++){
var _765=_761[i];
if(_765.tagName!=null&&_765.tagName.toLowerCase()=="track"){
_75e.appendChild(_765);
}else{
if(_765.tagName!=null&&_765.tagName.toLowerCase()=="source"){
if(!_762){
var _769=_75e.getAttribute("src");
if(_769==null){
var _76a=_75e.childNodes;
if(_76a!=null){
for(var l=0;l<_76a.length;l++){
if(_76a[l].tagName.toLowerCase()=="source"){
var src=_76a[l].getAttribute("src");
if(src!=null&&src.trim()!=0&&isHTMLFileFormatSupported(src)){
_766=src;
break;
}
}
}
}
}
if(_769!=null&&_769!=""&&_769.lastIndexOf(".")!=-1){
var _76d=document.createElement("source");
_76d.setAttribute("src",_769);
var _76e=_769.substring(_769.lastIndexOf(".")+1);
if(_76e=="mp4"){
_76d.setAttribute("type","video/mp4");
}else{
if(_76e=="ogv"){
_76d.setAttribute("type","video/ogg");
}else{
if(_76e=="webm"){
_76d.setAttribute("type","video/webm");
}
}
}
_75e.appendChild(_76d);
}
if(_766==null&&isHTMLFileFormatSupported(_769)){
_766=_769;
}
_75e.removeAttribute("src");
}
var src=_765.getAttribute("src");
src=resolveSource(src);
_765.setAttribute("src",src);
_75e.appendChild(_765);
_762=true;
_767=_765;
if(_766==null&&isHTMLFileFormatSupported(src)){
_766=src;
}
}
}
}
if(_766!=null){
handleTitle(_75e.id,_766);
}
if(_767!=null){
_767.setAttribute("onerror","onError(event)");
}
}
_75e.load();
};
$MP.handleUserDefinedFlashParams=function(_76f,type){
var _771=document.getElementById(_76f.id+"_extendData");
if(_771==null||_771.childNodes==null||!isFlashSupported()){
return;
}
var _772=_771.childNodes;
var _773=false;
if(_772!=null){
var _774=null;
for(var k=0;k<_772.length;k++){
var _776=_772[k];
if(_776.tagName!=null&&(_776.tagName.toLowerCase()=="object"||_776.tagName.toLowerCase()=="video")){
_774=_776;
var _777=_774.childNodes;
for(var i=0;i<_777.length;i++){
var _776=_777[i];
if(_776.tagName!=null&&_776.tagName.toLowerCase()=="param"){
_773=true;
var _779=_776.getAttribute("name");
if(_779=="flashvars"){
var _77a=_776.getAttribute("value");
var _77b=0;
var _77c=_77a;
do{
var _77d=_77c.indexOf("&");
var _77e;
if(_77d>0){
_77e=_77c.substring(_77b,_77d);
}else{
_77e=_77c;
}
if(_77e.indexOf("=")>0){
var _77f=_77e.substring(0,_77e.indexOf("="));
var _780=_77e.substring(_77e.indexOf("=")+1);
if(_77f!=""||_780!=""){
_76f[_77f]=resolveSource(_780);
}
}
_77b=_77d+1;
_77c=_77c.substring(_77b);
}while(_77d>0);
}
}
}
}
}
return _773;
}
};
function isFlashSupported(){
return swfobject.hasFlashPlayerVersion("1");
}
function isFlashFileFormatSupported(_781){
if(_781.indexOf("rtmp")==0){
return true;
}
var _782=["flv","f4v","f4m","m3u","mp4","swf","mpeg-4","m4v","f4f","3gpp","mp3","3gpp2","pbg","gif","jpg","jpeg","aac","speex","nellymoser","QuickTime"];
var _783=_781.lastIndexOf(".");
var _784=_781.substring(_783+1,_781.length);
_784=_784.toLowerCase();
for(var i=0;i<_782.length;i++){
if(_782[i]==_784){
return true;
}
}
return false;
}
function isHTMLFileFormatSupported(_786){
if(_786==null){
return false;
}
var _787=["webm","mp4","ogv"];
var _788=_786.lastIndexOf(".");
var _789=_786.substring(_788+1,_786.length);
_789=_789.toLowerCase();
var elem=document.createElement("video");
var ogg=elem.canPlayType("video/ogg; codecs=\"theora\"");
var h264="video/mp4; codecs=\"avc1.42E01E";
var mp4=elem.canPlayType(h264+"\"")||elem.canPlayType(h264+", mp4a.40.2\"");
var webm=elem.canPlayType("video/webm; codecs=\"vp8, vorbis\"");
for(var i=0;i<_787.length;i++){
if(_787[i]==_789){
if(_789=="ogv"){
return ogg;
}else{
if(_789=="webm"){
return webm;
}else{
if(_789=="mp4"){
return mp4;
}
}
}
}
}
return false;
}
function getWrapper(name){
var _791=$MP.playerWrapperMap[name];
if(_791==null||typeof (_791)=="undefined"){
return $MP.playerWrapperMap[name+"_strobemediaplayback-video"];
}
return _791;
}
function getFuncMap(name){
var _793=$MP.jsFunctionMap[name];
if(_793==null||typeof (_793)=="undefined"){
return $MP.jsFunctionMap[name+"_strobemediaplayback-video"];
}
return _793;
}
ColdFusion.MediaPlayer.setMute=function(name,mute){
if($MP.bindInfoMap[name]!=null){
var _796=getBindInfo(name);
if(_796==null){
return;
}
_796.mute=mute;
return;
}
var _797=$MP.getPlayer(name);
var _798=$MP.getType(name);
var _799=getWrapper(name);
if(_798=="html"){
_797.muted=mute;
if(mute){
_799.volumeHigh.css("background-position","0px -72px");
_799.volumeSlider.slider("value",0);
}else{
handleChangeVolume(name,_797.volume);
}
}else{
if(_798=="flash"){
_797.setMuted(mute);
}
}
};
function resolveSource(src){
if(src==null){
return null;
}
if(src.charAt(0)!="/"&&src.indexOf("://")<0){
var _79b="";
var _79c=document.location.href;
if(_79c||_79c.indexOf("/")>-1){
_79b=_79c.substring(0,_79c.lastIndexOf("/")+1);
}
var _79d=_79b+src;
var _79e=_79d.split("/");
var _79f=new Array();
var _7a0=0;
for(var i=0;i<_79e.length;i++){
if(_79e[i]==".."){
_79f[--_7a0]="";
}else{
_79f[_7a0++]=_79e[i];
}
}
src=_79f[0];
for(var i=1;i<_7a0;i++){
src=src+"/"+_79f[i];
}
}
if(src.indexOf("/")==0){
src=$MP.baseURI+src;
}
return src;
}
ColdFusion.MediaPlayer.getPlayer=function(name){
var _7a3=$MP.playerMap[name];
if(_7a3==null||typeof (_7a3)=="undefined"){
_7a3=$MP.playerMap[name+"_strobemediaplayback-video"];
if(_7a3==null||typeof (_7a3)=="undefined"){
ColdFusion.handleError(null,"mediaplayer.getplayer.notfound","widget",[name],null,null,true);
}
}
return _7a3;
};
ColdFusion.MediaPlayer.setTitle=function(name,_7a5){
if(_7a5==null){
ColdFusion.handleError(null,"mediaplayer.settitle.invalidtitle","widget",[name],null,null,true);
}
var _7a6=$MP.titleDataMap[name];
if(_7a6==null){
_7a6={};
$MP.titleDataMap[name]=_7a6;
}
var _7a7=document.getElementById(name+"_videoTitle");
if(_7a7==null){
var _7a8="<div id=\""+name+"_videoTitle\">";
$("#"+name+"_videoContainer").prepend(_7a8);
}
_7a6.hideTitle=false;
_7a6.title=_7a5;
handleTitle(name,_7a5,_7a6);
};
ColdFusion.MediaPlayer.setSource=function(name,src){
if(src==null||src=="undefined"){
ColdFusion.handleError(null,"mediaplayer.setsource.invalidsource","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _7ab=getBindInfo(name);
if(_7ab==null){
return;
}
_7ab.player_options.src=resolveSource(src);
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_7ab.player_options.favorFlashOverHtml5Video=true;
}else{
_7ab.player_options.favorFlashOverHtml5Video=false;
}
_7ab.videoTitle=getVideoTitle(src);
return;
}
var _7ac=$MP.getPlayer(name);
var _7ad=$MP.getType(name);
src=resolveSource(src);
var _7ae=getWrapper(name);
var _7af,jsFunctionMap;
if(_7ae!=null&&_7ae.errorwindow!=null){
_7ae.errorwindow.html("");
_7ae.errorwindow.hide();
_7af=$MP.playerOptionsMap[_7ae.options.id];
}else{
_7af=$MP.playerOptionsMap[name+"_"+"strobemediaplayback-video"];
jsFunctionMap=$MP.jsFunctionMap[name+"_"+"strobemediaplayback-video"];
}
if(_7af==null){
_7af=$MP.defaultOptions;
}
var _7b0={"tablet":{"name":_7af.id+"_"+"strobemediaplayback-video"},"smartphone":{"startSize":{"width":360,"height":200},"name":_7af.id+"_"+"strobemediaplayback-video"},"default":{"startSize":{"width":+_7af.width,"height":+_7af.height},"name":_7af.id+"_"+"strobemediaplayback-video"}};
if(_7ad=="html"){
if(isHTMLFileFormatSupported(src)){
_7ac.src=src;
_7ac.load();
_7ac.pause();
_7ae.playOverlay.fadeIn(600);
_7ae.playtoggle.removeClass("paused");
_7ae.slider.css({"left":"0%"});
_7ae.playedbar.css({"width":"0%"});
_7ae.currenttime.html("0:00");
_7ae.duration.html("0:00");
var css={"left":"0%","width":"0%"};
_7ae.bufferbar.removeClass("done");
_7ae.bufferbar.css(css);
var _7b2=$MP.titleDataMap[_7af.id];
handleTitle(name,src,_7b2);
}else{
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_7af.isHTML5=false;
_7af.favorFlashOverHtml5Video=true;
_7af.src=src;
var _7b2=$MP.titleDataMap[_7af.id];
if(_7b2.hideTitle!=null&&!_7b2.hideTitle){
_7af.wmode="opaque";
}
strobeMediaPlayback.draw(_7af.id+"_"+"strobemediaplayback-video",_7b0,_7af);
var _7b3=$("#"+_7af.id+"_"+"strobemediaplayback-video");
var _7b4=_7b3.find("video");
var _7b5=_7b4.get(0);
var _7b6=$("#"+_7af.id+"_"+"strobemediaplayback-video  .html5player").strobemediaplaybackhtml5(_7af,_7ae.jsCallbackFunctions);
$MP.playerMap[_7af.id]=_7b5;
$MP.playerWrapperMap[_7af.id]=_7b6;
handleTitle(_7af.id,_7af.src,_7b2);
}
}
}else{
if(_7ad=="flash"){
if(isFlashFileFormatSupported(src)&&isFlashSupported()){
_7ac.setMediaResourceURL(src);
handleTitle(name,src,$MP.titleDataMap[id]);
}else{
if(isHTMLFileFormatSupported(src)){
var id=_7af.id+"_strobemediaplayback-video";
$("#"+id).replaceWith("<div  id=\""+id+"\"></div>");
$("#"+id).css("visibility","visible");
_7af.isHTML5=true;
_7af.favorFlashOverHtml5Video=false;
_7af.src=src;
strobeMediaPlayback.draw(id,_7b0,_7af);
var _7b3=$("#"+id);
var _7b4=_7b3.find("video");
var _7b5=_7b4.get(0);
if(_7b5==null){
return;
}
var _7b8=getFuncMap(id);
var _7b6=$("#"+id+"  .html5player").strobemediaplaybackhtml5(_7af,_7b8);
$MP.playerMap[_7af.id]=_7b5;
$MP.playerWrapperMap[_7af.id]=_7b6;
handlePlayoverlay(_7af.id,_7af.width,_7af.height);
handleErrorElement(_7af.id,_7af.width,_7af.height);
_7b6.playOverlay.css("display","block");
handleTitle(_7af.id,_7af.src,$MP.titleDataMap[id]);
_7b5.load();
if(_7af.autoPlay==false){
_7b5.pause();
}
}
}
}
}
};
function getBindInfo(name){
var _7ba=$MP.bindInfoMap[name];
if(_7ba!=null){
return _7ba;
}
return;
}
function handleBindElements(_7bb){
if(_7bb!=null){
if(_7bb.bindEvent==null||_7bb.bindEvent.toLowerCase()=="onclick"){
bindFancyBox(false,false,_7bb.bindElement,_7bb.player_options,_7bb.type,_7bb.jsFuncc,_7bb.videoContent,_7bb.videoTitle);
}else{
var _7bc=document.getElementById(_7bb.bindElement);
var _7bd=_7bb.bindEvent.substring(2);
$("#"+_7bb.bindElement).live(_7bd.toLowerCase(),function(e){
bindFancyBox(true,false,_7bb.bindElement,_7bb.player_options,_7bb.type,_7bb.jsFuncc,_7bb.videoContent,_7bb.videoTitle);
});
}
}
}
function handleChangeVolume(name,_7c0){
var _7c1=$MP.getPlayer(name);
var _7c2=$MP.getType(name);
if(_7c2=="html"){
if(_7c1.muted){
_7c1.muted=false;
}
_7c1.volume=_7c0;
var _7c3=getWrapper(name);
var _7c4=_7c3.volumeSlider;
_7c4.slider("value",_7c0*100);
handleVolumeChangeUI(name,_7c0);
}else{
if(_7c2=="flash"){
_7c1.setVolume(_7c0);
}
}
}
ColdFusion.MediaPlayer.setVolume=function(name,_7c6){
if(_7c6<=0){
ColdFusion.handleError(null,"mediaplayer.setvolume.invalidvalue","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _7c7=getBindInfo(name);
if(_7c7==null){
return;
}
_7c7.volume=_7c6;
return;
}
handleChangeVolume(name,_7c6);
};
ColdFusion.MediaPlayer.resize=function(name,_7c9,_7ca){
if(_7c9<=0||_7ca<=0){
ColdFusion.handleError(null,"mediaplayer.resize.invalidvalue","widget",[name],null,null,true);
}
if($MP.bindInfoMap[name]!=null){
var _7cb=getBindInfo(name);
if(_7cb==null){
return;
}
_7cb.player_options.width=_7c9;
_7cb.player_options.height=_7ca;
return;
}
var _7cc=false;
var _7cd=$MP.getPlayer(name);
var _7ce=$MP.getType(name);
var _7cf=getWrapper(name);
_7cd.width=_7c9;
_7cd.height=_7ca;
if(_7cf!=null){
_7cf.options.width=_7c9;
_7cf.options.height=_7ca;
_7cf.controlbar.css("width",_7c9-1.5);
if(_7cf.options.width>180){
_7cf.progressbar.css("width",_7c9-180);
_7cf.trackswidth=_7c9-180;
}else{
_7cf.progressbar.css("width","50%");
_7cf.trackswidth="50%";
}
handlePlayoverlay(name,_7c9,_7ca);
handleErrorElement(name,_7c9,_7ca);
}
$("#"+name+"_"+"videoContainer").css("width",_7c9);
$("#"+name+"_"+"videoContainer").css("height",_7ca);
if(_7cd.paused==false){
_7cf.playOverlay.hide();
}
};
ColdFusion.MediaPlayer.getType=function(name){
var elem=document.getElementById(name);
if(elem==null||elem=="undefined"){
elem=document.getElementById(name+"_strobemediaplayback-video");
if(elem==null||typeof (elem)=="undefined"){
return "unknown";
}
}
var type=elem.nodeName;
if(type==null){
return "unknown";
}
type=type.toLowerCase();
if(type=="video"){
return "html";
}else{
if(type=="object"){
return "flash";
}else{
return "unknown";
}
}
};
ColdFusion.MediaPlayer.startPlay=function(name){
if($MP.bindInfoMap[name]!=null){
var _7d4=getBindInfo(name);
if(_7d4==null){
return;
}
_7d4.startPlay=true;
return;
}
var _7d5=$MP.getPlayer(name);
var _7d6=$MP.getType(name);
if(_7d6=="html"){
_7d5.play();
}else{
if(_7d6=="flash"){
_7d5.play2();
}
}
};
ColdFusion.MediaPlayer.stopPlay=function(name){
if($MP.bindInfoMap[name]!=null){
var _7d8=getBindInfo(name);
if(_7d8==null){
return;
}
_7d8.stopPlay=true;
return;
}
var _7d9=$MP.getPlayer(name);
_7d9.pause();
};
ColdFusion.MediaPlayer.logError=function(name,_7db){
if(name==null||_7db==null){
return;
}
var _7dc=$MP.playerWrapperMap[name];
if(_7dc==null){
_7dc=$MP.playerWrapperMap[name+"_strobemediaplayback-video"];
if(_7dc==null){
return;
}
}
_7dc.errorwindow.html(_7db);
_7dc.errorwindow.show();
_7dc.playOverlay.hide();
};
function handlePlayoverlay(name,_7de,_7df){
if(!isDesktop){
return;
}
var _7e0=getWrapper(name);
_7e0.playOverlay.css("left","");
_7e0.playOverlay.css("top","");
_7e0.playOverlay.css("left",(_7de-116)/2+"px");
_7e0.playOverlay.css("top",(_7df-107)/2+"px");
}
function handleErrorElement(name,_7e2,_7e3){
var _7e4=getWrapper(name);
_7e4.playOverlay.css("display","none");
_7e4.errorwindow.css("left","");
_7e4.errorwindow.css("top","");
_7e4.errorwindow.css("display","none");
var _7e5=_7e4.controlbar;
var _7e6=0;
if(_7e5!=null){
_7e6=_7e5.css("height");
if(_7e6!=null&&_7e6.indexOf("px")!=-1){
_7e6=_7e6.substring(0,_7e6.indexOf("px"));
}else{
_7e6=0;
}
}
_7e4.errorwindow.css("margin-top",_7e3/2-_7e6+"px");
}
function handleTitleResize(id,_7e8,_7e9){
$("#"+id+"_videoTitle").css("width","");
$("#"+id+"_videoTitle").css("width",_7e8+"px");
}
function handleTitle(_7ea,_7eb,_7ec){
var _7ed=document.getElementById(_7ea+"_"+"videoTitle");
if(_7ed==null){
_7ea=_7ea.substring(0,_7ea.indexOf("_strobemediaplayback-video"));
_7ed=document.getElementById(_7ea+"_"+"videoTitle");
}
var _7ee=document.getElementById("fancybox-title-float-main");
if(_7ed!=null){
if(_7ec==null){
_7ec=$MP.titleDataMap[_7ea];
if(_7ec==null||_7ec.hideTitle){
var _7ef=_7ed.parentNode;
_7ef.removeChild(_7ed);
return;
}
}else{
if(_7ec.hideTitle){
var _7ef=_7ed.parentNode;
_7ef.removeChild(_7ed);
return;
}
}
var _7f0=_7ec.title;
if(_7ec==null||_7ec.title==null||_7ec.title.trim()==""){
_7f0=getVideoTitle(_7eb);
}
if(_7f0!=""){
_7ed.innerHTML=_7f0;
}else{
return;
}
$("#"+_7ea+"_"+"videoTitle").css("position","absolute");
$("#"+_7ea+"_"+"videoTitle").css("z-index",2);
if(_7ec==null||_7ec.title_text_color==null){
$("#"+_7ea+"_"+"videoTitle").css("color","white");
}else{
$("#"+_7ea+"_"+"videoTitle").css("color",_7ec.title_text_color);
}
if(_7ec!=null&&_7ec.title_bgcolor!=null){
$("#"+_7ea+"_"+"videoTitle").css("background-color",_7ec.title_bgcolor);
}
$("#"+_7ea+"_"+"videoTitle").css("font-weight","bold");
$("#"+_7ea+"_"+"videoTitle").css("font-family","Arial,Helvetica,sans-serif");
$("#"+_7ea+"_"+"videoTitle").css("font-size","13px");
$("#"+_7ea+"_"+"videoTitle").css("word-wrap","break-word");
if(_7ed.style.backgroundColor==null||_7ed.style.backgroundColor==""){
$("#"+_7ea+"_"+"videoTitle").css("margin-left","5px");
}
$("#"+_7ea+"_"+"videoTitle").show();
$("#"+_7ea+"_"+"strobemediaplayback").css("z-index",1);
}else{
if(_7ee!=null&&_7eb!=null){
$("#fancybox-title-float-main").text(_7eb);
}
}
}
function getVideoTitle(_7f1){
var _7f2=null;
if(_7f1!=null&&_7f1!=""){
var _7f3=_7f1.lastIndexOf("/");
if(_7f3==-1){
_7f3=_7f1.lastIndexOf("\\");
}
if(_7f3==-1){
_7f2=_7f1;
}
if(_7f2==null){
_7f2=_7f1.substring(_7f3+1,_7f1.length);
}
}
if(_7f2==null||_7f2.indexOf(".")<0){
return _7f1;
}else{
return _7f2;
}
}
function handlebackgroundColor(_7f4){
if(_7f4.backgroundColor==null){
return;
}
var _7f5=document.getElementById(_7f4.id);
if(_7f5==null){
return;
}
_7f5.setAttribute("style","background-color:"+_7f4.backgroundColor+";");
}
function handleBorderStyle(_7f6,_7f7){
if(_7f7.hideBorder){
return;
}
var _7f8="#fff";
if(_7f7.bgColor){
_7f8=_7f7.bgColor;
}
var _7f9=document.getElementById(_7f6+"_"+"videoContainer");
if(_7f9==null){
_7f6=_7f6.substring(0,_7f6.indexOf("_"));
}
if(_7f7.border_left!=null){
$("#"+_7f6+"_"+"videoContainer").css("border-left",_7f7.border_left+"px"+" solid "+_7f8);
}
if(_7f7.border_right!=null){
$("#"+_7f6+"_"+"videoContainer").css("border-right",_7f7.border_right+"px"+" solid "+_7f8);
}
if(_7f7.border_top!=null){
$("#"+_7f6+"_"+"videoContainer").css("border-top",_7f7.border_top+"px"+" solid "+_7f8);
}
if(_7f7.border_bottom!=null){
$("#"+_7f6+"_"+"videoContainer").css("border-bottom",_7f7.border_bottom+"px"+" solid "+_7f8);
}
}
function handleControlsStyle(_7fa,_7fb){
var _7fc=getWrapper(_7fa);
if(_7fb.controlbar_bgcolor!=null){
_7fc.controlbar.css("background-color",_7fb.controlbar_bgcolor);
}
if(_7fb.controls_color!=null){
_7fc.playtoggle.css("background-color",_7fb.controls_color);
_7fc.slider.css("background-color",_7fb.controls_color);
_7fc.fullview.css("background-color",_7fb.controls_color);
_7fc.currenttime.css("color",_7fb.controls_color);
_7fc.duration.css("color",_7fb.controls_color);
_7fc.seekbar.css("background-color",_7fb.controls_color);
_7fc.volumeHigh.css("background-color",_7fb.controls_color);
}
if(_7fb.progress_bgcolor!=null){
_7fc.bufferbar.css("background-color",_7fb.progress_bgcolor);
}
if(_7fb.progress_color!=null){
_7fc.playedbar.css("background-color",_7fb.progress_color);
}
}
function triggerHandler(id,_7fe,_7ff){
if(_7fe=="onJavaScriptBridgeCreated"){
return;
}else{
if(_7fe=="play"){
var _800=getFuncMap(id);
var _801=$MP.videoMonitorMap[id];
if(_800.onStartCallback!=null&&_801.paused){
_800.onStartCallback(id);
_801.paused=false;
}
hideTitle(id);
}else{
if(_7fe=="pause"){
var _800=getFuncMap(id);
var _801=$MP.videoMonitorMap[id];
if(_800.onPauseCallback!=null&&!_801.paused){
_800.onPauseCallback(id);
_801.paused=true;
}
showTitle(id);
}else{
if(_7fe=="complete"){
var _800=getFuncMap(id);
if(_800.onComplete!=null){
_800.onComplete();
}
var _801=$MP.videoMonitorMap[id];
_801.paused=true;
showTitle(id);
}else{
if(_7fe=="loadedmetadata"){
var _800=getFuncMap(id);
if(_800.onLoad!=null){
_800.onLoad();
}
}else{
if(_7fe=="error"){
var _800=getFuncMap(id);
if(_800.onError!=null){
_800.onError();
}
}else{
if(_7fe=="volumechange"){
var _801=$MP.videoMonitorMap[id];
_801.muted=_7ff.muted;
}
}
}
}
}
}
}
}
function onError(_802){
var _803;
var _804;
var _805;
var _806;
if(_802.target!=null&&_802.target.tagName.toLowerCase()=="video"){
_805=getFuncMap(_802.target.id);
if(_802.target.error!=null){
_804=_802.target.error.code;
}
_806=getWrapper(_802.target.id);
}else{
if(_802.target!=null&&_802.target.tagName.toLowerCase()=="source"){
var _807=_802.target.getAttribute("src");
var _808=_802.target.getAttribute("onerror");
if(_807!=null&&_808!=null){
_804=4;
}else{
return;
}
}
var _809=_802.target.parentNode;
_805=getFuncMap(_809.id);
_806=getWrapper(_809.id);
}
if(_804==null){
return;
}
if(_805.onError!=null){
_805.onError(_804);
return;
}
switch(_804){
case 1:
_803="You aborted the video playback.";
break;
case 2:
_803="A network error caused the video download to fail part-way.";
break;
case 3:
_803="The video playback was aborted due to a corruption problem or because the video used features your browser did not support.";
break;
case 4:
_803="The video could not be loaded, either because the server or network failed or because the format is not supported.";
break;
default:
_803="An unknown error occurred.";
break;
}
_806.playOverlay.css("display","none");
_806.errorwindow.html(_803);
_806.errorwindow.show();
}
function onFlashEmbedComplete(_80a){
var _80b=$("#"+_80a.id);
var _80c=_80b.get(0);
$MP.playerMap[_80a.id]=_80c;
}
function removejscssfile(_80d,_80e){
var _80f=(_80e=="js")?"script":(_80e=="css")?"link":"none";
var _810=(_80e=="js")?"src":(_80e=="css")?"href":"none";
var _811=document.getElementsByTagName(_80f);
for(var i=_811.length;i>=0;i--){
if(_811[i]&&_811[i].getAttribute(_810)!=null&&_811[i].getAttribute(_810).indexOf(_80d)!=-1){
_811[i].parentNode.removeChild(_811[i]);
}
}
}
