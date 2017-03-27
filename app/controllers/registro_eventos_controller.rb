class RegistroEventosController < ApplicationController
  before_action :authenticate_subscriber!, except: [:index]
  before_action :authenticate_user!, only: [:index]
  before_action :set_registro_evento, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:create, :new, :index]
  def index
    @registro_eventos = RegistroEvento.where(["event_id = ?", @event])
  end

  def show
  end

  def new
    @registro_evento = RegistroEvento.new
  end

  def edit

  end

  def create
    @subscriber = current_subscriber
    @registro_evento = @subscriber.registro_eventos.new(registro_evento_params)
    @registro_evento.event = @event


    respond_to do |format|
      if @registro_evento.save
        format.html { redirect_to @event }
        format.json { render :show, status: :created, location: @registro_evento }
        # format.js
      else
        format.html { render :new }
        format.json { render json: @registro_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @registro_evento.update(registro_evento_params)
        format.html { redirect_to @registro_evento, notice: 'Registro evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @registro_evento }
      else
        format.html { render :edit }
        format.json { render json: @registro_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @registro_evento.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    def set_event
      @event = Event.friendly.find(params[:event_id])
    end
    def set_registro_evento
      @subscriber = current_subscriber
      @registro_evento = RegistroEvento.find(params[:id])
    end

    def registro_evento_params
      params.require(:registro_evento).permit( :event_id, :subscriber_id)
    end
end
