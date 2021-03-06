class EventsController < ApplicationController
  layout "team"
  before_filter :login_required!, only: [:create, :new, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # POST /event/update
  def update_attendance
    @event = Event.find(params[:id])
    @attendance = Hash.new
    params.each do |key, value|
      next unless key.include? "@"
      @attendance[key] = [@event.attendance[key][0], (value == "1" ? true : false)]
    end
    @event.attendance = @attendance
    @event.save!

    redirect_to "/events/#{params[:id]}"    
  end
    
  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to "/team/calendar", notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  # POST /events/rsvp
  def rsvp
    @results = Hash.new
    params.each do |key, value|
      next unless key =~ /rsvp_[0-9]*/
      e = Event.find(key.split("_").last)
      e.attendance[params[:user][:email]][0] = value[:rsvp] == "1" ? 1 : 0
      e.save!
      @results[key] = params[key]
    end
  end
end
