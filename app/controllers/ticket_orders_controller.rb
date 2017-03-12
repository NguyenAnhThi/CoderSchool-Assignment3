class TicketOrdersController < ApplicationController
  before_action :set_ticket_order, only: [:show]

  def show
  end

  def new
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket_order = TicketOrder.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket_order = TicketOrder.new ticket_order_params
    if @ticket_order.quantity <= @ticket_types.find(@ticket_order.ticket_type).max_quantity
      if @ticket_order.save
        @ticket_order.total_price_calc
        @ticket_order.quantity_remain
        redirect_to event_ticket_order_path(id: @ticket_order.id), flash: {success: 'Ordered successfully'}
      else
        flash[:error] = @ticket_order.errors.full_messages.to_sentence
        render 'new'
      end
    else
      flash[:error] = 'Sorry! We do not have enought ticket :('
      render 'new'
    end

  end

  private
  def set_ticket_order
    @ticket_order = TicketOrder.find(params[:id])
  end

  def ticket_order_params
    params.require(:ticket_order).permit(:ticket_type_id, :name, :phone, :address, :quantity)
  end
end
