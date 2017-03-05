class VenuesController < ApplicationController
  def new
    @venue = Venue.new
    @regions = Region.all
  end

  def create
    @venue = Venue.new venue_params
    @regions = Region.all

    if @venue.save
      flash[:success] = "Venue created successfully."
      redirect_to new_event_path
    else
      flash[:error] = @venue.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private
  def venue_params
    params.require(:venue).permit( :name, :full_address, :region_id)
  end
end