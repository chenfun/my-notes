class EventsController < ApplicationController
  before_filter :find_event, :only => [ :show, :edit, :update, :destroy]


  def index
    # @events = Event.all
    @events = Event.page(params[:page]).per(5)


    session[:eve] = 'play baseball'

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
      format.atom { @feed_title = "My event list" } # index.atom.builder
    end

  end

  def new
    @event = Event.new

    flash[:alert] = session[:eve]
    # flash[:alert] = "event2 is #{@event2.name} , desc  is ==> #{@event.description}"
  end

  def create
    @event = Event.new(event_parms)

    if @event.save
      flash[:notice] = "event was successfully updated"
      # redirect_to :action => :index
      redirect_to events_url
    else
      # render :action => :new
      render  new_event_url
    end

  end

  def show
    # @event = Event.find(params[:id])
    # @page_title = @event.name

    respond_to do |format|
      format.html do  # show.html.erb
        @page_title = @event.name
        @pp = @event.description
      end
      format.xml
      # format.json { render  :json => { id: @event.id, name: @event.name, desc: @event.description }.to_json }
      format.json { render  :json => @event.to_json }
    end

  end

  def edit
    # @event = Event.find(params[:id])
  end

  def update
    # @event = Event.find(params[:id])

    if @event.update_attributes(event_parms)
      flash[:notice] = "event was successfully updated"
      # redirect_to :action => :show, :id => @event
      redirect_to event_url(@event)
    else
      render edit_event_url
      # render :action => :edit
    end

  end

  def destroy
    # @event = Event.find(params[:id])
    @event.destroy

    flash[:alert] = "event was successfully deleted"
    # redirect_to :action => :index
    redirect_to events_url
  end

  def event_parms
    params.require(:event).permit(:name, :description)
  end

  protected
  def find_event
    @event = Event.find(params[:id])
  end

end
