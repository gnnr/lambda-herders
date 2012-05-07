# -*- coding: utf-8 -*-
"""
    client.py
    ~~~~~~~

    This module is used to test the WebSocket connection with the server

    :copyright: (c) 2012 by Mek, Zephyr Pellerin, Stephen Balaban
    :license: BSD, see LICENSE for more details.
"""

from ws4py.client.threadedclient import WebSocketClient

class Service(WebSocketClient):
    def opened(self):
        print "Connection opened"

    def closed(self, code, reason=None):
        print code, reason

    def received_message(self, m):
        self.send(m)

try:
    ws = Service('http://127.0.0.1:8080')
    ws.connect()
except KeyboardInterrupt:
    ws.close()
