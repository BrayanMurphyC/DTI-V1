class PerfilController < ApplicationController
    before_action :authenticate_subscriber!
  def index
    @perfil_eventos = RegistroEvento.where(subscriber_id: current_subscriber)
end
end
