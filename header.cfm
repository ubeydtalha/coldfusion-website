
<p>Wellcome</p>
<cfset uzayli = "uzayli" >
<cfparam  name="name" default="">

<cfloop from="1" to=5 index="i">
    <cfoutput>
    
    </cfoutput>
</cfloop>
<cfset a = false>
<cfloop condition="a eq false">
    <cfoutput>
        <cfset b = randRange(1, 10)>
        #b# <br/>
        <cfif  b eq 10>
            <cfset a = "true">
            <cfloop index="i" from="1" to="5">
                #i# </br>
            </cfloop>
            
        </cfif>
    </cfoutput>
</cfloop>

<cfloop list="ubeyd,talha:alkan" index="ListItem" delimiters = ",:">
    <cfoutput>
        #ListItem# <br/>
    </cfoutput>
</cfloop>

<cfset myBook = StructNew()>
<cfset Book = structInsert(mybook, "ColdFusion", "CF book")>

<cfset Book = structInsert(mybook, "java", "java book")>

<cfset Book = structInsert(mybook, "python", "python book")>

<cfloop collection="#myBook#" item="subject">
    <cfoutput>
        #subject# : #structFind(myBook, subject)# </br>
    </cfoutput>
</cfloop>

<cfset DateToday = "#now()#">
<cfdump var = "#DateToday#">

<cfset now = now()>

<cfoutput>
    #now#
</cfoutput>

<cfset arr = ["The","First","Think","I","need","You",2]>



<cfloop array="#arr#" item="i">
    <cfoutput>
        #i#</br>
    </cfoutput>
</cfloop>

<cfset newarr = arrayNew(1)>

<cfset newarr[1] = "First">
<cfset arrayAppend(newarr, "Last") >

<cfset dict  = structNew()>
<cfset dict["Parameters1"] = "Enabled">
<cfset dict.Parameters2 = "Disabled">


<cfoutput>
    #newarr[1]# </br>
    
    #newarr[2]# </br>
    #dict.Parameters1# </br>
    #dict["Parameters2"]# </br>
</cfoutput>
<!--- heyo --->


<cfscript>
    arr = ["The","First","Think","I","need","You",2]
    for(i=1; i <= arrayLen(#arr#); i++){
        writeOutput(#arr[i]#)
    }
</cfscript>

<cfswitch expression=#dict.Parameters1#>
    <cfcase value="Enabled">
        <cfoutput>
            Parametre 1 is opened. </br>
        </cfoutput>
    </cfcase>
    <cfcase  value="Disabled">
        <cfoutput>
            Parametre 1 is closed. </br>
        </cfoutput>        
    </cfcase>
</cfswitch>
<cfoutput>
<cfscript>
    myQuery = queryNew( "id,user" );
    queryAddRow( myQuery );
    querySetCell( myQuery, 'id', '1' );
    querySetCell( myQuery, 'user', 'Jeff' );
    queryAddRow( myQuery );
    querySetCell( myQuery, 'id', '2' );
    querySetCell( myQuery, 'user', 'John' );
    queryAddRow( myQuery );
    querySetCell( myQuery, 'id', '3' );
    querySetCell( myQuery, 'user', 'Steve' );
</cfscript>

<cfloop query="myQuery">
    #myQuery.id# #myQuery.user#<br>
    <cfif #myQuery.id# eq 2>
        bitti
        <cfbreak>
    </cfif>
</cfloop>

    last = #myQuery.id# #myQuery.user#<br>
</cfoutput>

<cfloop index="i" from="1" to="1">
    <cfoutput>
        Level #i# = #floor(20*((i+1)^(1.01+(i+1)/(i+2))))# Fark = #floor(20*((i+1)^(1.01+(i+1)/(i+2)))-20*((i)^(1.01+(i)/(i+1))))#</br>
    </cfoutput>
</cfloop>


<cfset computer = True> <!-- Computer değişkenine True değer atandı -->
<cfif computer eq True> <!-- Computer değişkeni True ise aşağıdaki döngüye girmesini istedik -->
    <cfloop index="i" from=0 to=10> <!-- i isimli yeni değişken 0'da 10'a kadar sırayla değer almasını istedik -->
        <cfoutput> 
            #i#.Bilgisayar<br> <!-- Her i.Bilgisayarı ekrana yazdırdık-->
        </cfoutput>
    </cfloop>
<cfelse>
    <cfoutput>
        Bilgisayar bulunamadı
    </cfoutput>
</cfif>

<cfscript>
    query = QueryExecute('SELECT * FROM filmler,oyuncular,filmler_oyuncular Where filmler_oyuncular.oyuncular_id = oyuncular.id and oyuncular.id= 1 ', [], {datasource = 'WorkCubeDB'});
</cfscript>

<cfdump  var=#query#>

<cfscript>
    query = QueryExecute('SELECT * FROM oyuncular,filmler Where oyuncular.id in 
    (select oyuncular_id from filmler_oyuncular where film_id = filmler.id) and filmler.id = 2 ', [], {datasource = 'WorkCubeDB'});
</cfscript>

<cfdump  var=#query#>