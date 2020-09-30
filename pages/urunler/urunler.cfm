<cf_navbar>
<cf_background url="/2927262.jpg" repeat="no-repeat" attachment="fixed" size="100% 100%">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .tr02 {
            padding: 10px;
            border : 1px solid;
            clear :both ;
            font-size: 25px;
            
            
        }
        #table-1 tr:nth-child(even){
            background-color: #afadad54;


        }
        #table-1 tr:nth-child(odd){
            background-color: rgba(223, 221, 221, 0.575);
            

        }
        #urunler-listesi{
            list-style: square;
            
        }

        img {
            
            max-width: 100%;
            height: auto;
            padding: 0;
        }
                
    </style>
    
</head>
<body >
    <hr>


    <table class="table" id="table-1"style="text-align: left; border: 1px solid black; width: 300px;">
        <caption>Ürünler</caption>
        
        <tr>
            <th >
                <ul id="urunler-listesi">
                    <li style="float: none;">Asus</li>
                    <li style="float: none;"></li>
                </ul>
            </th>
            <td>
                <picture>
                    <!-- <source media="(min-width: 0px)" srcset="/1_org.jpg" >-->
                    <img src="/1_org.jpg" alt="Computer" style="width:auto;">
                </picture>
            </td>
            <td>
                <picture>
                    <!--<source media="(min-width: 0px)"  srcset="https://www.bilgi-adresim.com/wp-content/uploads/2020/03/HP-15-DB1068NT-AMD-RYZEN-5-3500-U.jpg" >-->
                    <img src="https://www.bilgi-adresim.com/wp-content/uploads/2020/03/HP-15-DB1068NT-AMD-RYZEN-5-3500-U.jpg" alt="Computer" style="max-width:50%;">
            
                </picture>
            </td>                         
        </tr>
        
        <tr  >
            <th class="tr02">Marka</th>
            <td class="tr02">Asus</td>
            <td class="tr02">HP</td>
        </tr>
        <tr>
            <th class="tr02">Ekran Kartı</th>
            <td class="tr02">RTX 2080</td> 
            <td class="tr02">GTX 1070</td>
        </tr>
        <tr>
            <th class="tr02">İşlemci</th>
            <td class="tr02">Intel i9 9990K</td>
            <td class="tr02">AMD RYZEN 5</td>
        </tr>
        
    </table>
    <div>
        <link rel="stylesheet" href="https://www.w3schools.com/html/styles.css">
        <button onclick="mine()" >Buyut</button>
        <button onclick="mine2()" >Kucult</button>
        <form action="" oninput="x.value=parseInt(a.value)+parseInt(b.value)">
            0
            <input type="range" id="a" name="a" value="50">
            100 +
            <input type="number" id="b" name="b" value="50">
            =
            <output name="x" for="a b"></output>
            <br><br>
            <input type="submit">
        </form>
    </div>     
    <script type="text/javascript" language="JavaScript">
        var y = document.getElementsByClassName("tr02");
        var x= y[0];
        function mine(){
            var i =0;
            var y = document.getElementsByClassName("tr02");
            for (i;i<y.length;i++){
                
                var fontsize=window.getComputedStyle(y[i], null).getPropertyValue('font-size');
                var currentSize = parseFloat(fontsize);
                y[i].style.fontSize = (currentSize + 10) + 'px';
            }
            
            x+=10;
            
        }
        
        function mine2(){
            
            var i =0;
            var y = document.getElementsByClassName("tr02");
            for (i;i<y.length;i++){
                var fontsize=window.getComputedStyle(y[i], null).getPropertyValue('font-size');
                var currentSize = parseFloat(fontsize);
                y[i].style.fontSize = (currentSize - 10) + 'px';
            }
            x-=10;
        }        
    </script>
</body>    
