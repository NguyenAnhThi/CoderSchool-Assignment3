class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user,
                :signed_in?,
                :is_event_creater?,
                :event_edit_permission,
                :is_published

  def current_user
    return @current_user if @current_user

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def is_event_creater?
    @event = Event.find(Event.find(params[:id]))

    if @event.creater == current_user
      true
    else
      false
    end
  end

  def event_edit_permission?
    if !is_event_creater?
      flash[:notice] = "You must be the event creater to see this page"
      redirect_to root_path
    end
  end

  def is_published?
    @event = Event.find(Event.find(params[:id]))

    if @event.published_at == nil
      false
    else
      true
    end
  end
end
