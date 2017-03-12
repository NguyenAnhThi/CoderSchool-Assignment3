class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.search(params[:search])
    else
      @events = Event.upcoming.published
    end
  end

  def mine
    @events_id = current_user.events.all.select(:id)
    @events = Event.where(id: @events_id)
  end

  def publish
    set_event
    if @event.have_enough_ticket_types?
      @event.published_at = Time.now
      @event.save!
      redirect_to root_path, flash: {success: 'Event has been published'}
    else
      flash[:error] = "An event must have at least one `ticket_type` defined before it can be published"
      redirect_to event_path
    end
  end

  def show
    set_event
  end

  def new
    @event = Event.new
    @categories = Category.all
    @venues = Venue.all
  end

  def create
    @event = Event.new event_params
    @categories = Category.all
    @venues = Venue.all
    @event.creater = current_user

    if @event.save
      flash[:success] = "Event created successfully."
      redirect_to root_path
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      redirect_to new_event_path
    end
  end

  def edit
    set_event
    @categories = Category.all
    @venues = Venue.all
  end

  def update
    set_event
    @categories = Category.all
    @venues = Venue.all

    if @event.update(event_params)
      flash[:success] = "Event updated successfully."
      redirect_to show
    else
      flash[:error] = @event.errors.full_messages.to_sentence
      redirect_to edit_event_path
    end
  end

  private
  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :venue_id, :hero_image_url, :extended_html_description, :category_id, :name)
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end
end
