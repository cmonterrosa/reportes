class CreateActividads < ActiveRecord::Migration
  def self.up
    create_table :actividads do |t|
      t.integer :user_id
      t.string :rfc, :limit => 13
      t.datetime :fechahora
      t.string :descripcion_corta, :limit => 80
      t.string :detalles, :limit => 255
      t.timestamps
    end

     add_index :actividads, :user_id
     add_index :actividads, :rfc
  end

  def self.down
    drop_table :actividads
  end
end
