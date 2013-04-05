class CalendarController < ApplicationController
  layout "team"
  before_filter :login_required!, only: [:add_event]
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
    @event = Event.new
  end
  
  def add_event
    redirect_to  :controller => 'event', :action => 'new'
  end
  
end
