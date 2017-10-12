class EventsController < ApplicationController

  before_action :set_event, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = current_user.event
    end

  def show
    @categories = @event.categories
    @photos = @event.photos
  end

  def new
    @event = current_user.event.build
  end

  def create
    @event = current_user.event.build(event_params)

     if @event.save
       image_params.each do |image|
         @event.photos.create(image: image)
       end

       redirect_to events_path, notice: "Event successfully created"
     else
       render :new
     end
  end

  def edit
    if current_user.id == @event.user.id
      @photos = @event.photos
    else
      redirect_to root_path, notice: "You don't have permission."
    end
  end

  def update
    if @event.update(event_params)
      image_params.each do |image|
        @event.photos.create(image: image)
      end

      redirect_to edit_event_path(@event), notice: "Event successfully updated"
    else
      render :edit
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params
      .require(:event)
      .permit(:name, :description, :location, :price, :capacity,
        :includes_food, :includes_drinks, :starts_at, :ends_at,
      :active, category_ids: []
      )
  end

  def image_params
    params[:images].present? ? params.require(:images) : []
  end

end
