/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Map){
ColdFusion.Map={};
}
var coldFusion_markerObjCache=new Array();
var $MAP=ColdFusion.Map;
$MAP.statusCodeObject={code200:"A directions request could not be successfully parsed. For example, the request may have been rejected if it contained more than the maximum number of waypoints allowed.",code400:"A directions request could not be successfully parsed. For example, the request may have been rejected if it contained more than the maximum number of waypoints allowed.",code500:"A geocoding or directions request could not be successfully processed, yet the exact reason for the failure is not known",code601:"The HTTP query parameter was either missing or had no value. For geocoding requests, this means that an empty address was specified as input. For directions requests, this means that no query was specified in the input",code602:"No corresponding geographic location could be found for the specified address. This may be due to the fact that the address is relatively new, or it may be incorrect",code603:"The geocode for the given address or the route for the given directions query cannot be returned due to legal or contractual reasons",code604:"The GDirections object could not compute directions between the points mentioned in the query. This is usually because there is no route available between the two points, or because we do not have data for routing in that region",code610:"This request was invalid.",code620:"The webpage has gone over the requests limit in too short a period of time."};
ColdFusion.Map._init=function(_3ed,_3ee,_3ef,type,_3f1,_3f2,_3f3,_3f4,_3f5,_3f6,_3f7,_3f8,_3f9,_3fa,_3fb,_3fc,_3fd,_3fe,_3ff,_400,_401,_402,_403,_404,_405,_406,_407,_408,_409,_40a,_40b){
var _40c=null;
if(navigator.geolocation){
navigator.geolocation.getCurrentPosition(function(_40d){
if(_40b<1){
_400=_40d.coords.latitude;
_401=_40d.coords.longitude;
_3ff=null;
}
if(_40b!==0){
if(_40b<0){
_40b=_40b*-1;
}
_405[_40b-1].latitude=_40d.coords.latitude;
_405[_40b-1].longitude=_40d.coords.longitude;
}
_40c=ColdFusion.Map.init(_3ed,_3ee,_3ef,type,_3f1,_3f2,_3f3,_3f4,_3f5,_3f6,_3f7,_3f8,_3f9,_3fa,_3fb,_3fc,_3fd,_3fe,_3ff,_400,_401,_402,_403,_404,_405,_406,_407,_408,_409,_40a);
},function(_40e){
_40c=ColdFusion.Map.init(_3ed,_3ee,_3ef,type,_3f1,_3f2,_3f3,_3f4,_3f5,_3f6,_3f7,_3f8,_3f9,_3fa,_3fb,_3fc,_3fd,_3fe,_3ff,_400,_401,_402,_403,_404,_405,_406,_407,_408,_409,_40a);
});
}else{
_40c=ColdFusion.Map.init(_3ed,_3ee,_3ef,type,_3f1,_3f2,_3f3,_3f4,_3f5,_3f6,_3f7,_3f8,_3f9,_3fa,_3fb,_3fc,_3fd,_3fe,_3ff,_400,_401,_402,_403,_404,_405,_406,_407,_408,_409,_40a);
}
return _40c;
};
ColdFusion.Map.init=function(_40f,_410,_411,type,_413,_414,_415,_416,_417,_418,_419,_41a,_41b,_41c,_41d,_41e,_41f,_420,_421,_422,_423,_424,_425,_426,_427,_428,_429,_42a,_42b,_42c){
var _42d={divName:_40f,type:type,layout:"fit",renderTo:_40f,centerAddress:_421,centerLatitude:_422,centerLongitude:_423,markerItems:_427,onLoad:_428,onError:_429,showCenterMarker:_41c,showAllMarker:_41d,markerColor:_425,markerIcon:_426,markerBindListener:_42b,initShow:_416};
if(_411!=null&&typeof (_411)!="undefined"){
_42d.width=_411;
}else{
_42d.width=400;
}
if(_410!=null&&typeof (_410)!="undefined"){
_42d.height=_410;
}else{
_42d.height=400;
}
if(_413!=null&&typeof (_413)!="undefined"){
_42d.zoomLevel=_413;
}else{
_42d.zoomLevel=3;
}
_42d.hideBorders=_415;
if(!_415){
if(_414==null||typeof _414==="undefined"||_414.length==0){
_414=" ";
}
_42d.title=_414;
_42d.collapsible=_417;
}
if(_425==null&&_426==null){
_42d.markerColor="#00FF00";
}
var _42e=new Ext.Panel(_42d);
ColdFusion.objectCache[_40f]=_42d;
_42d.mapPanel=_42e;
var _42f=["enableDragging"];
var swz=false;
if(_418){
swz=true;
}
if(_419){
_42f.push("enableDoubleClickZoom");
}else{
_42f.push("disableDoubleClickZoom");
}
if(_41a){
_42f.push("enableContinuousZoom");
}else{
_42f.push("disableContinuousZoom");
}
var _431=["NonExistantControl"];
if(_41b){
_431.push("scaleControl");
}
var mtc=false;
var mtco="";
if(_41f&&_41f.toUpperCase()=="BASIC"){
mtc=true;
mtco="google.maps.MapTypeControlStyle.HORIZONTAL_BAR";
}else{
if(_41f&&_41f.toUpperCase()=="ADVANCED"){
mtc="true";
mtco=google.maps.MapTypeControlStyle.DROPDOWN_MENU;
}
}
if(_41e){
_431.push("overviewMapControl");
}
var zc=false;
var zco="";
if(_420!=null&&_420!="undefined"){
_420=_420.toUpperCase();
switch(_420){
case "SMALL":
zco=google.maps.ZoomControlStyle.SMALL;
zc=true;
break;
case "SMALL3D":
zco=google.maps.ZoomControlStyle.SMALL;
zc=true;
break;
case "LARGE":
zco=google.maps.ZoomControlStyle.LARGE;
zc=true;
break;
case "LARGE3D":
zco=google.maps.ZoomControlStyle.LARGE;
zc=true;
break;
}
}
var _436=[];
for(i=0;i<_42d.markerItems.length;i++){
var _437=$MAP.parseMarker(_42d.markerItems[i],_40f);
_436.push(_437);
}
if(_424==null||typeof _424==="undefined"){
_424="";
}
var _438={marker:{title:_424,iscenter:true}};
if(_42d.markerColor!=null&&typeof _42d.markerColor!="undefined"){
_438.marker.markercolor=_42d.markerColor;
}else{
if(_42d.markerIcon!=null&&typeof _42d.markerIcon!="undefined"){
_438.marker.markericon=_42d.markerIcon;
}
}
if(_42a===true){
_438.listeners={click:$MAP.markerOnClickHandler};
if(_42c!=null){
_438.marker.markerwindowcontent=_42c;
}else{
_438.marker.bindcallback=_42b;
}
_438.marker.name=_40f;
}
if(_42d.centerAddress!=null&&typeof _42d.centerAddress==="string"){
_438.geoCodeAddr=_42d.centerAddress;
_438.marker.address=_42d.centerAddress;
}else{
_438.lat=_42d.centerLatitude;
_438.lng=_42d.centerLongitude;
_438.marker.address=_42d.centerAddress;
}
var _439=false;
if(_41f!=null&&typeof _41f=="string"&&_41f.toUpperCase()=="ADVANCED"){
_439=true;
}
var _43a=new Ext.ux.GMapPanel({xtype:"gmappanel",region:"center",zoomLevel:_42d.zoomLevel,gmapType:_42d.type,mapConfOpts:_42f,mapControls:_431,setCenter:_438,markers:_436,border:!_42d.hideBorders,onLoadhandler:$MAP.onLoadCompleteHandler,onErrorhandler:_429,name:_42d.divName,noCenterMarker:!_41c,showAllMarker:_41d,advanceMapTypeControl:_439,initShow:_416,zc:zc,zco:zco,mtc:mtc,mtco:mtco,swz:swz});
_42e.add(_43a);
_42d.mapPanelObject=_43a;
if(_416===false){
_42e.hide();
}else{
_42e.updateLayout();
}
ColdFusion.Log.info("map.initialized","widget",[_40f]);
return _42e;
};
$MAP.addMarker=function(name,_43c){
var _43d=$MAP.getMapPanelObject(name);
var _43e=$MAP.parseMarker(_43c,name);
var _43f=[];
_43f.push(_43e);
_43d.addMarkers(_43f);
ColdFusion.Log.info("map.addmarker.markeradded","widget",[name,_43f.length]);
};
$MAP.setCenter=function(name,_441){
var _442=$MAP.getMapPanelObject(name);
var lat;
var lng;
if(_441.latitude&&_441.longitude){
if(typeof _441.latitude!="number"||typeof _441.longitude!="number"){
ColdFusion.handleError(null,"map.setcenter.latlngnonnumeric","widget",[name,_441.latitude,_441.longitude],null,null,true);
}else{
lat=_441.latitude;
lng=_441.longitude;
}
var _445=new google.maps.LatLng(lat,lng);
_442.getMap().setCenter(_445,_442.zoomLevel);
var _446={};
_446.markercolor="#00FF00";
_442.addMarker(new google.maps.LatLng(_441.latitude,_441.longitude),_446,null,true);
}else{
if(_441.address){
if(typeof _441.address!="string"){
ColdFusion.handleError(null,"map.setcenter.addressnotstring","widget",[name,_441.address],null,null,true);
}else{
_442.geoCodeLookup(_441.address,null,null,true);
}
}else{
ColdFusion.handleError(null,"map.setcenter.invalidcenter","widget",[name],null,null,true);
}
}
ColdFusion.Log.info("map.setcenter.centerset","widget",[name]);
};
$MAP.getLatitudeLongitude=function(_447,_448){
geocoder=new google.maps.Geocoder();
if(_448==null||!typeof _448==="function"){
_448=$MAP.LatitudeLongitudeHandler;
}
geocoder.geocode({"address":_447},_448);
};
$MAP.addEvent=function(name,_44a,_44b,_44c){
if(_44a=="singlerightclick"){
_44a="rightclick";
}
if(_44a=="maptypechanged"){
_44a="maptypeid_changed";
}
var _44d=$MAP.getMapPanelObject(name);
_44d.addEventToMap(_44a,_44b,_44c);
};
$MAP.setZoomLevel=function(name,_44f){
var _450=$MAP.getMapPanelObject(name);
_450.zoomLevel=_44f;
_450.getMap().setZoom(_44f);
};
$MAP.getMapObject=function(name){
var _452=$MAP.getMapPanelObject(name);
if(_452!=null){
return _452.getMap();
}
};
$MAP.parseMarker=function(_453,_454){
var _455={};
if(_453.latitude&&_453.longitude){
if(typeof _453.latitude!="number"||typeof _453.longitude!="number"){
ColdFusion.handleError(null,"map.marker.latlngnonnumeric","widget",[_453.latitude,_453.longitude],null,null,true);
}else{
_455.lat=_453.latitude;
_455.lng=_453.longitude;
}
}else{
if(_453.address!=null){
if(typeof _453.address!="string"){
ColdFusion.handleError(null,"map.marker.addressnotstring","widget",[_453.address],null,null,true);
}else{
_455.address=_453.address;
}
}
}
var _456={};
if(_453.tip==null){
_456.title="";
}else{
_456.title=_453.tip;
}
if(_453.markercolor!=null&&typeof _453.markercolor!="undefined"){
_456.markercolor=_453.markercolor;
}else{
if(_453.markericon!=null&&typeof _453.markericon!="undefined"){
_456.markericon=_453.markericon;
}
}
if(_453.showmarkerwindow===true||_453.markerwindowcontent!=null){
var _457=ColdFusion.objectCache[_454];
var _458;
if(_457!=null||typeof (_457)!="undefined"){
_458=_457.markerBindListener;
}
if(_458!=null||_453.markerwindowcontent!=null){
_455.listeners={click:$MAP.markerOnClickHandler};
if(_453.markerwindowcontent!=null){
_456.markerwindowcontent=_453.markerwindowcontent;
}else{
_456.bindcallback=_458;
}
_456.name=_453.name;
}
}
_455.marker=_456;
return _455;
};
$MAP.onErrorHandler=function(name,_45a){
var _45b=ColdFusion.objectCache[name];
var _45c=$MAP.statusCodeObject;
var _45d=$MAP.retrieveStatueMessage(_45a);
var _45e=_45b.onError;
if(_45e!=null&&typeof _45e==="function"){
_45e.call(null,_45a,_45d);
}else{
alert("Error: "+_45d);
}
ColdFusion.handleError(null,"map.loadMap.error","map",[name,_45a,_45d],null,null,true);
};
$MAP.onLoadCompleteHandler=function(name){
var _460=ColdFusion.objectCache[name];
var _461=_460.onLoad;
if(_461!=null&&typeof _461==="function"){
_461.call();
}
};
$MAP.retrieveStatueMessage=function(code){
var _463;
switch(code){
case "ZERO_RESULTS":
_463=$MAP.statusCodeObject.code602;
break;
case "OVER_QUERY_LIMIT":
_463=$MAP.statusCodeObject.code620;
break;
case "REQUEST_DENIED":
_463=$MAP.statusCodeObject.code610;
break;
case "INVALID_REQUEST":
_463=$MAP.statusCodeObject.code610;
break;
}
return _463;
};
var currentopenwindow="";
$MAP.markerOnClickHandler=function(_464){
coldFusion_markerObjCache[this.name]=this.scope.marker;
if(this.bindcallback!=null&&typeof this.bindcallback=="function"){
var _465=this.address;
if(_465==null||typeof _465=="undefined"){
_465="";
}
this.bindcallback.call(null,this.name,_464.latLng.lat(),_464.latLng.lng(),_465);
}else{
if(this.scope.statictext!=null&&typeof this.scope.statictext!="undefined"){
var me=this,infoWindow=new google.maps.InfoWindow({content:this.scope.statictext,position:this.scope.marker.position});
if(currentopenwindow!=""){
currentopenwindow.close();
}
infoWindow.open(this.scope.marker.map);
currentopenwindow=infoWindow;
}
}
};
ColdFusion.Map.loadMarkerWindowInfo=function(data,_468){
var _469=coldFusion_markerObjCache[_468._cf_marker_name];
var me=this,infoWindow=new google.maps.InfoWindow({content:data,position:_469.position});
if(currentopenwindow!=""){
currentopenwindow.close();
}
infoWindow.open(_469.map);
currentopenwindow=infoWindow;
};
ColdFusion.Map.bindOnErrorHandler=function(data,_46c){
ColdFusion.handleError(null,"map.markerbind.binderror","widget",[data],null,null,true);
};
$MAP.getMapPanelObject=function(name){
var _46e=ColdFusion.objectCache[name];
if(_46e==null||typeof (_46e)=="undefined"){
ColdFusion.handleError(null,"map.getmappanelobject.notfound","widget",[name],null,null,true);
}
return _46e.mapPanelObject;
};
$MAP.refresh=function(name){
var _470=ColdFusion.objectCache[name];
if(_470==null||typeof (_470)=="undefined"){
ColdFusion.handleError(null,"map.refresh.notfound","widget",[name],null,null,true);
}
_470.mapPanel.updateLayout();
};
$MAP.hide=function(name){
var _472=ColdFusion.objectCache[name];
if(_472==null||typeof (_472)=="undefined"){
ColdFusion.handleError(null,"map.hide.notfound","widget",[name],null,null,true);
}
_472.mapPanel.hide();
};
$MAP.show=function(name){
var _474=ColdFusion.objectCache[name];
if(_474==null||typeof (_474)=="undefined"){
ColdFusion.handleError(null,"map.show.notfound","widget",[name],null,null,true);
}
_474.mapPanel.show();
_474.mapPanel.updateLayout();
};
