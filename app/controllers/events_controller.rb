class EventsController < ApplicationController
  # require 'koala'
  include ApplicationHelper
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:edit, :update, :destroy,:new,:create]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  SLEEP_BEFORE_CHECKING_BG_STATUS = 1
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  def index
    @events = Event.order('start DESC')
  end

  def show
    @event.update_view_count
    @from_time = Time.now
    @subscriber = current_subscriber
    @registro_eventos = RegistroEvento.where(["subscriber_id = ? and event_id = ?",@subscriber, @event])
    @registro_evento = RegistroEvento.new
    @evento_ponente = EventoPonente.new
    @evento_ponentes = EventoPonente.where(["event_id = ?", @event])
    @ponentes = Ponente.all
  end

  def new
    @event = Event.new
  end

  def edit
  end


  def create
    @user = current_user
    @event = @user.events.new(event_params)
    @emails ||= []
    respond_to do |format|
      if @event.save
        # filtra emails
        @subs = Subscriber.all
        @subs.each do |s|
           @prefer = s.tags
           @tags = @event.tags
           @c = @prefer & @tags
           unless(@c.empty?)
             @emails.push(s.email)
           end
        end
        # EventoMailer.evento_mail(@event.title, @event.body, @event.photo).deliver
        PostmanWorker.perform_async(@event.title, @event.body, @event.photo.path, @emails )


        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        # page_wall_post
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def page_wall_post
        @access_token = 'EAAbhldvvjjMBAH1RPAdhL5phRkSB3iku1uwuSVKSQZAaSHs0QoOSF7IQqqGJEFthhirEyzXeo4ZCxvCOlgE8wh0M7C224SnEuMqz2ZAv56zNOmoJJ534fw3aFaNJcMsObRZBaDqJD4V9tjgw1k3cIIQIZAusVVLQZD'
        @graph = user = Koala::Facebook::API.new(@access_token)
        page_token = user.get_page_access_token(881641215272116)
        @page = Koala::Facebook::API.new(page_token)
        @picture = @page.put_picture(open(@event.photo.path), {:message => " #{@event.title} Inscripciones Aqui: http://www.localhost:3000/eventos/#{@event.id}" }, 882595851843319)

        @access_token = params[:access_token].present? ? params[:access_token] : @access_token
  end

  def upvote
    @event.upvote_by current_subscriber
    redirect_to @event
  end

  def downvote
    @event.downvote_by current_subscriber
    redirect_to @event
  end

  private
    def set_event
      @user = current_user
      @event = Event.friendly.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :body, :start, :view_count, :user_id, :photo, :cover, :lugar, :slug, :tags => [])
    end
end
