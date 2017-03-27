class EventoPonentesController < ApplicationController
  before_action :set_evento_ponente, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:create, :new]

  def index
    @evento_ponentes = EventoPonente.all
  end


  def show
  end

  def new
    @evento_ponente = EventoPonente.new
  end

  def edit
  end

  def create
    @evento_ponente = EventoPonente.new(evento_ponente_params)
    @evento_ponente.event = @event
    @evento_ponentes = EventoPonente.where(["event_id = ?", @event])
    

    respond_to do |format|
      if @evento_ponente.save
        format.html { redirect_to @event, notice: 'Evento ponente was successfully created.' }
        format.json { render :show, status: :created, location: @evento_ponente }
        format.js
      else
        format.html { render :new }
        format.json { render json: @evento_ponente.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @evento_ponente.update(evento_ponente_params)
        format.html { redirect_to @evento_ponente, notice: 'Evento ponente was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento_ponente }
      else
        format.html { render :edit }
        format.json { render json: @evento_ponente.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evento_ponente.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Evento ponente was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private

    def set_event
      @event = Event.friendly.find(params[:event_id])
    end

    def set_evento_ponente
      @evento_ponente = EventoPonente.find(params[:id])
    end

    def evento_ponente_params
      params.require(:evento_ponente).permit(:tema, :rate, :ponente_id, :event_id)
    end
end
