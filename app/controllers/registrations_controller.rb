class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    respond_to do |format|
      if resource.save
        format.html { redirect_to root_path, notice: 'Registrado correctamente, confirme en su correo electronico' }
      else
      format.html { redirect_to root_path, notice: 'Datos no validos por favor compruebe los campos' }
      end
    end
  end
  private

  def sign_up_params
    params.require(:subscriber).permit(:email, :nombres , :dni, :titulo, :institucion, :empresa, :area, :bio, :telefono, :pais, :departamento, :provincia, :cargo, :sexo, :nacimiento, :facebook, :twiter, :sitio, :localizacion, :password, :password_confirmation, :tags => [])
  end

  def account_update_params
    params.require(:subscriber).permit(:email, :nombres , :dni, :titulo, :institucion, :empresa, :area, :bio, :telefono, :pais, :departamento, :provincia, :cargo, :sexo, :nacimiento, :facebook, :twiter, :sitio, :localizacion, :password, :password_confirmation, :current_password,:profile, :tags => [])
  end
end
