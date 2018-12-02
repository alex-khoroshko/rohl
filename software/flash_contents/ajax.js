/*status interval*/
connStateUpdate("Disconnected");
var interStatus = setInterval(updateStatus,1000);


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
		if (this.readyState == 4 && this.status == 200) {
			connStateUpdate("Connected");
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
    xhttp.open("GET", "control.htm?cmd=set_brightn&val="+brtVal, true);
    xhttp.send();
}