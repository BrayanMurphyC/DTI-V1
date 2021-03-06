class ArticulosController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy,:new,:create]
  before_action :set_articulo, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.all
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
    @articulo.update_visitas
    @tags = @articulo.tags.split(",")
  end

  # GET /articulos/new
  def new
    @articulo = Articulo.new
  end

  # GET /articulos/1/edit
  def edit
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @user = current_user
    @articulo = @user.articulos.new(articulo_params)

    respond_to do |format|
      if @articulo.save
        format.html { redirect_to @articulo, notice: 'Articulo was successfully created.' }
        format.json { render :show, status: :created, location: @articulo }
      else
        format.html { render :new }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    respond_to do |format|
      if @articulo.update(articulo_params)
        format.html { redirect_to @articulo, notice: 'Articulo was successfully updated.' }
        format.json { render :show, status: :ok, location: @articulo }
      else
        format.html { render :edit }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to articulos_url, notice: 'Articulo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @articulo.upvote_by current_subscriber
    redirect_to @articulo
  end

  def downvote
    @articulo.downvote_by current_subscriber
    redirect_to @articulo
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo = Articulo.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:title, :body, :tags, :cover_article, :slug)
    end
end
