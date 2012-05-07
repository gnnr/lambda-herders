require 'em-websocket'
require 'json'


EventMachine.run {
  @hub = EM::Channel.new

  EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 1234, :debug => true) do |ws|

    ws.onopen {
      subscriber_id = @hub.subscribe {|msg| ws.send msg }
      @hub.push "#{subscriber_id} connected!"

      ws.onmessage {|msg|
        @hub.push "<#{subscriber_id}>: #{msg}"
      }

      ws.onclose {
        @hub.unsubscribe(subscriber_id)
      }
    }

  end

  puts "Server initialized"
}
