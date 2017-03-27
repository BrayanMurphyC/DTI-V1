class AddFormularioToSubscribers < ActiveRecord::Migration[5.0]
  def change
    add_column :subscribers, :titulo, :string
    add_column :subscribers, :institucion, :string
    add_column :subscribers, :empresa, :string
    add_column :subscribers, :area, :string
    add_column :subscribers, :cargo, :string
    add_column :subscribers, :bio, :text
    add_column :subscribers, :telefono, :string
    add_column :subscribers, :pais, :string
    add_column :subscribers, :departamento, :string
    add_column :subscribers, :provincia, :string
    add_column :subscribers, :nacionalidad, :string
    add_column :subscribers, :sexo, :boolean
    add_column :subscribers, :nacimiento, :date
    add_column :subscribers, :facebook, :string
    add_column :subscribers, :twiter, :string
    add_column :subscribers, :sitio, :string
    add_column :subscribers, :localizacion, :string
  end
end
