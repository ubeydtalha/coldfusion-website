/*ADOBE SYSTEMS INCORPORATED
Copyright 2012 Adobe Systems Incorporated
All Rights Reserved.

NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
terms of the Adobe license agreement accompanying it.  If you have received this file from a
source other than Adobe, then your use, modification, or distribution of it requires the prior
written permission of Adobe.*/
ColdFusion.RichText||(ColdFusion.RichText={});
ColdFusion.RichText.editorState={};
ColdFusion.RichText.buffer=null;
ColdFusion.RichText.registerAfterSet=function(_2f9){
if(ColdFusion.RichText.editorState[_2f9]){
var _2fa=function(){
ColdFusion.RichText.fireChangeEvent(_2f9);
};
var _2fb=CKEDITOR.instances[_2f9];
_2fb.on("OnAfterSetHTML",_2fa);
}else{
setTimeout("ColdFusion.RichText.registerAfterSet('"+_2f9+"')",1000);
}
};
ColdFusion.RichText.getEditorObject=function(_2fc){
if(!_2fc){
ColdFusion.handleError(null,"richtext.geteditorobject.missingtextareaname","widget",null,null,null,true);
return;
}
var _2fd=ColdFusion.objectCache[_2fc];
if(_2fd==null||CKEDITOR.editor.prototype.isPrototypeOf(_2fd)==false){
ColdFusion.handleError(null,"richtext.geteditorobject.notfound","widget",[_2fc],null,null,true);
return;
}
return CKEDITOR.instances[_2fd.richtextid];
};
ColdFusion.RichText.setValue=function(_2fe,_2ff){
if(ColdFusion.RichText.editorState[_2fe]){
var _300=CKEDITOR.instances[_2fe];
_300.setData(_2ff);
_300.fire("onAfterSetHTML");
}else{
setTimeout("ColdFusion.RichText.setValue(\""+_2fe+"\",\""+_2ff+"\")",1000);
}
};
ColdFusion.RichText.getValue=function(_301){
if(ColdFusion.RichText.editorState[_301]){
return CKEDITOR.instances[_301].getData();
}else{
ColdFusion.Log.error("richtext.initialize.getvalue.notready","widget",[_301]);
return null;
}
};
ColdFusion.RichText.fireChangeEvent=function(_302){
var _303=ColdFusion.objectCache[_302];
ColdFusion.Log.info("richtext.firechangeevent.firechange","widget",[_303._cf_name]);
var _304=document.getElementById(_302);
if(_304){
if(_304.fireEvent){
_304.fireEvent("onchange");
}
if(document.createEvent){
var evt=document.createEvent("HTMLEvents");
if(evt.initEvent){
evt.initEvent("change",true,true);
}
if(_304.dispatchEvent){
_304.dispatchEvent(evt);
}
}
}
ColdFusion.Event.callBindHandlers(_302,null,"change");
};
ColdFusion.RichText.editor_onfocus=function(e){
document.getElementById(e.editor.id+"_top").style.display="block";
};
ColdFusion.RichText.editor_onblur=function(e){
document.getElementById(e.editor.id+"_top").style.display="none";
};
ColdFusion.RichText.setChangeBuffer=function(e){
ColdFusion.RichText.buffer=CKEDITOR.instances[e.editor.name].getData();
};
ColdFusion.RichText.resetChangeBuffer=function(e){
if(ColdFusion.RichText.buffer!=CKEDITOR.instances[e.editor.name].getData()){
ColdFusion.RichText.fireChangeEvent(e.editor.name);
}
ColdFusion.RichText.buffer=null;
};
var parameters={};
CKEDITOR.on("instanceCreated",function(e){
var _30b=e.editor.name;
if(parameters[_30b].Id){
ColdFusion.RichText.editorState[parameters[_30b].Id]=false;
e.editor.richtextid=parameters[_30b].Id;
ColdFusion.objectCache[parameters[_30b].Id]=e.editor;
}
if(parameters[_30b].Name){
e.editor._cf_name=parameters[_30b].Name;
ColdFusion.objectCache[parameters[_30b].Name]=e.editor;
}
if(parameters[_30b].Val){
e.editor.Value=parameters[_30b].Val;
}
e.editor._cf_setValue=function(_30c){
ColdFusion.RichText.setValue(_30b,_30c);
};
e.editor._cf_getAttribute=function(){
return ColdFusion.RichText.getValue(_30b);
};
e.editor._cf_register=function(_30d,_30e,_30f){
var _310=document.getElementById(_30b);
if(_310){
ColdFusion.Event.addListener(_310,_30d,_30e,_30f);
}
};
});
ColdFusion.RichText.initialize=function(Id,Name,Val,_314,_315,_316,_317,_318,_319,Skin,_31b,_31c,_31d,_31e,_31f){
parameters[Id]={};
parameters[Id].Id=Id;
parameters[Id].Name=Name;
parameters[Id].Val=Val;
var _320=function(evt){
if(_31b==true){
evt.editor.on("focus",ColdFusion.RichText.editor_onfocus);
evt.editor.on("blur",ColdFusion.RichText.editor_onblur);
document.getElementById(evt.editor.id+"_top").style.display="none";
}
evt.editor.on("focus",ColdFusion.RichText.setChangeBuffer);
evt.editor.on("blur",ColdFusion.RichText.resetChangeBuffer);
ColdFusion.RichText.editorState[evt.editor.name]=true;
if(ColdFusion.RichText.OnComplete){
ColdFusion.RichText.OnComplete(evt.editor);
}
};
var _322={on:{"instanceReady":_320}};
_322["toolbar"]="Default";
if(_316!=null){
_322["height"]=_316;
}
if(_315!=null){
_322["width"]=_315;
}
if(_317!=null){
_322["font_names"]=_317;
}
if(_318!=null){
_322["fontSize_sizes"]=_318;
}
if(_319!=null){
_322["format_tags"]=_319;
}
if(Skin!=null){
_322["skin"]=Skin;
}
if(_31b==true){
_322["toolbarCanCollapse"]=false;
}
if(_31c!=null){
_322["toolbar"]=_31c;
}
var _323=CKEDITOR.replace(Id,_322);
};
