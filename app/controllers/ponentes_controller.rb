class PonentesController < ApplicationController
  before_action :set_ponente, only: [:show, :edit, :update, :destroy]


  def index
    @ponentes = Ponente.all
  end

  def show
  end

  def new
    @ponente = Ponente.new
  end

  def edit
  end

  def create
    @ponente = Ponente.new(ponente_params)

    respond_to do |format|
      if @ponente.save
        format.html { redirect_to @ponente, notice: 'Ponente was successfully created.' }
        format.json { render :show, status: :created, location: @ponente }
      else
        format.html { render :new }
        format.json { render json: @ponente.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ponente.update(ponente_params)
        format.html { redirect_to @ponente, notice: 'Ponente was successfully updated.' }
        format.json { render :show, status: :ok, location: @ponente }
      else
        format.html { render :edit }
        format.json { render json: @ponente.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ponente.destroy
    respond_to do |format|
      format.html { redirect_to ponentes_url, notice: 'Ponente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_ponente
      @ponente = Ponente.find(params[:id])
    end

    def ponente_params
      params.require(:ponente).permit(:dni, :nombres, :correo, :telefono, :bio, :profile , :tags)
    end
end
