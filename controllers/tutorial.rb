class Tutorial < MudServer::AbstractController
  def on_start
    send_text "What's your name?"
    send_text "[Enter SAY followed by your name]"
  end

  def say
    @session.instance_variable_set("@name", params)
    send_text "Your name is #{params}."
    transfer_to Train
  end

  def allowed_methods
    super + ['say']
  end

end
