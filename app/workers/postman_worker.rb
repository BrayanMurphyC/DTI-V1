class PostmanWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(titulo , contenido, photo, emails )
      @emails = emails
      @emails.each do |email|
        puts email
        EventoMailer.delay.evento_mail(titulo, contenido ,photo ,email)
      end
  end

end
# comando para correr el sidekiq =  "bundle exec sidekiq -q default -q mailers"
