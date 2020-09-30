/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
cfinitgrid=function(){
Ext.override(Ext.form.field.Number,{decimalPrecision:6});
if(!ColdFusion.Grid){
ColdFusion.Grid={};
}
var $G=ColdFusion.Grid;
if(!$G.GridBindelementsMap){
$G.GridBindelementsMap={};
}
var $L=ColdFusion.Log;
$G.init=function(id,_4,_5,_6,_7,_8,_9,_a,_b,_c,_d,_e,_f,_10,_11,_12,_13,_14,_15,_16,_17,_18,_19,_1a,_1b,_1c,_1d,_1e,_1f,_20){
var _21;
var _22;
var _23=false;
if(_14&&typeof (_14)!="undefined"){
_22=_14;
_23=true;
}else{
_22="rowmodel";
_22=new Ext.selection.RowModel({mode:"MULTI"});
}
var _24=_b;
var _25={store:_c,columns:_b,selModel:_22,autoSizeColumns:_9,autoSizeHeaders:_9,stripeRows:_f,autoExpandColumnId:_a};
if(_1e!=null&&typeof _1e!="undefined"){
_25.plugins=_1e;
}
var _26=ColdFusion.objectCache[id];
var _27=document.getElementById(_26.gridId);
if(_27!=null){
var _28=_27.style.cssText;
if(typeof _28=="undefined"){
_28="";
}
_28="width:"+_d+"px;"+_28;
_27.style.cssText=_28;
}
_25.width=_d;
if(_9===true){
_25.viewConfig={forceFit:true};
_25.forceFit=true;
}else{
if(_14&&typeof (_14)!="undefined"){
_25.autoExpandColumn=_a;
}else{
_25.autoExpandColumn=_a;
}
}
if(_e){
_25.height=_e;
}else{
_25.autoHeight=true;
var _29=".x-grid3-header {position: relative;}";
Ext.util.CSS.createStyleSheet(_29,"_cf_grid"+id);
}
if(_16&&typeof (_16)!="undefined"){
_25.features={ftype:"grouping",groupHeaderTpl:"{columnName}: {groupValue} ({rows.length} items)"};
}
_25.title=_17;
_25.collapsible=_15;
if(_15&&_17==null){
_25.title="  ";
}
var _2a=ColdFusion.objectCache[id];
_2a.bindOnLoad=_8;
_2a.dynamic=_6;
_2a.styles=_10;
_2a.grouping=_16;
_2a.onLoadFunction=_1d;
_2a.multiRowSelection=_23;
_25.renderTo=_2a.gridId;
Ext.onReady(function(){
_25.dockedItems={xtype:"toolbar",dock:"top"};
_25.tbar=new Ext.Toolbar({hidden:true});
if(_6){
_25.bbar=new Ext.PagingToolbar({pageSize:_11,store:_c});
if(_1b&&(_18||_19)){
var _2b=_25.bbar;
if(_18){
_2b.add({xtype:"button",text:_18,handler:$G.insertRow,scope:_2a});
_2b.add({xtype:"button",text:" save ",handler:$G.saveNewRecord,scope:_2a});
_2b.add({xtype:"button",text:" cancel ",handler:$G.cancelNewRecord,scope:_2a});
}
if(_19){
_2b.add({xtype:"button",text:_19,handler:$G.deleteRow,scope:_2a});
}
}
}
if(_7&&!_6){
var _2c=new Ext.Toolbar();
if(_18||_19){
if(_18){
_2c.add({xtype:"button",text:_18,handler:$G.insertRow,scope:_2a});
}
if(_19){
_2c.add({xtype:"button",text:_19,handler:$G.deleteRow,scope:_2a});
}
}else{
var _2c=new Ext.Toolbar({hidden:true});
}
_25.bbar=_2c;
}
_c.pageSize=_11;
var fn=function(){
_21=Ext.create("Ext.grid.Panel",_25);
$G.Ext_caseInsensitive_sorting();
_c.addListener("load",$G.Actions.onLoad,_2a,{delay:50});
_21.view.addListener("beforeshow",function(_2e){
var _2f=_24.getColumnCount();
for(var i=0;i<_2f;i++){
if("CFGRIDROWINDEX"==_24.getDataIndex(i)){
_2e.remove(_2e.items["items"][i]);
break;
}
}
},this);
_2a.grid=_21;
if(!_6){
_c.addListener("load",$G.Actions.onLoad,_2a,{delay:50});
_c.load();
}
if(_6){
_c._cf_errorHandler=_1c;
_c.proxy._cf_actions=_2a;
if(_2a.bindOnLoad){
_c.load({params:{start:0,limit:_11}});
}else{
_2a.bindOnLoad=true;
}
}else{
$G.applyStyles(_2a);
}
if(_1f){
ColdFusion.Bind.register(_1f,{actions:_2a},$G.bindHandler,false);
}
$L.info("grid.init.created","widget",[id]);
_2a.init(id,_4,_5,_1a,_6,_7,_1b,_1c,_13,_11,_12,_16);
};
if(_6&&_20){
setTimeout(fn,0);
}else{
fn();
}
});
};
$G.applyStyles=function(_31){
Ext.util.CSS.createStyleSheet(_31.styles);
_31.stylesApplied=true;
};
$G.bindHandler=function(e,_33){
$G.refresh(_33.actions.id,_33.actions.preservePageOnSort);
};
$G.bindHandler._cf_bindhandler=true;
$G.refresh=function(_34,_35){
var _36=ColdFusion.objectCache[_34];
if(_36&&$G.Actions.prototype.isPrototypeOf(_36)==true){
var _37=_36.grid.getStore();
if(_36.dynamic){
_36.editOldValue=null;
_36.selectedRow=-1;
var _38=$G.GridBindelementsMap[_34];
if(_38){
var url=_37.proxy.url;
var _3a=_38.split(";");
for(i=0;i<_3a.length;i++){
var _3b=_3a[i].split(",");
indx=url.indexOf(_3b[0]+"=");
url1=url.substring(0,indx);
nxtindx=url.indexOf("&",indx);
url2=url.substring(nxtindx);
var val=_3b[2];
var _3d="";
if(_3b[2]&&_3b[2].endsWith("()")){
val=_3b[2].substring(0,val.length-2);
_3d=window[val]();
}else{
_3d=ColdFusion.Bind.getBindElementValue(_3b[1],val,_3b[3]);
}
url=url1+"&"+_3b[0]+"="+_3d+url2;
}
_37.proxy.url=url;
}
if(_35){
_37.lastOptions.page=1;
_37.currentPage=1;
_37.reload();
}else{
if(_37.lastOptions){
_37.lastOptions.page=1;
}
_37.currentPage=1;
_37.reload({params:{start:0,limit:_36.pageSize}});
}
}
}else{
ColdFusion.handleError(null,"grid.refresh.notfound","widget",[_34],null,null,true);
return;
}
if(_36.multiRowSelection){
}
$L.info("grid.refresh.success","widget",[_34]);
};
$G.Ext_caseInsensitive_sorting=function(){
Ext.data.Store.prototype.sortData=function(f,_3f){
_3f=_3f||"ASC";
var st=this.fields.get(f).sortType;
var fn=function(r1,r2){
var v1=st(r1.data[f]),v2=st(r2.data[f]);
if(v1.toLowerCase){
v1=v1.toLowerCase();
v2=v2.toLowerCase();
}
return v1>v2?1:(v1<v2?-1:0);
};
this.data.sort(_3f,fn);
if(this.snapshot&&this.snapshot!=this.data){
this.snapshot.sort(_3f,fn);
}
};
};
$G.getTopToolbar=function(_45){
var _46=ColdFusion.objectCache[_45];
if(!_46){
ColdFusion.handleError(null,"grid.getTopToolbar.notfound","widget",[_45],null,null,true);
return;
}
return _46.grid.getDockedItems()[1];
};
$G.showTopToolbar=function(_47){
var _48=ColdFusion.objectCache[_47];
if(!_48){
ColdFusion.handleError(null,"grid.showTopToolbar.notfound","widget",[_47],null,null,true);
return;
}
var _49=_48.grid.getDockedItems()[1];
if(!_49){
ColdFusion.handleError(null,"grid.showTopToolbar.toolbarNotDefined","widget",[_47],null,null,true);
return;
}
_49.show();
};
$G.hideTopToolbar=function(_4a){
var _4b=ColdFusion.objectCache[_4a];
if(!_4b){
ColdFusion.handleError(null,"grid.hideTopToolbar.notfound","widget",[_4a],null,null,true);
return;
}
var _4c=_4b.grid.getDockedItems()[1];
if(!_4c){
ColdFusion.handleError(null,"grid.hideTopToolbar.toolbarNotDefined","widget",[_4a],null,null,true);
return;
}
_4c.hide();
};
$G.refreshTopToolbar=function(_4d){
var _4e=ColdFusion.objectCache[_4d];
if(!_4e){
ColdFusion.handleError(null,"grid.refreshTopToolbar.notfound","widget",[_4d],null,null,true);
return;
}
var _4f=_4e.grid.getDockedItems()[1];
if(!_4f){
ColdFusion.handleError(null,"grid.refreshTopToolbar.toolbarNotDefined","widget",[_4d],null,null,true);
return;
}
_4f.doLayout();
if(_4f.isVisible()==false){
_4f.show();
}
};
$G.getBottomToolbar=function(_50){
var _51=ColdFusion.objectCache[_50];
if(!_51){
ColdFusion.handleError(null,"grid.getBottomToolbar.notfound","widget",[_50],null,null,true);
return;
}
return _51.grid.getDockedItems()[_51.grid.getDockedItems().length-1];
};
$G.showBottomToolbar=function(_52){
var _53=ColdFusion.objectCache[_52];
if(!_53){
ColdFusion.handleError(null,"grid.showBottomToolbar.notfound","widget",[_52],null,null,true);
return;
}
var _54=_53.grid.getDockedItems()[_53.grid.getDockedItems().length-1];
if(!_54){
ColdFusion.handleError(null,"grid.showBottomToolbar.toolbarNotDefined","widget",[_52],null,null,true);
return;
}
_54.show();
};
$G.hideBottomToolbar=function(_55){
var _56=ColdFusion.objectCache[_55];
if(!_56){
ColdFusion.handleError(null,"grid.hideBottomToolbar.notfound","widget",[_55],null,null,true);
return;
}
var _57=_56.grid.getDockedItems()[_56.grid.getDockedItems().length-1];
if(!_57){
ColdFusion.handleError(null,"grid.hideBottomToolbar.toolbarNotDefined","widget",[_55],null,null,true);
return;
}
_57.hide();
};
$G.refreshBottomToolbar=function(_58){
var _59=ColdFusion.objectCache[_58];
if(!_59){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.notfound","widget",[_58],null,null,true);
return;
}
var _5a=_59.grid.getDockedItems()[_59.grid.getDockedItems().length-1];
if(!_5a){
ColdFusion.handleError(null,"grid.refreshBottomToolbar.toolbarNotDefined","widget",[_58],null,null,true);
return;
}
_5a.doLayout();
if(_5a.isVisible()==false){
_5a.show();
}
};
$G.sort=function(_5b,_5c,_5d){
var _5e=ColdFusion.objectCache[_5b];
if(!_5e){
ColdFusion.handleError(null,"grid.sort.notfound","widget",[_5b],null,null,true);
return;
}
_5c=_5c.toUpperCase();
var _5f=-1;
var _60=_5e.grid.columns;
for(var i=0;i<_60.length-1;i++){
if(_5c==_60[i].colName){
_5f=i;
break;
}
}
if(_5f==-1){
ColdFusion.handleError(null,"grid.sort.colnotfound","widget",[_5c,_5b],null,null,true);
return;
}
if(!_5d){
_5d="ASC";
}
_5d=_5d.toUpperCase();
if(_5d!="ASC"&&_5d!="DESC"){
ColdFusion.handleError(null,"grid.sort.invalidsortdir","widget",[_5d,_5b],null,null,true);
return;
}
var _62=_5e.grid.getStore();
_62.sort(_5c,_5d);
};
$G.getGridObject=function(_63){
if(!_63){
ColdFusion.handleError(null,"grid.getgridobject.missinggridname","widget",null,null,null,true);
return;
}
var _64=ColdFusion.objectCache[_63];
if(_64==null||$G.Actions.prototype.isPrototypeOf(_64)==false){
ColdFusion.handleError(null,"grid.getgridobject.notfound","widget",[_63],null,null,true);
return;
}
return _64.grid;
};
$G.getSelectedRows=function(_65){
if(!_65){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _66=ColdFusion.objectCache[_65];
var _67=new Array();
var _68=_66.grid.getSelectionModel();
var _69=_68.selected;
var _6a=_66.grid.columns;
var _6b=0;
if(_66.multiRowSelection===true&&_66.dynamic===false){
_6b++;
}
for(i=0;i<_69.length;i++){
var _6c=_69.items[i].data;
var _6d={};
for(var _6e=_6b;_6e<_6a.length-1;_6e++){
var key=_6a[_6e].dataIndex;
_6d[key]=_6c[key];
}
_67[i]=_6d;
}
return _67;
};
$G.clearSelectedRows=function(_70){
if(!_70){
ColdFusion.handleError(null,"grid.getSelectedRowData.missinggridname","widget",null,null,null,true);
return;
}
var _71=ColdFusion.objectCache[_70];
var _72=_71.grid.getSelectionModel();
_72.deselectAll();
if(_71.multiRowSelection){
}
};
$G.Actions=function(_73){
this.gridId=_73;
this.init=$G.Actions.init;
this.onChangeHandler=$G.Actions.onChangeHandler;
this.onChangeHandler_MultiRowsDelete=$G.Actions.onChangeHandler_MultiRowsDelete;
this.selectionChangeEvent=new ColdFusion.Event.CustomEvent("cfGridSelectionChange",_73);
this.fireSelectionChangeEvent=$G.fireSelectionChangeEvent;
this._cf_getAttribute=$G.Actions._cf_getAttribute;
this._cf_register=$G.Actions._cf_register;
this.loaded=false;
};
$G.Actions.init=function(id,_75,_76,_77,_78,_79,_7a,_7b,_7c,_7d,_7e,_7f){
this.id=id;
this.gridName=_75;
this.formId=_76;
this.form=document.getElementById(_76);
this.cellClickInfo=_77;
this.edit=_79;
this.onChangeFunction=_7a;
this.onErrorFunction=_7b;
this.preservePageOnSort=_7c;
this.pageSize=_7d;
this.selectedRow=-1;
this.selectOnLoad=_7e;
this.grouping=_7f;
this.grid.addListener("cellclick",$G.cellClick,this,true);
this.editField=document.createElement("input");
this.editField.setAttribute("name",_75);
this.editField.setAttribute("type","hidden");
this.form.appendChild(this.editField);
if(_79){
if(!_78){
var _80=this.grid.columns;
this.editFieldPrefix="__CFGRID__EDIT__=";
var i=0;
var _82=_80.length-1;
if(this.multiRowSelection===true&&this.dynamic===false){
i++;
_82--;
}
this.editFieldPrefix+=_82+$G.Actions.fieldSep;
var _83=true;
for(i;i<_80.length-1;i++){
if(!_83){
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldPrefix+=_80[i].colName;
this.editFieldPrefix+=$G.Actions.valueSep;
if(_80[i].getEditor()){
this.editFieldPrefix+="Y";
}else{
this.editFieldPrefix+="N";
}
_83=false;
}
this.editFieldPrefix+=$G.Actions.fieldSep;
}
this.editFieldState=[];
this.editFieldState.length=this.grid.getStore().getTotalCount();
$G.Actions.computeEditField(this);
this.insertInProgress=false;
this.insertEvent=null;
this.grid.addListener("beforeedit",$G.Actions.beforeEdit,this);
this.grid.addListener("edit",$G.Actions.afterEdit,this,true);
}
if(_78){
this.grid.getStore().addListener("beforeload",$G.Actions.beforeLoad,this,true);
}
this.grid.getSelectionModel().addListener("select",$G.rowSelect,this,true);
this.grid.getSelectionModel().addListener("beforerowselect",$G.beforeRowSelect,this,true);
};
$G.Actions.beforeLoad=function(_84,_85){
var _86=_84.sortInfo;
var _87=(_85.sorters&&_85.sorters[0]&&_85.sorters[0].property!=this.sortCol);
if(_87&&!this.preservePageOnSort){
_85.start=0;
_85.page=1;
_84.currentPage=1;
}
if(_85.sorters&&_85.sorters[0]){
this.sortCol=_85.sorters[0].property;
this.sortDir=_85.sorters[0].direction;
}
};
$G.Actions.onLoad=function(_88){
this.editOldValue=null;
this.selectedRow=-1;
this.insertInProgress=false;
var _89=0;
if((this.bindOnLoad||!this.dynamic)&&this.selectOnLoad&&!this.grouping){
this.grid.getSelectionModel().select(_89,false);
}
if(!this.gridRendered&&this.onLoadFunction&&typeof this.onLoadFunction=="function"){
this.gridRendered=true;
this.onLoadFunction.call(null,this.grid);
}
$G.applyStyles(_88);
try{
var _8a=Ext.ComponentQuery.query("tabpanel");
if(_8a&&this.grid&&this.loaded==false){
for(var i=0;i<_8a.length;i++){
if(_8a[i].body.dom.innerHTML.indexOf(this.grid.id)>0){
_8a[i].updateLayout();
this.loaded=true;
}
}
}
}
catch(exception){
}
};
$G.Actions._cf_getAttribute=function(_8c){
_8c=_8c.toUpperCase();
var _8d=this.selectedRow;
var _8e=null;
if(_8d!=0&&(!_8d||_8d==-1)){
return _8e;
}
var ds=this.grid.getStore();
var _90=(this.dynamic)?ds.getAt(_8d):ds.getById(_8d);
_8e=_90.get(_8c);
return _8e;
};
$G.Actions._cf_register=function(_91,_92,_93){
this.selectionChangeEvent.subscribe(_92,_93);
};
$G.rowSelect=function(_94,_95,row){
var _97="";
var _98=_94.selected.items;
if(_98.length==0){
return;
}
var _99=_98[0].get("CFGRIDROWINDEX")||row;
if(_99&&(_99+"").indexOf("cf_gridmodel")==0){
_99=row;
}
if(this.selectedRow!=_99){
this.selectedRow=_99;
var _9a=true;
for(col in _98[0].data){
if(col=="CFGRIDROWINDEX"){
continue;
}
if(typeof col=="undefined"||col=="undefined"){
continue;
}
if(!_9a){
_97+="; ";
}
_97+="__CFGRID__COLUMN__="+col+"; ";
_97+="__CFGRID__DATA__="+_98[0].data[col];
_9a=false;
}
this.fireSelectionChangeEvent();
this.insertInProgress=false;
}
};
$G.beforeRowSelect=function(_9b,row){
var ds=this.grid.getStore();
var _9e=ds.getAt(row);
return !$G.isNullRow(_9e.data);
};
$G.isNullRow=function(_9f){
var _a0=true;
for(col in _9f){
if(_9f[col]!=null){
_a0=false;
break;
}
}
return _a0;
};
$G.fireSelectionChangeEvent=function(){
$L.info("grid.fireselectionchangeevent.fire","widget",[this.id]);
this.selectionChangeEvent.fire();
};
$G.cellClick=function(_a1,td,_a3,_a4,tr,_a6,e,_a8){
var _a9=this.cellClickInfo.colInfo[_a3];
if(_a9){
var _aa=_a1.getSelectionModel().selected;
var url;
if(_aa.items.length>0&&_aa.items[0].data){
url=_aa.items[0].data[_a9.href.toUpperCase()];
}
if(!url){
url=_a9.href;
}
var _ac=_a9.hrefKey;
var _ad=_a9.target;
var _ae=this.appendKey;
if(this.cellClickInfo.appendKey){
var _af;
if(_ac||_ac==0){
var _b0=_a1.getStore().getAt(_a6);
var _b1=_a1.panel.columns[_ac].dataIndex;
_af=_b0.get(_b1);
}else{
var _b2=this.grid.columns;
_af=_aa.items[0].get(_b2[0].dataIndex);
for(var i=1;i<_b2.length-1;i++){
_af+=","+_aa.items[0].get(_b2[i].dataIndex);
}
}
if(url.indexOf("?")!=-1){
url+="&CFGRIDKEY="+_af;
}else{
url+="?CFGRIDKEY="+_af;
}
}
if(_ad){
_ad=_ad.toLowerCase();
if(_ad=="_top"){
_ad="top";
}else{
if(_ad=="_parent"){
_ad="parent";
}else{
if(_ad=="_self"){
_ad=window.name;
}else{
if(_ad=="_blank"){
window.open(encodeURI(url));
return;
}
}
}
}
if(!parent[_ad]){
ColdFusion.handleError(null,"grid.cellclick.targetnotfound","widget",[_ad]);
return;
}
parent[_ad].location=encodeURI(url);
}else{
window.location=encodeURI(url);
}
}
};
$G.insertRow=function(){
if(this.insertInProgress&&this.dynamic){
ColdFusion.handleError(null,"Multiple row insert is not supported","Grid",[this.gridId],null,null,true);
return;
}
var _b4={action:"I",values:[]};
var _b5=this.grid.columns;
var _b6=this.grid.getStore();
var _b7={};
var _b8="{";
for(var i=0;i<_b5.length-1;i++){
var _ba="";
_b4.values[i]=[_ba,_ba];
_b7[_b5[i].dataIndex]=_ba;
_b8=_b8+"\""+_b5[i].colName+"\":\""+_ba+"\",";
}
_b7["CFGRIDROWINDEX"]=_b6.getCount()+1;
_b8=_b8+"\"CFGRIDROWINDEX\":\""+(_b6.getCount()+1)+"\"}";
_b6.add(JSON.parse(_b8));
_b6.getAt(_b6.getCount()-1).data["CFGRIDROWINDEX"]=_b6.getCount();
if(this.dynamic==true){
this.selectedRow=_b6.getCount();
}
this.editFieldState.push(_b4);
this.grid.getSelectionModel().select(_b6.getCount()-1);
this.insertInProgress=true;
$G.Actions.computeEditField(this);
};
$G.saveNewRecord=function(){
if(!this.insertInProgress){
return;
}
var _bb=this.selectedRow;
var _bc=this.insertEvent;
if(_bb==-1){
return;
}
if(this.onChangeFunction){
this.onChangeHandler("I",_bb-1,_bc,$G.insertRowCallback);
}else{
if(this.dynamic==false){
var _bd=this.grid.getStore();
var _be=_bc.record;
var _bf=new Array(1);
_bf[0]=_be;
var _c0=_bd.getAt(this.selectedRow-1);
_bd.remove(_c0);
_bd.add(_bf);
}
}
this.insertInProgress=false;
this.insertEvent=null;
};
$G.cancelNewRecord=function(){
if(!this.insertInProgress){
return;
}
this.editFieldState.pop();
var _c1=this.grid.getStore();
var _c2=_c1.getAt(this.selectedRow-1);
_c1.remove(_c2);
this.insertInProgress=false;
this.insertEvent=null;
this.selectedRow=this.selectedrow-1;
};
$G.deleteRow=function(){
var _c3=null;
var _c4;
if(this.multiRowSelection===true){
var _c5=this.grid.getSelectionModel();
_c3=_c5.selected;
}
_c3=this.grid.getSelectionModel().getSelection();
if(_c3!=null&&_c3.length<2){
_c3=null;
}
if(_c3==null){
_c4=this.selectedRow;
}
if(_c4==-1&&_c3==null){
return;
}
if(this.onChangeFunction){
if(_c3!=null){
this.onChangeHandler_MultiRowsDelete("D",_c3,null,$G.deleteRowCallback);
}else{
this.onChangeHandler("D",_c4,null,$G.deleteRowCallback);
}
}else{
if(!this.dynamic){
var _c6=this.grid.getStore();
if(_c3!=null){
for(i=0;i<_c3.length;i++){
var _c7=_c6.indexOf(_c3[i]);
var _c8=this.editFieldState[_c7];
if(_c8){
_c8.action="D";
}else{
_c8=$G.Actions.initEditState(this,"D",_c3[i],_c7+1);
}
}
for(i=0;i<_c3.length;i++){
_c6.remove(_c3[i]);
}
}else{
var _c8=this.editFieldState[_c4-1];
if(_c8){
_c8.action="D";
}else{
var _c9=this.grid.getStore().getById(_c4);
_c8=$G.Actions.initEditState(this,"D",_c9,_c4);
}
_c6.remove(this.grid.getSelectionModel().getSelection());
}
$G.Actions.computeEditField(this);
this.grid.editingPlugin.completeEdit();
this.selectedRow=-1;
}
}
};
$G.deleteRowCallback=function(_ca,_cb){
var _cc=_cb._cf_grid.getStore();
var _cd=_cb._cf_grid_properties;
var _cb=_cc.lastOptions;
var key="start";
if(_cc.getCount()==1){
if(_cb.start>=_cb.limit){
_cb.start=_cb.start-_cb.limit;
}
_cb.page=_cb.page-1;
_cc.reload(_cb);
}else{
_cc.reload();
}
if(_cd.multiRowSelection){
var _cf=_cd.grid.getView().headerCt(0);
if(_cf!=null){
var _d0=Ext.Element.get(_cf).first();
if(_d0){
_d0.replaceClass("x-grid3-hd-checker-on");
}
}
}
};
$G.insertRowCallback=function(_d1,_d2){
var _d3=_d2._cf_grid.getStore();
var _d4=_d2._cf_grid.actions;
_d3.reload();
};
$G.Actions.beforeEdit=function(_d5,e,_d7){
if($G.isNullRow(e.record.data)){
return false;
}
this.editColumn=e.column;
this.editOldValue=e.value;
};
$G.Actions.afterEdit=function(_d8,_d9,_da){
var _db=_d9.value;
if(_db==this.editOldValue){
return;
}
if(this.insertInProgress==false&&this.onChangeFunction){
this.onChangeHandler("U",this.selectedRow,_d9);
}else{
if(!this.dynamic){
rowidx=_d9.rowIdx;
if(!rowidx&&rowidx!=0){
rowidx=_d9.row;
}
var _dc=$G.computeActualRow_editField(this.editFieldState,_d9.record.data.CFGRIDROWINDEX);
var _dd=this.editFieldState[_dc-1];
var _de=_d9.colIdx;
if(!_de&&_de!=0){
_de=_d9.column;
}
_de=_de+1;
if(_dd){
if(this.multiRowSelection===true&&this.insertInProgress==true){
_de=_de-1;
}
_dd.values[_de][1]=_db;
}else{
var _df=this.grid.getStore().getById(_d9.record.data.CFGRIDROWINDEX);
_dd=$G.Actions.initEditState(this,"U",_df,_dc);
var _e0=this.editOldValue+"";
if(_d9.column.type=="date"){
if(_e0&&typeof _e0=="string"){
_e0=new Date(_e0);
}
var _e1="F, j Y H:i:s";
if(_d9.column&&_d9.column.format){
_e1=_d9.column.format;
}
_dd.values[_de][1]=Ext.Date.format(_db,_e1);
_dd.values[_de][0]=_e0?Ext.Date.format(_e0,_e1):_e0;
}else{
_dd.values[_de][0]=_e0;
_dd.values[_de][1]=_db;
}
}
$G.Actions.computeEditField(this);
}
}
this.editOldValue=null;
this.fireSelectionChangeEvent();
};
$G.computeActualRow_editField=function(_e2,_e3){
if(_e2.length==_e3){
return _e3;
}
var _e4=0;
var _e5=0;
for(;_e5<_e2.length&&_e4<_e3;_e5++){
var _e6=_e2[_e5];
if(!_e6||_e6.action!="D"){
_e4++;
}
}
return _e5;
};
$G.Actions.onChangeHandler=function(_e7,_e8,_e9,_ea){
var _eb={};
var _ec={};
var _ed="";
if(null==_e9){
_ed=this.grid.getStore().getAt(_e8).data;
}else{
_ed=_e9?_e9.record.data:this.grid.getStore().getAt(_e8).data;
}
for(col in _ed){
_eb[col]=_ed[col];
}
if(_e7=="U"){
if((_e9.value==null||_e9.value=="")&&(_e9.originalValue==null||_e9.originalValue=="")){
return;
}
if(_e9.value&&_e9.column.type=="date"){
if(typeof _e9.originalValue=="string"){
var _ee=new Date(_e9.originalValue);
}
if(_ee!=null&&_ee.getElapsed(_e9.value)==0){
return;
}else{
_eb[_e9.field]=_e9.originalValue;
var _ef="F, j Y H:i:s";
if(_e9.column.format){
_ef=_e9.column.format;
}
_ec[_e9.field]=Ext.Date.format(_e9.value,_ef);
}
}else{
_eb[_e9.field]=_e9.originalValue;
_ec[_e9.field]=_e9.value;
}
}
this.onChangeFunction(_e7,_eb,_ec,_ea,this.grid,this.onErrorFunction,this);
};
$G.Actions.onChangeHandler_MultiRowsDelete=function(_f0,_f1,_f2,_f3){
var _f4=new Array();
var _f5={};
for(i=0;i<_f1.length;i++){
_f4[i]=_f1.items[i].data;
}
this.onChangeFunction(_f0,_f4,_f5,_f3,this.grid,this.onErrorFunction,this);
};
$G.Actions.initEditState=function(_f6,_f7,_f8,_f9){
var _fa={action:_f7,values:[]};
var _fb=_f6.grid.columns;
var _fc=_fb.length-1;
_fa.values.length=_fc;
var i=0;
if(_f6.multiRowSelection===true&&_f6.dynamic===false){
i=i++;
}
for(i;i<_fc;i++){
var _fe=_f8.get(_fb[i].colName);
_fa.values[i]=[_fe,_fe];
}
_f6.editFieldState[_f9-1]=_fa;
return _fa;
};
$G.Actions.fieldSep=eval("'\\u0001'");
$G.Actions.valueSep=eval("'\\u0002'");
$G.Actions.nullValue=eval("'\\u0003'");
$G.Actions.computeEditField=function(_ff){
if(_ff.dynamic){
return;
}
var _100=_ff.editFieldPrefix;
var _101=_ff.editFieldState;
var _102=_ff.grid.columns;
var _103=0;
var _104="";
for(var i=0;i<_101.length;i++){
var _106=_101[i];
if(_106){
_103++;
_104+=$G.Actions.fieldSep;
_104+=_106.action+$G.Actions.valueSep;
var _107=_106.values;
if(_ff.multiRowSelection===true&&_ff.dynamic===false&&_106.action!="I"){
_107=_107.slice(1,_107.length);
}
for(var j=0;j<_107.length;j++){
if(j>0){
_104+=$G.Actions.valueSep;
}
var _109=($G.Actions.isNull(_107[j][0]))?$G.Actions.nullValue:_107[j][0];
var _10a=($G.Actions.isNull(_107[j][1]))?$G.Actions.nullValue:_107[j][1];
var _10b=j;
if(_ff.multiRowSelection===true){
_10b++;
}
if(_102[_10b].getEditor()&&_10a==$G.Actions.nullValue&&_102[_10b].getEditor().xtype=="checkbox"){
_10a="0";
}
if(_106.action!="I"||(_106.action=="I"&&_102[_10b].getEditor())){
_104+=_10a;
if(_106.action=="U"&&_102[_10b].getEditor()){
_104+=$G.Actions.valueSep+_109;
}
}
}
}
}
_100+=_103+_104;
_ff.editField.setAttribute("value",_100);
};
$G.Actions.isNull=function(val){
var ret=(val==null||typeof (val)=="undefined"||val.length==0);
return ret;
};
$G.loadData=function(data,_10f){
_10f._cf_gridDataProxy.loadResponse(data,_10f);
var _110=ColdFusion.objectCache[_10f._cf_gridname];
$G.applyStyles(_110);
$L.info("grid.loaddata.loaded","widget",[_10f._cf_gridname]);
if($G.Actions.isNull(data.TOTALROWCOUNT)==false&&data.TOTALROWCOUNT==0){
_110.fireSelectionChangeEvent();
}
};
$G.printObject=function(obj){
var str="";
for(key in obj){
str=str+"  "+key+"=";
value=obj[key];
str+=value;
}
return str;
};
$G.formatBoolean=function(v,p,_115){
return "<div class=\"x-grid3-check-col"+(v?"-on":"")+" x-grid3-cc-"+this.id+"\">&#160;</div>";
};
$G.formatDate=function(_116,p,_118){
if(_116&&!_116.dateFormat){
_116=new Date(_116);
}
var _119=this.dateFormat?this.dateFormat:"m/d/y";
return _116?Ext.Date.dateFormat(_116,_119):"";
};
$G.convertDate=function(_11a,p,_11c){
if(_11a&&!_11a.dateFormat){
_11a=new Date(_11a);
}
var _11d=this.dateFormat?this.dateFormat:"m/d/y";
return _11a;
};
$G.ExtProxy=function(_11e,_11f){
this.api={load:true,create:undefined,save:undefined,destroy:undefined};
$G.ExtProxy.superclass.constructor.call(this);
this.bindHandler=_11e;
this.errorHandler=_11f;
};
Ext.extend($G.ExtProxy,Ext.data.DataProxy,{_cf_firstLoad:true,load:function(_120,_121,_122,_123,arg){
if(!this._cf_actions.bindOnLoad){
var _125={"_cf_reader":_121,"_cf_grid_errorhandler":this.errorHandler,"_cf_scope":_123,"_cf_gridDataProxy":this,"_cf_gridname":this._cf_gridName,"_cf_arg":arg,"_cf_callback":_122,"ignoreData":true};
var data=[];
for(i=0;i<_120.limit;i++){
data.push(new Ext.data.Record({}));
}
this.loadResponse(data,_125);
this._cf_actions.bindOnLoad=true;
}else{
var _127=(_120.start/_120.limit)+1;
if(!_120.sort){
_120.sort="";
}
if(!_120.dir){
_120.dir="";
}
this.bindHandler(this,_127,_120.limit,_120.sort,_120.dir,this.errorHandler,_122,_123,arg,_121);
}
},loadResponse:function(data,_129){
var _12a=null;
if(_129.ignoreData){
_12a={success:true,records:data,totalRecords:data.length};
}else{
var _12b;
if(!data){
_12b="grid.extproxy.loadresponse.emptyresponse";
}else{
if(!data.TOTALROWCOUNT&&data.TOTALROWCOUNT!=0){
_12b="grid.extproxy.loadresponse.totalrowcountmissing";
}else{
if(!ColdFusion.Util.isInteger(data.TOTALROWCOUNT)){
_12b="grid.extproxy.loadresponse.totalrowcountinvalid";
}else{
if(!data.QUERY){
_12b="grid.extproxy.loadresponse.querymissing";
}else{
if(!data.QUERY.COLUMNS||!ColdFusion.Util.isArray(data.QUERY.COLUMNS)||!data.QUERY.DATA||!ColdFusion.Util.isArray(data.QUERY.DATA)||(data.QUERY.DATA.length>0&&!ColdFusion.Util.isArray(data.QUERY.DATA[0]))){
_12b="grid.extproxy.loadresponse.queryinvalid";
}
}
}
}
}
if(_12b){
ColdFusion.handleError(_129._cf_grid_errorHandler,_12b,"widget");
this.fireEvent("loadexception",this,_129,data,e);
return;
}
_12a=_129._cf_reader.readRecords(data);
}
this.fireEvent("load",this,_129,_129._cf_arg);
_129._cf_callback.call(_129._cf_scope,_12a,_129._cf_arg,true);
},update:function(_12c){
},updateResponse:function(_12d){
}});
$G.ExtReader=function(_12e){
this.recordType=Ext.data.Record.create(_12e);
};
Ext.extend($G.ExtReader,Ext.data.DataReader,{readRecords:function(_12f){
var _130=[];
var cols=_12f.QUERY.COLUMNS;
var data=_12f.QUERY.DATA;
for(var i=0;i<data.length;i++){
var _134={};
for(var j=0;j<cols.length;j++){
_134[cols[j]]=data[i][j];
}
_130.push(new Ext.data.Record(_134));
}
return {success:true,records:_130,totalRecords:_12f.TOTALROWCOUNT};
}});
$G.CheckColumn=function(_136){
Ext.apply(this,_136);
if(!this.id){
this.id=Ext.id();
}
this.renderer=this.renderer.bind(this);
};
$G.findColumnIndex=function(grid,_138){
var _139=grid.headerCt.getGridColumns();
for(var i=0;i<_139.length;i++){
if(_139[i].dataIndex==_138){
return i;
}
}
};
$G.CheckColumn.prototype={init:function(grid){
this.grid=grid;
this.count=0;
this.columnIndex=$G.findColumnIndex(this.grid,this.dataIndex);
this.grid.on("render",function(){
var view=this.grid.getView();
if(this.editable==true){
this.grid.addListener("itemmousedown",this.onMouseDown,this);
}
},this);
},onMouseDown:function(thi,_13e,item,_140,e,_142){
var t=e.target;
if(t.className&&t.className.indexOf("x-grid-cc-"+this.id)!=-1){
e.stopEvent();
var _144=ColdFusion.clone(_13e);
_144.data=ColdFusion.clone(_13e.data);
this.grid.getSelectionModel().select(_140);
this.grid.getSelectionModel().fireEvent("rowselect",this.grid.getSelectionModel(),_140);
this.grid.fireEvent("beforeedit",this,{grid:this.grid,row:_140,record:_13e,column:this.columnIndex,field:this.dataIndex,value:_13e.data[this.dataIndex]});
_13e.set(this.dataIndex,this.toggleBooleanValue(_13e.data[this.dataIndex]));
this.grid.fireEvent("edit",this,{grid:this.grid,row:_140,record:_144,column:this.columnIndex,field:this.dataIndex,value:_13e.data[this.dataIndex],originalValue:_144.data[this.dataIndex]});
}
},toggleBooleanValue:function(v){
v=typeof v=="undefined"?"N":(typeof v=="string"?v.toUpperCase():v);
if(v==="Y"){
return "N";
}
if(v==="N"){
return "Y";
}
if(v===true){
return false;
}
if(v===false){
return true;
}
if(v===0){
return 1;
}
if(v===1){
return 0;
}
if(v==="YES"){
return "NO";
}
if(v==="NO"){
return "YES";
}
if(v==="T"){
return "F";
}
if(v==="F"){
return "T";
}
return "Y";
},renderer:function(v,p,_148){
p.css+=" x-grid-check-col-td";
var _149=false;
v=(typeof v=="string")?v.toUpperCase():v;
if(typeof v!="undefined"&&(v==1||v=="1"||v=="Y"||v=="YES"||v=="TRUE"||v===true||v==="T")){
_149=true;
}
return "<div style=\"background-repeat: no-repeat;background-position:center center;width:auto\" class=\"x-grid-cell-checker"+(_149!=true?"-off":"")+" x-grid-cc-"+this.id+"\">&#160;</div>";
}};
$G.convertBoolean=function(v,_14b){
v=typeof v=="undefined"?"N":(typeof v=="string"?v.toUpperCase():v);
if(v==="Y"){
return "YES";
}
if(v==="N"){
return "NO";
}
if(v===true){
return "YES";
}
if(v===false){
return "NO";
}
if(v===0){
return "NO";
}
if(v===1){
return "YES";
}
if(v==="YES"){
return "YES";
}
if(v==="NO"){
return "NO";
}
if(v==="T"){
return "YES";
}
if(v==="F"){
return "NO";
}
if(v==="FALSE"){
return "NO";
}
if(v==""){
return "NO";
}
if(v.toUpperCase()=="NULL"){
return "NO";
}
return "YES";
};
Ext.define("MyReader",{extend:"Ext.data.reader.Json",alias:"reader.my-json",read:function(_14c){
var _14d;
if(_14c.request){
_14d=_14c.request.proxy;
}
var _14e=_14c.responseText;
if(!_14e){
_14e=_14c.responseJson;
}
if(!_14e){
_14e=_14c;
}
var _14f="";
if(_14d&&!_14d._cf_actions.bindOnLoad){
_14f="{  totalrows:0, data :[] }";
_14d._cf_actions.bindOnLoad=true;
}else{
_14f=$G.queryToJson(_14e);
}
if(_14d){
$G.applyStyles(_14d._cf_actions);
}
Ext.USE_NATIVE_JSON=false;
return this.callParent([Ext.decode(_14f)]);
}});
Ext.define("customcfajax",{extend:"Ext.data.proxy.Ajax",alias:"proxy.customcfajax",getParams:function(_150){
params=this.callParent(arguments);
if(!(this.sortParam&&_150.config.sorters&&_150.config.sorters.length>0)){
params[this.sortParam]="";
params[this.directionParam]="ASC";
}
return params;
}});
Ext.define("Ext.data.proxy.JsProxy",{requires:["Ext.util.MixedCollection","Ext.Ajax"],extend:"Ext.data.proxy.Server",alias:"proxy.jsajax",alternateClassName:["Ext.data.HttpProxy","Ext.data.JsProxy"],actionMethods:{create:"POST",read:"GET",update:"POST",destroy:"POST"},binary:false,jsfunction:"",extraparams:[],getParams:function(_151){
params=this.callParent(arguments);
if(_151.config&&_151.config.sorters){
_151.sorters=_151.config.sorters;
}
if(!(this.sortParam&&_151.sorters&&_151.sorters.length>0)){
params[this.sortParam]="";
params[this.directionParam]="ASC";
}
return params;
},processResponse:function(_152,_153,_154,_155){
var me=this,exception,reader,resultSet,meta,destroyOp;
if(me.destroying||me.destroyed){
return;
}
me.fireEvent("beginprocessresponse",me,_155,_153);
if(_152===true){
reader=me.getReader();
if(_155.status===204){
resultSet=reader.getNullResultSet();
}else{
resultSet=reader.read(me.extractResponseData(_155),{recordCreator:_153.getRecordCreator()||reader.defaultRecordCreatorFromServer});
}
if(!_153.$destroyOwner){
_153.$destroyOwner=me;
destroyOp=true;
}
_153.process(resultSet,_154,_155);
exception=!_153.wasSuccessful();
}else{
me.setException(_153,_155);
exception=true;
}
if(me.destroyed){
if(!_153.destroyed&&destroyOp&&_153.$destroyOwner===me){
_153.destroy();
}
return;
}
if(exception){
me.fireEvent("exception",me,_155,_153);
}else{
meta=resultSet.getMetadata();
if(meta){
me.onMetaChange(meta);
}
}
if(me.destroyed){
if(!_153.destroyed&&destroyOp&&_153.$destroyOwner===me){
_153.destroy();
}
return;
}
me.fireEvent("endprocessresponse",me,_155,_153);
if(!_153.destroyed&&destroyOp&&_153.$destroyOwner===me){
_153.destroy();
}
},doRequest:function(_157,_158,_159){
var me=this;
op=_157;
if(!op.page){
op.page=op._page;
}
sorters=_157.sorters;
sortcol="";
sortdir="ASC";
if(sorters&&sorters.length>0){
sortcol=sorters[0].property;
sortdir=sorters[0].direction;
}
if(this._cf_actions.bindOnLoad){
result=eval(this.jsfunction);
}else{
var _15b=[];
for(i=0;i<this._cf_actions.grid.columns.length;i++){
var _15c=this._cf_actions.grid.columns[i];
_15b[i]=_15c.colName;
}
result="{  totalrows:0, QUERY : { COLUMNS : "+_15b+" data :[] }}";
}
me.processResponse(true,_157,"",result,_158,_159);
return null;
},getMethod:function(_15d){
return this.actionMethods[_15d.action];
},createRequestCallback:function(_15e,_15f,_160,_161){
var me=this;
return function(_163,_164,_165){
me.processResponse(_164,_15f,_15e,_165,_160,_161);
};
}},function(){
Ext.data.HttpProxy=this;
});
$G.queryToJson=function(data){
var _167=[];
jsondata=ColdFusion.AjaxProxy.JSON.decode(data);
var cols=jsondata.QUERY.COLUMNS;
var data=jsondata.QUERY.DATA;
var _169="{  totalrows:"+jsondata.TOTALROWCOUNT+", data :[";
for(var i=0;i<data.length;i++){
var _16b={};
_169=_169+"{";
for(var j=0;j<cols.length;j++){
if(data[i][j]==null){
data[i][j]="";
}
_16b[cols[j]]=data[i][j];
encodedata=ColdFusion.AjaxProxy.JSON.encode(data[i][j]);
_169=_169+cols[j]+":"+encodedata;
if(j!=cols.length-1){
_169=_169+",";
}
}
_169=_169+"}";
if(i!=data.length-1){
_169=_169+",";
}
}
_169=_169+"]}";
return _169;
};
$G.queryToArray=function(data){
var _16e=[];
jsondata=ColdFusion.AjaxProxy.JSON.decode(data);
var cols=jsondata.QUERY.COLUMNS;
var data=jsondata.QUERY.DATA;
var _170=new Array();
for(var i=0;i<data.length;i++){
var _172=new Array(1);
for(var j=0;j<cols.length;j++){
_172[j]=data[i][j];
}
_170[i]=_172;
}
return _170;
};
};
cfinitgrid();
