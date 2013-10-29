class CreateLocalidads < ActiveRecord::Migration
  def self.up
    create_table :localidads do |t|
      t.integer :municipio_id
      t.string :clave, :limit => 8
      t.string :descripcion, :limit => 60
    end

    add_index :localidads, :clave
    add_index :localidads, :municipio_id
  end

  def self.down
    drop_table :localidads
  end
end
