/*status interval*/
connStateUpdate("Disconnected");
/*
var sliders_cfg = [
	{color:"white", name:"Cold white", 	val:10},
	{color:"white", name:"Warm white", 	val:20},
	{color:"white", name:"Blue", 		val:30},
	{color:"white", name:"Royal blue", 	val:40}
]*/
var sliders_cfg;
/*start loading sequence - continuation is via callbacks*/
getSliders ();
var intervStatus;

function getSliders() {
	var req = new XMLHttpRequest();
	req.responseType = 'json';
	req.open('GET', "ch_cfg.json", true);
	req.onload  = function() {
		sliders_cfg = req.response;
		fillSliders ();
		intervStatus = setInterval(updateStatus,5000);
		connStateUpdate("Connected");
	};
	req.send(null);
}

function connStateUpdate(state) {
	document.getElementById("stateIndicator").innerHTML = state;
	if (state=="Connected") {
		document.getElementById("stateIndicator").style.backgroundColor = "#00cc99";
	}
	if (state=="Disconnected") {
		document.getElementById("stateIndicator").style.backgroundColor = "#ff8080";
	}
}

function updateStatus() {
	var xhttp = new XMLHttpRequest();
	xhttp.timeout = 2000;
    xhttp.onreadystatechange = function() {
		if (this.readyState == 4) {
			if (this.status == 200) {
				connStateUpdate("Connected");
			} else {
				connStateUpdate("Disconnected");
			}
		}
    };
	xhttp.onerror  = function() {
		connStateUpdate("Disconnected");
	};
    xhttp.open("GET", "control.htm", true);
    xhttp.send();
}

function setBrightness(chNum, brtVal) {
	var xhttp = new XMLHttpRequest();
	xhttp.timeout = 1000;
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			connStateUpdate("Connected");
		}
	};
	/*xhttp.onerror  = function() {
		connStateUpdate("Disconnected");
	};*/
	xhttp.open("GET", "control.htm?cmd=set_brightn&ch=" + chNum + "&val=" + brtVal, true);
	xhttp.send();
}

function getBrightness(chNum) {
	var req = new XMLHttpRequest();
	req.responseType = 'json';
	req.open('GET', url, true);
	req.onload  = function() {
	   var jsonResponse = req.response;
	   // do something with jsonResponse
	};
	req.send(null);
}

function changeNum(val,chNum) {
	document.getElementById("sliderV"+chNum).value = val;
	setBrightness(chNum,val);
}
function changeSlider(val,chNum) {
	document.getElementById("sliderP"+chNum).value = val;
	setBrightness(chNum,val);
}
function fillSliders() {
	for (i=0; i<sliders_cfg.length; i++) {
		sld = "<div>";
		sld += "<div class='slider_div_left'>" + sliders_cfg[i].name + "</div>";
		sld += "<div class='slider_div_center'><input type='range' min='0' max='100' id='sliderP" + i + "' oninput='changeNum(this.value, " + i + ")' value='0'></div>";
		sld += "<div class='slider_div_right'>";
		sld += "<input class='slider_val' type='number' name='fname' id='sliderV" + i + "' value='0' oninput='changeSlider(this.value, " + i + ")' min='0', max='100'></div>";
		sld += "</div>";
		document.getElementById("sliders_div").innerHTML += sld;
	}
	for (i=0; i<sliders_cfg.length; i++) {
		brt_val = sliders_cfg[i].val;
		changeNum(brt_val, i);
		changeSlider(brt_val,i);
	}
}
