class Station < MudServer::Location
  include MudServer::Talkable

  def location_prepositional_phrase
    "in the train station. The escalator back up to the street isn't working. It's cold here. Your train is still at the platform"
  end

  def train
    transfer_to Train
  end

  def destinations
    ['train']
  end
end
