<!doctype html>
<html lang="en">
...

<head>
    <cf_navbar>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<body>

    <cfscript>

        public function get_table( required string table_name){

            filmler = QueryExecute('SELECT * FROM #table_name# ', [], {datasource = 'WorkCubeDB'});
            return filmler
        }
        
    </cfscript>
    
    <cfset query = get_table("filmler")> <!---  Filmler tablosu veritabanından çekildi    --->
    

        <div class="card-deck"> <!---   Kart destesi oluşturuldu   --->
            <cfoutput query="query"> <!---   film sayısı kadar dönecek    --->
                <div class="card"> <!---  ve her dönüşte yeni bir kart üretip     --->
                    
                    <div class="card-body">
                        <h5 class="card-title">#isim#</h5> <!---  o karta o filmin ismini verecek      --->
                    </div>      
                    <ul class="list-group list-group-flush">

                    <cfscript>
                        oyuncular = QueryExecute('SELECT * FROM oyuncular,filmler Where oyuncular.id in 
                        (select oyuncular_id from filmler_oyuncular where film_id = filmler.id) and filmler.id = #id# ', [], {datasource = 'WorkCubeDB'});
                    </cfscript> <!---   Daha önce yaptığım filmin id'sine göre oyuncuları döndüren sorgu , oyuncular isimli değişkene atanıyor  --->
                            <cfloop query="oyuncular">  <!---  oyuncular döngüye sokuluyor    --->
                                <li class="list-group-item">#ad_soyad#</li> <!---  döngüdeki oyuncunun ismi karta ekleniyor    --->
                            </cfloop>
                                
    
                        </ul>
                    
                    <div class="card-footer">
                        <small class="text-muted"></small>
                    </div>
                </div>
            </cfoutput> 
        </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

</body>

</html>