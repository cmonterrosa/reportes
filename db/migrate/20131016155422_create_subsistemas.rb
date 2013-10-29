class CreateSubsistemas < ActiveRecord::Migration
  def self.up
    create_table :subsistemas do |t|
      t.string :descripcion
    end

    Subsistema.create(:descripcion => "FEDERALIZADO")
    Subsistema.create(:descripcion => "ESTATAL")
  end

  def self.down
    drop_table :subsistemas
  end
end
