require "rubygems"
require "em-websocket-server"
require 'pp'
require 'net/http'

# No event handler recieved, word.

class RealTimePushServer < EM::WebSocket::Server

  @@current_identifier = 0 

  def on_connect
    pp "Connected client"
  end

  def on_recieve
    send_message msg
  end

end


pp "Initializing Lambda's RealtimePushServer"


pp "Preparing socket..."
EM.run do
  EM.start_server "0.0.0.0", 1234, RealTimePushServer
  pp "Socket established"
  EM.add_periodic_timer(5) do
    # Net::HTTP.get("localhost:3000/feed_items_from/#{id}")
  end
end
