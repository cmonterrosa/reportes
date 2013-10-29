class CreateMunicipios < ActiveRecord::Migration
  def self.up
    create_table :municipios do |t|
      t.string :clave, :limit => 8
      t.string :descripcion, :limit => 60
    end

  add_index :municipios, :clave

  end

  def self.down
    drop_table :municipios
  end
end
