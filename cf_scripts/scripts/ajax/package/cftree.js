/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
if(!ColdFusion.Tree){
ColdFusion.Tree={};
}
ColdFusion.Tree.AttributesCollection=function(){
this.cache=true;
this.fontname=null;
this.bold=false;
this.italic=false;
this.completepath=false;
this.appendkey=false;
this.delimiter=null;
this.formname=null;
this.fontsize=null;
this.formparamname=null;
this.prevspanid=null;
this.prevspanbackground=null;
this.images={};
this.images.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderClose.gif";
this.images.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.images.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.images.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.images.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.images.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.images.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.images.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.imagesopen={};
this.imagesopen.folder=_cf_ajaxscriptsrc+"/resources/cf/images/FolderOpen.gif";
this.imagesopen.cd=_cf_ajaxscriptsrc+"/resources/cf/images/Cd.png";
this.imagesopen.computer=_cf_ajaxscriptsrc+"/resources/cf/images/Computer.png";
this.imagesopen.document=_cf_ajaxscriptsrc+"/resources/cf/images/Document.gif";
this.imagesopen.element=_cf_ajaxscriptsrc+"/resources/cf/images/Elements.png";
this.imagesopen.floppy=_cf_ajaxscriptsrc+"/resources/cf/images/Floppy.png";
this.imagesopen.fixed=_cf_ajaxscriptsrc+"/resources/cf/images/HardDrive.png";
this.imagesopen.remote=_cf_ajaxscriptsrc+"/resources/cf/images/NetworkDrive.png";
this.eventcount=0;
this.eventHandlers=new Array();
this.nodeCounter=0;
};
ColdFusion.Tree.refresh=function(_387){
var tree=ColdFusion.objectCache[_387];
var _389=ColdFusion.objectCache[_387+"collection"];
if(!tree||YAHOO.widget.TreeView.prototype.isPrototypeOf(tree)==false){
ColdFusion.handleError(null,"tree.refresh.notfound","widget",[_387],null,null,true);
return;
}
if(!_389.dynLoadFunction){
ColdFusion.Log.info("tree.refresh.statictree","widget");
return;
}
_389.dynLoadFunction.call(null,tree.getRoot());
ColdFusion.Log.info("tree.refresh.success","widget",[_387]);
};
ColdFusion.Tree.getTreeObject=function(_38a){
if(!_38a){
ColdFusion.handleError(null,"tree.gettreeobject.emptyname","widget",null,null,null,true);
return;
}
var _38b=ColdFusion.objectCache[_38a];
if(_38b==null||YAHOO.widget.TreeView.prototype.isPrototypeOf(_38b)==false){
ColdFusion.handleError(null,"tree.gettreeobject.notfound","widget",[_38a],null,null,true);
return;
}
return _38b;
};
ColdFusion.Tree.loadNodes=function(_38c,_38d){
var i=0;
var _38f=ColdFusion.objectCache[_38d.treeid+"collection"];
var tree=ColdFusion.objectCache[_38d.treeid];
var _391;
var _392=false;
if(_38c&&typeof (_38c.length)=="number"&&!_38c.toUpperCase){
if(_38c.length>0&&typeof (_38c[0])!="object"){
_392=true;
}
}else{
_392=true;
}
if(_392){
ColdFusion.handleError(tree.onbinderror,"tree.loadnodes.invalidbindvalue","widget",[_38d.treeid]);
return;
}
if(_38d.parent&&!_38d.parent.isRoot()){
tree.removeChildren(_38d.parent);
}else{
if(_38d.parent&&_38d.parent.hasChildren()){
tree.removeChildren(_38d.parent);
_38d.parent=tree.getRoot();
}
}
if(!_38d.parent.leafnode){
for(i=0;i<_38c.length;i++){
var _393=_38f.nodeCounter++;
var node={};
node.id=_38c[i].VALUE;
if(typeof (_38c[i].DISPLAY)==undefined||_38c[i].DISPLAY==null){
node.label=_38c[i].VALUE;
}else{
node.label=_38c[i].DISPLAY;
}
node.expand=_38c[i].EXPAND;
node.appendkey=_38c[i].APPENDKEY;
node.href=_38c[i].HREF;
node.img=_38c[i].IMG;
node.imgOpen=_38c[i].IMGOPEN;
node.imgid="_cf_image"+_393;
node.spanid="_cf_span"+_393;
node.target=_38c[i].TARGET;
if(_38f.appendkey&&_38f.appendkey==true&&node.href){
var _395=new String(node.href);
_395=_395.toLowerCase();
if(_395.indexOf("javascript")<0){
if(_395.indexOf("?")>=0){
node.href=_38c[i].HREF+"&";
}else{
node.href=_38c[i].HREF+"?";
}
node.href=node.href+"CFTREEITEMKEY="+node.id;
}
}
var _396="";
if(node.img){
if(_38f.images[node.img]){
_396="<img src='"+_38f.images[node.img]+"' id='"+node.imgid+"' style='border:0'/>&nbsp;";
}else{
_396="<img src='"+node.img+"' id='"+node.imgid+"' style='border:0'/>&nbsp;";
}
}
if(_38f.fontname||_38f.italic==true||_38f.bold==true||_38f.fontsize){
_396=_396+"<span id='"+node.spanid+"' style='";
if(_38f.fontname){
_396=_396+"font-family:"+_38f.fontname+";";
}
if(_38f.italic==true){
_396=_396+"font-style:italic;";
}
if(_38f.bold==true){
_396=_396+"font-weight:bold;";
}
if(_38f.fontsize){
_396=_396+"font-size:"+_38f.fontsize+";";
}
_396=_396+"'>"+node.label+"</span>";
node.label=_396;
}else{
node.label=_396+"<span id='"+node.spanid+"'  >"+node.label+"</span>";
}
node.childrenFetched=false;
var _397=new YAHOO.widget.TextNode(node,_38d.parent,false);
var _398=false;
if(_38c[i].LEAFNODE&&_38c[i].LEAFNODE==true){
_398=true;
_397.leafnode=true;
_397.iconMode=1;
}
if(_398==true||(node.expand&&node.expand==true)){
_397.expand();
}
}
}
if(!_38d.parent.isRoot()){
_38d.parent.data.childrenFetched=true;
}
if(_38d.onCompleteCallBack){
_38d.onCompleteCallBack.call();
}else{
_38d.parent.tree.draw();
}
ColdFusion.Log.info("tree.loadnodes.success","widget",[_38d.treeid]);
};
ColdFusion.Tree.onExpand=function(node){
if(node.isRoot()){
return;
}
var _39a=ColdFusion.objectCache[node.tree.id+"collection"];
if(node.data.imgOpen&&typeof (node.leafnode)=="undefined"){
var _39b=ColdFusion.DOM.getElement(node.data.imgid,node.tree.id);
var src;
if(_39a.imagesopen[node.data.imgOpen]){
src=_39a.imagesopen[node.data.imgOpen];
}else{
src=node.data.imgOpen;
}
_39b.src=src;
}
if(_39a.cache==false&&node.data.childrenFetched==false&&_39a.dynLoadFunction){
node.tree.removeChildren(node);
}
};
ColdFusion.Tree.onCollapse=function(node){
if(node.isRoot()){
return;
}
var _39e=ColdFusion.objectCache[node.tree.id+"collection"];
if(node.data.img){
var _39f=ColdFusion.DOM.getElement(node.data.imgid,node.tree.id);
var src;
if(_39e.images[node.data.img]){
src=_39e.images[node.data.img];
}else{
src=node.data.img;
}
_39f.src=src;
}
node.data.childrenFetched=false;
};
ColdFusion.Tree.formPath=function(node,_3a2){
var _3a3=ColdFusion.objectCache[node.tree.id+"collection"];
if(_3a3.completepath==true&&node.isRoot()){
return "";
}else{
if(_3a3.completepath==false&&node.parent.isRoot()){
return "";
}
}
if(!_3a2){
_3a2=node;
}
var _3a4=ColdFusion.Tree.formPath(node.parent,_3a2);
_3a4=_3a4+node.data.id;
if(_3a2.data.id!=node.data.id){
_3a4=_3a4+_3a3.delimiter;
}
return _3a4;
};
ColdFusion.Tree.onLabelClick=function(node){
var _3a6="";
var _3a7=ColdFusion.objectCache[node.tree.id+"collection"];
var _3a6=ColdFusion.Tree.formPath(node);
if(_3a7.prevspanid){
var _3a8=ColdFusion.DOM.getElement(_3a7.prevspanid,node.tree.id);
if(_3a8.style){
_3a8.style.backgroundColor=_3a7.prevspanbackground;
}
}
var _3a9=ColdFusion.DOM.getElement(node.data.spanid,node.tree.id);
if(_3a9&&_3a9.style){
_3a7.prevspanbackground=_3a9.style.backgroundColor;
}
_3a9.style.backgroundColor="lightblue";
_3a7.prevspanid=node.data.spanid;
node.tree._cf_path=_3a6;
node.tree._cf_node=node.data.id;
var val="PATH="+_3a6+"; NODE="+node.data.id;
updateHiddenValue(val,_3a7.formname,_3a7.formparamname);
ColdFusion.Tree.fireSelectionChangeEvent(node.tree.id,_3a7.formname);
};
ColdFusion.Tree.fireSelectionChangeEvent=function(id,_3ac){
ColdFusion.Log.info("tree.fireselectionchangeevent.fire","widget",[id]);
ColdFusion.Event.callBindHandlers(id,_3ac,"change");
};
ColdFusion.Tree.getObject=function(_3ad){
var _3ae={};
_3ae.id=_3ad.value;
if(_3ad.href&&_3ad.href!="null"){
_3ae.href=_3ad.href;
}
_3ae.target=_3ad.target;
_3ae.label=_3ad.label;
_3ae.display=_3ad.display;
_3ae.img=_3ad.img;
_3ae.imgOpen=_3ad.imgOpen;
_3ae.imgid=_3ad.imgid;
_3ae.spanid=_3ad.spanid;
_3ae.childrenfetched=_3ad.childrenfetched;
return _3ae;
};
ColdFusion.Tree.initializeTree=function(_3af,_3b0,_3b1,bold,_3b3,_3b4,_3b5,_3b6,_3b7,_3b8,_3b9,_3ba){
var _3bb=new YAHOO.widget.TreeView(_3af);
_3bb.subscribe("expand",ColdFusion.Tree.onExpand);
_3bb.subscribe("collapse",ColdFusion.Tree.onCollapse);
_3bb.subscribe("labelClick",ColdFusion.Tree.onLabelClick);
_3bb._cf_getAttribute=function(_3bc){
_3bc=_3bc.toUpperCase();
if(_3bc=="PATH"){
return _3bb._cf_path;
}else{
if(_3bc=="NODE"){
return _3bb._cf_node;
}else{
return null;
}
}
};
_3bb.onbinderror=_3b8;
ColdFusion.objectCache[_3af]=_3bb;
var _3bd=new ColdFusion.Tree.AttributesCollection();
_3bd.cache=_3b0;
_3bd.italic=_3b1;
_3bd.bold=bold;
_3bd.completepath=_3b3;
_3bd.delimiter=_3b5;
_3bd.appendkey=_3b4;
_3bd.formname=_3b6;
_3bd.formparamname=_3b7;
_3bd.fontsize=_3b9;
_3bd.fontname=_3ba;
ColdFusion.objectCache[_3af+"collection"]=_3bd;
ColdFusion.Log.info("tree.initializetree.success","widget",[_3af]);
return _3bb;
};
