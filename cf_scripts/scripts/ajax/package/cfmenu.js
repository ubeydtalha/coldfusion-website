/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Menu){
ColdFusion.Menu={};
}
ColdFusion.Menu.menuItemMouseOver=function(id,_29e){
var _29f=document.getElementById(id);
_29f.tempfontcolor=_29f.firstChild.style.color;
if(_29e){
_29f.firstChild.style.color=_29e;
}
};
ColdFusion.Menu.menuItemMouseOut=function(id){
var _2a1=document.getElementById(id);
if(_2a1.tempfontcolor){
_2a1.firstChild.style.color=_2a1.tempfontcolor;
}else{
_2a1.firstChild.style.color="black";
}
};
ColdFusion.Menu.initMenu=function(_2a2,_2a3){
return new YAHOO.widget.Menu(_2a2,_2a3);
};
ColdFusion.Menu.initMenuBar=function(_2a4,_2a5){
return new YAHOO.widget.MenuBar(_2a4,_2a5);
};
