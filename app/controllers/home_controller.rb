class HomeController < ApplicationController
  def index
    @events = Event.order('start DESC').limit(9)
    @articulos = Articulo.order('updated_at DESC').limit(9)
  end
end
