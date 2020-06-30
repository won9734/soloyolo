var tabs = document.getElementsByClassName("container2 table");
var buttons = document.getElementsByName("button");

	$(function(){
		tabs[0].style.display = "block";
		tabs[1].style.display = "none";
		tabs[2].style.display = "none"; 
		tabs[3].style.display = "none"; 
		tabs[4].style.display = "none"; 
	});
	
	function page1(idName){
		for(var i=0; i<buttons.length; i++){
			if( idName == i ){
				tabs[i].style.display = "block";
				buttons[i].style.background = "#9CE9FF";
				buttons[i].style.color = "#fff";
				buttons[i].style.borderRadius = "5px";
			} else {
				tabs[i].style.display = "none";
				buttons[i].style.background = "white";
				buttons[i].style.color = "#000";
				buttons[i].style.borderRadius = "5px";
			}
		}
	}