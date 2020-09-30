/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Calendar){
ColdFusion.Calendar={};
}
ColdFusion.Calendar.monthNamesShort=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
ColdFusion.Calendar.monthNamesLong=new Array("January","February","March","April","May","June","July","August","September","October","November","December");
ColdFusion.Calendar.dayNamesShort=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat");
ColdFusion.Calendar.dayNamesLong=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
ColdFusion.Calendar.calTableIdCounter=0;
if(navigator.userAgent.toLowerCase().indexOf("safari")>-1){
var set_month=Date.prototype.setMonth;
Date.prototype.setMonth=function(num){
if(num<=-1){
var n=Math.ceil(-num);
var _3c0=Math.ceil(n/12);
var _3c1=(n%12)?12-n%12:0;
this.setFullYear(this.getFullYear()-_3c0);
return set_month.call(this,_3c1);
}else{
return set_month.apply(this,arguments);
}
};
}
if(!String.escape){
String.escape=function(_3c2){
return _3c2.replace(/('|\\)/g,"\\$1");
};
}
ColdFusion.Calendar.setUpCalendar=function(_3c3,mask,_3c5,_3c6,_3c7,_3c8,_3c9){
var _3ca=ColdFusion.DOM.getElement(_3c3+_3c8+"_cf_button",_3c8);
var _3cb=ColdFusion.DOM.getElement(_3c3,_3c8);
var _3cc=null;
var _3cd=null;
if(_3cb.value!=""){
_3cc=_3cb.value;
_3cd=_3cc.split("/");
}
var _3ce=_3c3+"_cf_calendar"+ColdFusion.Calendar.calTableIdCounter;
ColdFusion.Calendar.calTableIdCounter++;
var _3cf=ColdFusion.DOM.getElement(_3c3+_3c8+"_cf_container",_3c8);
var _3d0=_3cb.offsetLeft;
ColdFusion.DOM.getElement(_3c3+_3c8+"_cf_container",_3c8).style.left=_3d0;
YAHOO.widget.Calendar.IMG_ROOT=_cf_ajaxscriptsrc+"/resources/yui/";
var _3d1;
if(_3cd&&_3cd[0]&&_3cd[2]){
_3d1=new YAHOO.widget.Calendar(_3ce,_3c3+_3c8+"_cf_container",{close:true,pagedate:_3cd[0]+"/"+_3cd[2]});
}else{
_3d1=new YAHOO.widget.Calendar(_3ce,_3c3+_3c8+"_cf_container",{close:true});
}
_3d1.calendarinputid=_3c3;
_3d1.calendarinput=_3cb;
_3d1.mask=mask;
_3d1.formname=_3c8;
_3d1.cfg.setProperty("MONTHS_LONG",_3c7);
_3d1.cfg.setProperty("WEEKDAYS_SHORT",_3c6);
_3d1.cfg.setProperty("START_WEEKDAY",_3c5);
ColdFusion.objectCache[_3ce+_3c8]=_3d1;
_3d1.select(_3cc);
_3d1.render();
_3d1.hide();
_3d1.selectEvent.subscribe(ColdFusion.Calendar.handleDateSelect,_3d1,true);
YAHOO.util.Event.addListener(_3c3+_3c8+"_cf_button","click",ColdFusion.Calendar.handleCalendarLinkClick,_3d1,true);
if(_3c9!=null){
var year=_3c9.year;
var _3d3=_3c9.month;
var day=_3c9.day;
var _3d5=new Date(year,_3d3.valueOf()-1,day);
_3cb.value=ColdFusion.Calendar.createFormattedOutput(_3c3,mask,year,_3d3,day,_3d5);
}
};
ColdFusion.Calendar.openedCalendarInstance=null;
ColdFusion.Calendar.handleCalendarLinkClick=function(type,args){
var _3d8=args;
if(ColdFusion.Calendar.openedCalendarInstance){
ColdFusion.Calendar.openedCalendarInstance.hide();
}
if(!_3d8.extMask){
var _3d9=ColdFusion.Calendar.convertToExtMask(_3d8.mask);
_3d8.extMask=_3d9;
}
var _3da=ColdFusion.DOM.getElement(args.calendarinputid,_3d8.formname).value;
var _3db=null;
if(typeof (_3da)!="undefined"&&ColdFusion.trim(_3da)!=""){
_3db=Ext.Date.parse(_3da,_3d8.extMask);
}
if(_3db!=null){
_3d8.setMonth(_3db.getMonth());
_3d8.setYear(_3db.getFullYear());
_3d8.select(_3db);
_3d8.render();
}
ColdFusion.Calendar.openedCalendarInstance=_3d8;
_3d8.show();
};
ColdFusion.Calendar.handleDateSelect=function(type,args,_3de){
var _3df=args[0];
var date=_3df[0];
var year=date[0],month=date[1],day=date[2];
var _3e2=new Date(year,month.valueOf()-1,day);
var _3e3=_3de.calendarinput.value;
_3de.calendarinput.value=ColdFusion.Calendar.createFormattedOutput(_3de.calendarinputid,_3de.mask,year,month,day,_3e2);
ColdFusion.Event.callBindHandlers(_3de.calendarinputid,null,"change");
_3de.hide();
var node=document.getElementById(_3de.calendarinputid);
if(node){
if(node.onchange){
if(node.value!=_3e3){
node.onchange();
}
}
}
};
ColdFusion.Calendar.convertToExtMask=function(mask){
mask=mask.toUpperCase();
if(mask.indexOf("DD")!=-1){
mask=mask.replace(/DD/g,"d");
}
if(mask.indexOf("D")!=-1){
mask=mask.replace(/D/g,"d");
}
if(mask.indexOf("MMMM")!=-1){
mask=mask.replace(/MMMM/g,"F");
}else{
if(mask.indexOf("MMM")!=-1){
mask=mask.replace(/MMM/g,"M");
}else{
if(mask.indexOf("MM")!=-1){
mask=mask.replace(/MM/g,"m");
}else{
if(mask.indexOf("M")!=-1){
mask=mask.replace(/M/g,"m");
}
}
}
}
if(mask.indexOf("YYYY")!=-1){
mask=mask.replace(/YYYY/g,"Y");
}
if(mask.indexOf("YY")!=-1){
mask=mask.replace(/YY/g,"y");
}
if(mask.indexOf("EEEE")!=-1){
mask=mask.replace(/EEEE/g,"l");
}
if(mask.indexOf("EEE")!=-1){
mask=mask.replace(/EEE/g,"D");
}
if(mask.indexOf("E")!=-1){
mask=mask.replace(/E/g,"w");
}
return mask;
};
ColdFusion.Calendar.createFormattedOutput=function(_3e6,mask,year,_3e9,day,date){
mask=mask.toUpperCase();
year=new String(year);
_3e9=new String(_3e9);
day=new String(day);
var _3ec=date.getDay();
if(mask.indexOf("DD")!=-1){
if(day.length==1){
day="0"+day;
}
mask=mask.replace(/DD/g,day);
}
if(mask.indexOf("D"!=-1)){
if(day.length!=-1&&day.charAt(0)=="0"){
day=day.charAt(1);
}
mask=mask.replace(/D/g,day);
}
if(mask.indexOf("MMMM")!=-1){
_3e9=ColdFusion.Calendar.monthNamesLong[_3e9.valueOf()-1];
mask=mask.replace(/MMMM/g,_3e9);
}else{
if(mask.indexOf("MMM")!=-1){
_3e9=ColdFusion.Calendar.monthNamesShort[_3e9.valueOf()-1];
mask=mask.replace(/MMM/g,_3e9);
}else{
if(mask.indexOf("MM")!=-1){
if(_3e9.length==1){
_3e9="0"+_3e9;
}
mask=mask.replace(/MM/g,_3e9);
}else{
if(mask.indexOf("M")!=-1){
if(_3e9.length!=-1&&_3e9.charAt(0)=="0"){
_3e9=_3e9.charAt(1);
}
mask=mask.replace(/M/g,_3e9);
}
}
}
}
if(mask.indexOf("YYYY")!=-1){
mask=mask.replace(/YYYY/g,year);
}
if(mask.indexOf("YY")!=-1){
year=year.substring(2);
mask=mask.replace(/YY/g,year);
}
if(mask.indexOf("EEEE")!=-1){
_3ec=ColdFusion.Calendar.dayNamesLong[_3ec.valueOf()];
mask=mask.replace(/EEEE/g,_3ec);
}
if(mask.indexOf("EEE")!=-1){
_3ec=ColdFusion.Calendar.dayNamesShort[_3ec.valueOf()];
mask=mask.replace(/EEE/g,_3ec);
}
if(mask.indexOf("E")!=-1){
_3ec=_3ec.valueOf();
_3ec=new String(_3ec);
if(_3ec.length!=-1&&_3ec.charAt(0)=="0"&&_3ec.charAt(1)){
_3ec=_3ec.charAt(1);
}
mask=mask.replace(/E/g,_3ec);
}
return mask;
};
