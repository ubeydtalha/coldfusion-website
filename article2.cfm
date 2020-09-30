<cf_navbar>
<cf_background url="/2927262.jpg" repeat="no-repeat" attachment="fixed" size="100% 100%">

  <head>
    <title>CSS Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    * {
      box-sizing: border-box;
    }
    
    body {
      font-family: Arial, Helvetica, sans-serif;
    }
    
    /* Style the header */
    header {
      display: grid;
      background-color: #666;
      padding: 5px;
      text-align: center;
      
      font-size: 3vw;
      color: white;
    }
    
    /* Container for flexboxes */
    section {
      display: -webkit-flex;
      display: flex;
    }
    
    /* Style the navigation menu */
    nav {
      -webkit-flex: 1;
      -ms-flex: 1;
      flex: 1;
      background: #ccc;
      padding: 20px;
    }
    
    /* Style the list inside the menu */
    nav ul {
      list-style-type: none;
      padding: 0;
    }
    
    /* Style the content */
    article {
      -webkit-flex: 3;
      -ms-flex: 3;
      flex: 3;
      background-color: #f1f1f1;
      padding: 10px;
    }
    
    /* Style the footer */
    footer {
      background-color: #777;
      padding: 10px;
      text-align: center;
      color: white;
    }
    .left{
      background-color: aliceblue;
      padding: 10px;
      float: left;
      width: 30%;
      text-align: center;
    }
    .center{
      background-color: rgb(16, 55, 90);
      padding: 10px;
      float: left;
      width: 35%;
      text-align: center;
    }
    .right{
      background-color: rgb(88, 165, 233);
      padding: 10px;
      float: left;
      width: 30%;
      text-align: center;
    }
    /* Responsive layout - makes the menu and the content (inside the section) sit on top of each other instead of next to each other */
    @media (max-width: 25%) {
      section {
        -webkit-flex-direction: column;
        flex-direction: column;
      }

    }
    @media screen and (max-width: 950px){
      .left, .center, .right {
        width:100%; /* The width is 100%, when the viewport is 800px or smaller */
        
      }
    }
    </style>
    </head>
    <body>
    
    <h2>CSS Layout Flexbox</h2>
    <p>In this example, we have created a header, two columns/boxes and a footer. On smaller screens, the columns will stack on top of each other.</p>
    <p>Resize the browser window to see the responsive effect.</p>
    <p><strong>Note:</strong> Flexbox is not supported in Internet Explorer 10 and earlier versions.</p>
    
    <header>
      <h1 style="height:auto;text-align: center;">Cities</h1>
    </header>
    
    <section>
      <nav>
        <ul>
          <li><div><p><a href="#">London</a></p></div></li>
          <li><div><p><a href="#">tokyo</a></p></div></li>
          <li><div><p><a href="#">istanbul</a></p></div></li>
        </ul>
        <hr>
        <div class="left"><a href="#">Left</a></div>
        <div class="center"><a href="#">Center</a></div>
        <div class="right"><a href="#">Right</a></div>
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