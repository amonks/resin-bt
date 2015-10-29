require_relative './mud/lib/ruby_mud.rb'
Dir["./controllers/*.rb"].each {|file| require file }

require 'pry'

$title = 'TrainGame'

# Controllers define the action for a menu / sub-game. Eg: Login screen,
# main game, map screen, etc.. By default, the server will start new connections
# in MudServer::DefaultController.
class MudServer::DefaultController < MudServer::AbstractController
  def on_start
    # Send messages via send_text.
    send_text "Welcome!"
    send_text "This is a multiplayer game you play by typing."
    send_text "You can type HELP at any time to get a list of available commands"
    send_text "Type `OK` to start."
  end

  def ok
    transfer_to Tutorial
  end

  # For security, you must explicitly whitelist any commands that you want to
  # give players access to. Otherwise they will not be accessible by users.
  def allowed_methods
    super + ['ok'] # Quit is available by default via `super`
  end
end

$server = MudServer.new '0.0.0.0', '1234' # Run server on all IPs on port 4321.
                                         # Defaults to 0.0.0.0:4000 if none set.
$server.start # Accept connections

puts "listening on port #{$server.port}"
puts "Press enter to exit."

c = 'ok!'
until c == ''
  c = gets.chomp
  $server.stop if c == ''
  $server.broadcast c, "The Server"
end
