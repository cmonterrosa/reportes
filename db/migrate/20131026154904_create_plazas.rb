class CreatePlazas < ActiveRecord::Migration
  def self.up
    create_table :plazas do |t|
      t.string :clave_presupuestal
      t.integer :subsistema_id
      t.integer :centro_trabajo_id
      t.integer :municipio_id
      t.integer :localidad_id
    end

      add_index :plazas, :clave_presupuestal
      add_index :plazas, :subsistema_id
      add_index :plazas, :centro_trabajo_id
      add_index :plazas, [:clave_presupuestal, :subsistema_id], :name => "plaza_sub"
  end







  def self.down
    drop_table :plazas
  end
end
