<cf_navbar>
<cfparam  name="name" type="String" default="None">
<cfparam  name="surname" type="String" default="None">
<cfparam name="page" type="String" default = " Main PAge">

<cf_background url="/2927262.jpg" repeat="no-repeat" attachment="fixed" size="100% 100%">

    <head>
       <h1 style="font-size: 60px;"><p style="color: rgb(0, 247, 255);"><cfoutput>#attributes.page#</cfoutput></p></h1>
       <style>
           .baslik{
               font-size: 130%;
               color: orangered;
               background-color: olivedrab;
           }
           .aciklama{
               background-color: coral;
               text-decoration-color: cornsilk;
           }
       </style>
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <span><a href="pages/tel/tel.cfm" target="_blank">Deneme</a></span>
        <hr>


        <span class="baslik">Span </span>
        <div class="aciklama">burası da div <div>
        <span class="baslik">Span </span>
        <div class="aciklama">burası da div <div>
        <span class="baslik">Span </span>
        <div class="aciklama">
            <p id="d">Değitir</p>
            
            <div>               
    <button onclick="my()">Hide</button>
    <button onclick="ch()">change</button>              
    <script>
        function my(){
            var x = document.getElementsByClassName("baslik");
            for(var i =0; i < x.length; i++){
                x[i].style.display = "none";
            }
        }
        function ch(){
            var x = document.getElementById("d").innerHTML = "none";

        }
    </script>

    <iframe src="https://www.google.com" style="height: 200px;width: 300px;border:none"
    title="demo">asdad</iframe>
    </body>
   
          
    

    
       
          
    
    
    
    
        <!---
        <h1 style="font-size: 60px;"><p style="color: cadetblue;" title="Name">#attributes.name# #attributes.surname#</p></h1>
        
        <p>Bu bir paragraf</p>
        
        <p>bu bir başka <br> paragraf
            
        </p>
        <pre>
            my
            name
            is
            ubeyd
        </pre>
        <img src="1.png" alt="ruh tabağı" title="resim1">
    --->


    
    
    
