class EventoMailer < ActionMailer::Base
  default from: 'DTIEventos'
  include ApplicationHelper
  def evento_mail(titulo, contenido ,photo, email)
    @contenido = contenido
    @titulo = titulo
    @email = email
    @photo = photo
    attachments.inline[@photo] = File.read(@photo)
    mail(to: @email , subject: 'Nuevo Evento ')
  end

end
