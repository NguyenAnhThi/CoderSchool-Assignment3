class TicketsController < ApplicationController
  before_action :set_ticket_type, only: [:destroy]

  def new
    @event = Event.find(params[:event_id])
    if params[:name]
      @ticket_type = TicketType.new(ticket_type_params)
      if @ticket_type.save
        redirect_to new_event_ticket_path
      else
        flash[:error] = @ticket_type.errors.full_messages.to_sentence
        redirect_to new_event_ticket_path
      end


    end
  end

  def destroy
    @ticket_type.destroy
    redirect_to new_event_ticket_path
  end

  private
  def set_ticket_type
    @event = Event.find(params[:event_id])
    @ticket_type = @event.ticket_types.find(params[:id])
  end

  def ticket_type_params
    params.permit(:event_id, :name, :price, :max_quantity)
  end
end
