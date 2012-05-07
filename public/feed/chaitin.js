var utils = {
    choose: function(arr) { 
	return arr[Math.floor ( Math.random() * arr.length )] ;
    },
    words: ["go to", "party", "kiss", "sex", "want", "I", "get", "beer", "guy", "you", "like", "need", "girl"]
}

var chaitin = (function(mixin) {
    var m = mixin || {};
    m.WSPORT = 9000;
    m.WSHOST = "baybo.it";
    m.ENDPOINT = "ws://" + m.WSHOST + ":" + m.WSPORT + "/ws";
    m.LISTID = "item_list";
    m.socket = null;
    m.gentxt = function () {
	var res = [];
	for(var i = 0; i < utils.choose([5,6,7,8,9,10]); i++) {
	    res.push(utils.choose(utils.words));
	}
	return res.join(' ') + '.';
    }
    m.insert_row_obj = function(obj) {
	m.list.insertBefore(obj, m.list.firstChild);
    }
    m.row_obj_txt = function(txt) {
	var li = document.createElement("li");
	li.innerHTML = txt;
	return li;
    }
    m.handle_data = function(txt) {
	m.insert_row_obj(m.row_obj_txt(txt));
    }
    m.create_socket = function (endpoint) {
	console.info(endpoint);
	var socket = new WebSocket(endpoint);
	socket.onopen = function() {
	    txt = m.gentxt();
	    socket.send(txt);
	    alert("Socket has been opened! Sending text: " + txt);
	}
	socket.onmessage = function(msg) {  
	    m.handle_data(msg.data);
	    console.info(msg); //Awesome!  
	}
	socket.onerror = function(err) {
	    console.info(err);
	}
	socket.onclose = function(msg) {
	    console.info(msg);
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
	m.list = document.getElementById(m.LISTID);
	console.info(m.list);
	var asock = m.get_socket();
    }
    return m;
})();

window.onload = function () {
    chaitin.init();
}