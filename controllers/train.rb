class Train < MudServer::Location
  include MudServer::Talkable

  def location_prepositional_phrase
    "on a train. It isn't moving"
  end

  def station
    transfer_to Station
  end

  def destinations
    ['station']
  end
end
