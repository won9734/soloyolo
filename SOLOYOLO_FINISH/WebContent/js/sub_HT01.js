var divs = document.getElementsByClassName( "clearFix new" );
var buttons = document.getElementsByName( "button" );

$(function() {
	divs[0].style.display = "block";
	divs[1].style.display = "none";
	divs[2].style.display = "none"; 
	divs[3].style.display = "none"; 
	divs[4].style.display = "none"; 
});

function page1( idName ) {
	for( var i = 0; i < buttons.length; i++ ) {
		if( idName == i ) {
			 divs[i].style.display = "block";
			 buttons[i].style.background = "#9CE9FF";
			 buttons[i].style.color = "#fff";
			 buttons[i].style.borderRadius = "5px";
		}else{
			 divs[i].style.display = "none";
			 buttons[i].style.background = "white";
			 buttons[i].style.color = "#000";
			 buttons[i].style.borderRadius = "5px";
		}
	}
}