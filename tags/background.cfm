<cfparam  name="url"  default="2927262.jpg">
<cfparam  name="repeat" type="String" default="no-repeat">
<cfparam  name="attachment" type="String" default="fixed">
<cfparam  name="size" default="100% 100%" >

<style>
    body{
        background-image: url(<cfoutput>#attributes.url#</cfoutput>) ;
        background-repeat:<cfoutput> #attributes.repeat#</cfoutput>;
        background-attachment: <cfoutput> #attributes.attachment#</cfoutput>;
        background-size:<cfoutput>#attributes.size#</cfoutput>;
        z-index : -1;
    }
</style>
<!---
<cfscript>
    public string function style_creator( 
        string url = attributes.url,
        string repeat = attributes.repeat,
        string attachment = attributes.attachment,
        string size = attributes.size
     ){
        var style = 'background-image: url('&arguments.url&');background-repeat:'&arguments.repeat&';background-attachment:'&arguments.attachment&';background-size: '&arguments.size&';';
        return style;
        
    
    }
    
</cfscript>
--->