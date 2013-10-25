class CreateEmpleados < ActiveRecord::Migration
  def self.up
    create_table :empleados do |t|
      t.string :rfc, :limit => 13
      t.string :paterno
      t.string :materno
      t.string :nombre
    end


    Empleado.create(:rfc => "MOLC8509121S0", :paterno => "MONTERROSA", :materno => "LOPEZ", :nombre => "CARLOS AUGUSTO")

  end

  def self.down
    drop_table :empleados
  end
end
