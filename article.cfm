<cf_navbar>
<cf_background url="/2927262.jpg" repeat="no-repeat" attachment="fixed" size="100% 100%">

<head>
    <title>
        Articles
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width , initial-scale=1">
    <style>
        *{
            box-sizing: border-box;
        }
        body{
            font-family: Arial, Helvetica, sans-serif;
        }
        header{
            background-color: rgba(255, 255, 83, 0.397);
            padding: 25px;
            text-align: center;
            font-size: 30px;
            color: rgb(99, 1, 255);
        }

        nav{
            float: left;
            width: 30%;
            height:  250px;/* sil */
            background: rgb(0, 116, 231);
            padding: 20px;
            height: 300px;

        }
        nav ul{
            list-style-type: none;
            padding: 0;
        }
        article{
            float: left;
            padding: 20px;
            width: 70%;
            background-color: mediumaquamarine;
            height: 300px;
        }

        section::after{
            content: "";
            display: table;
            clear: both;
        }

        footer{
            background-color: mediumturquoise;
            padding: 10px;
            text-align: center;
            color: mistyrose;
        }
        @media (max-width: 600px) {
            nav, article {
              width: 100%;
              height: auto;
            }
          }
    </style>
    <body>
    
    
    
    <header>
        <h2>Cities</h2>
      </header>
      
      <section>
        <nav>
          <ul>
            <li><a href="#">London</a></li>
            <li><a href="#">Paris</a></li>
            <li><a href="#">Tokyo</a></li>
          </ul>
        </nav>
        
        <article>
          <h1>London</h1>
          <p>London is the capital city of England. It is the most populous city in the  United Kingdom, with a metropolitan area of over 13 million inhabitants.</p>
          <p>Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium.</p>
        </article>
      </section>
      
      <footer>
        <p>Footer</p>
      </footer>
      
      </body>    
</head>    