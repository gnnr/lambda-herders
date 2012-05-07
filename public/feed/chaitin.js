var utils = {
    choose: function(arr) { 
	return arr[Math.floor ( Math.random() * arr.length )] ;
    },
    words: ["go to", "party", "kiss", "sex", "want", "I", "get", "beer", "guy", "you", "like", "need", "girl"]
}

var chaitin = (function(mixin) {
    var m = mixin || {};
    m.ENDPOINT = "ws://localhost:1234";
    m.socket = null;
    m.gentxt = function () {
	var res = [];
	for(var i = 0; i < utils.choose([5,6,7,8,9,10]); i++) {
	    res.push(utils.choose(utils.words));
	}
	return res.join(' ') + '.';
    }
    m.create_socket = function (endpoint) {
	console.log(endpoint);
	var socket = new WebSocket(endpoint);
	socket.onopen = function() {
	    txt = m.gentxt();
	    socket.send(txt);
	    alert("Socket has been opened! Sending text: " + txt);
	}
	socket.onmessage = function(msg) {  
	    alert(msg); //Awesome!  
	}
	socket.onerror = function(err) {
	    alert(err);
	}
	socket.onclose = function(msg) {
	    alert(msg);
	}
	return socket;
    }
    m.get_socket = function() {
	if(!m.socket) {
	    m.socket = m.create_socket(m.ENDPOINT);
	}
	return m.socket;
    }
    m.init = function () {
	var asock = m.get_socket();
    }
    return m;
})();

window.onload = function () {
    chaitin.init();
}