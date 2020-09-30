// Rev. 09/07/2003

function Toggle(item) {
	var obj;
	if ( document.getElementById ) 
   	{
		obj=document.getElementById(item);
	} else {
		obj = document.all[item];
	}
	var key;
   	if ( document.getElementById ) 
   	{
		key=document.getElementById("x" + item);
	} else {
		key = document.all['x' +item];
	}	

	if (obj != undefined) {
		var visible = ( obj.style.display != 'none');
		if (visible) {
			obj.style.display="none";
			key.innerHTML="<img src='images/arrow_closed.png' alt='Click to Open'  width='10' height='10' hspace='0' vspace='0' border='0'>";
		} else {
			obj.style.display="block";
			key.innerHTML="<img src='images/arrow_opened.png' alt='Click to Collapse' width='10' height='10' hspace='0' vspace='0' border='0'>";
		}
	}
	
}

function Expand() {
   if (document.getElementById) {
	    divs=document.getElementsByTagName("DIV");
	} else {		
		divs = document.all['DIV'];
	}

   for (i=0;i<divs.length;i++) {
     divs[i].style.display="block";
     key=document.getElementById("x" + divs[i].id);
     key.innerHTML="<img src='images/arrow_opened.png' width='10' height='10' hspace='0' vspace='0' border='0'>";
   }
}

function Collapse() {
	if (document.getElementById) {
	    divs=document.getElementsByTagName("DIV");
	} else {		
		divs = document.all['DIV'];
	}
   
   for (i=0;i<divs.length;i++) {
     divs[i].style.display="none";
     key=document.getElementById("x" + divs[i].id);
     key.innerHTML="<img src='images/arrow_closed.png'  width='10' height='10' hspace='0' vspace='0' border='0'>";
   }
}

function loadSubmenu(submenu, linktext){
	/*
	var SubmenuDiv = document.getElementById("submenu-layer");
	while(SubmenuDiv.firstChild){
		SubmenuDiv.removeChild(SubmenuDiv.firstChild);
	}
	var submenu = document.createElement('span');
	submenu.innerHTML = "ss";
	SubmenuDiv.appendChild(submenu);
	*/
	var mainmenutext = document.getElementsByClassName("mainmenu-text")[0];
	//mainmenutext.innerHTML = linktext;
	console.log(linktext);
}