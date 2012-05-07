require 'em-websocket'
require 'json'


class WebSocketEventMachine 
  @connected = false
  @request   = EM::Chanell.new
  def receive_data data
    
    if @connected
      #parse each frame and dispatch
      while msg = data.slice!(Pack)
        on_receive msg.gsub(Frame, "")
      end
    else        
      if data =~ /\A<policy-file-request\s*\/>/
        Log.debug "Sending flash policy #{self.class.policy_content}"
        send_data self.class.policy
        close_connection_after_writing
      else
        handshake data
      end
    end
  end

  def handshake data
    begin
      @request = Request.new(data)
      send_data @request.response
      on_ready
    rescue Exception => ex
      on_error ex
      close_connection
    end
  end
end

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
