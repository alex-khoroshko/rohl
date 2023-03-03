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
var timeUpdateInterv;
timeEditEnd();
setInterval(updateTelem, 1000);


/* global variables to fill time edit form on push Edit button*/
var time_values;

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
	document.getElementById("telemetry_center").innerHTML = state;
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

function sendTime() {
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
	var val_str = "hour=" + document.getElementById("hour").value;
	val_str += "&minutes=" + document.getElementById("minutes").value;
	val_str += "&secs=" + document.getElementById("secs").value;
	val_str += "&day_of_week=" + document.getElementById("day_of_week").value;
	xhttp.open("GET", "control.htm?cmd=set_time&" + val_str, true);
	xhttp.send();
	timeEditEnd();
}

function timeUpdate () {
	var req = new XMLHttpRequest();
	req.timeout = 1000;
	req.responseType = 'json';
	req.open('GET', "time.json", true);
	req.onload  = function() {
		time_values = req.response;
		insertTime(time_values.hour, time_values.minutes, time_values.secs, time_values.day_of_week);
	};
	req.send(null);
}

function updateTelem () {
	var req = new XMLHttpRequest();
	req.timeout = 1000;
	req.responseType = 'json';
	req.open('GET', "telem.json", true);
	req.onload  = function() {
		document.getElementById("tempr_board").innerHTML = req.response.t_board;
		document.getElementById("tempr_led").innerHTML = req.response.t_led;
	};
	req.send(null);
}

function timeEditStart () {
	//disable time update to let user edit something
	clearInterval(timeUpdateInterv);
	document.getElementById("time_val").innerHTML = `
	<input class='time_editbox' type='number' id='hour' value='` + time_values.hour +`' min='0', max='24'><!--whitespace clear
	-->:<!--whitespace clear
	--><input class='time_editbox' type='number' id='minutes' value='`+time_values.minutes+`' min='0', max='60'><!--whitespace clear
	-->:<!--whitespace clear
	--><input class='time_editbox' type='number' id='secs' value='`+time_values.secs+`' min='0', max='60'><br>
	<select class='week_selector' id='day_of_week'>
	  <option value="1">Mon</option>
	  <option value="2">Tue</option>
	  <option value="3">Wen</option>
	  <option value="4">Thu</option>
	  <option value="5">Fri</option>
	  <option value="6">Sat</option>
	  <option value="7">Sun</option>
	</select>;`;
	document.getElementById("day_of_week").value = time_values.day_of_week;
	document.getElementById("time_button_div").innerHTML = `
		<button type="button" class="time_button" onclick="sendTime()">Set</button>
		<button type="button" class="time_button" onclick="timeEditEnd()">Cancel</button>`;
}

function timeFormat (val) {
	return String("0" + val).slice(-2);
}

function insertTime (h,m,s,dow) {
	var dowText = "---";
	switch(dow) {
		case 1:
			dowText = "Mon";
		break;
		case 2:
			dowText = "Tue";
		break;
		case 3:
			dowText = "Wen";
		break;
		case 4:
			dowText = "Thu";
		break;
		case 5:
			dowText = "Fri";
		break;
		case 6:
			dowText = "Sat";
		break;
		case 7:
			dowText = "Sun";
		break;
		default:
		break;		
	}
		
	document.getElementById("time_val").innerHTML = "" + timeFormat(h) +":" + timeFormat(m) + ":"+ timeFormat(s) + "<br>"+dowText;
}
function insertDefaultTime () {
	insertTime("--","--","--","---");
}

function timeEditEnd () {
	timeUpdateInterv = setInterval(timeUpdate, 500);
	insertDefaultTime();
	document.getElementById("time_button_div").innerHTML = `<button type="button" class="time_button" onclick="timeEditStart()">Edit</button>`;
}
