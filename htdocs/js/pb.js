var menuShown = true;
var oldMargin;
var showhideobj = new Array;

function showHideMenu() {
  if(menuShown) {
    document.getElementById('sidebar-left').style.display = 'none';
    oldMargin = document.getElementById('content').style.margin;
    document.getElementById('content').style.margin='0.6em 0.6em 0.6em 0.6em';
    document.getElementById('showhide').innerHTML = 'Show Menu';
    menuShown = false;
  } else {
    document.getElementById('content').style.margin = oldMargin;
    document.getElementById('sidebar-left').style.display = 'block';
    document.getElementById('showhide').innerHTML = 'Hide Menu';
    menuShown = true;
  }
}

function showHideDiv(i,img,col) {
	var o = document.getElementById(i);
	if(showhideobj[i] == 'none') {
		o.style.display = 'block';
		showhideobj[i] = 'block';
		img.src = 'http://static.pastebin.ca/imgs/svg.php/arrow-up-16-' + col + '.png';
	} else {
		o.style.display = 'none';
		showhideobj[i] = 'none';
		img.src = 'http://static.pastebin.ca/imgs/svg.php/arrow-down-16-' + col + '.png';
	}	
}
