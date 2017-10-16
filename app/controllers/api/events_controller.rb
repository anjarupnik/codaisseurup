class Api::EventsController < ApplicationController
  def index
    render status: 200, json: {
      events: Event.all
    }.to_json
  end
end
