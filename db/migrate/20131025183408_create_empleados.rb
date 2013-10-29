class CreateEmpleados < ActiveRecord::Migration
  def self.up
    create_table :empleados do |t|
      t.string :rfc, :limit => 13
      t.string :curp, :limit => 18
      t.string :paterno
      t.string :materno
      t.string :nombre
    end

    add_index :users, :rfc, :unique => true


      #---- Cargamos el catalogo de empleados ------
      contador=1
      File.open("#{RAILS_ROOT}/db/migrate/catalogos/empleados.csv").each_line { |line|
      begin
        #DOLS5710158C6,\ ,DOMINGUEZ,LOPEZ,SOLEDAD,
        rfc,curp,paterno,materno,nombre = line.split(",")
        @empleado = Empleado.new(:rfc=> rfc.strip, :paterno => paterno.strip, :materno => materno.strip, :nombre => nombre.strip)

        if @empleado.save
            puts "=> #{contador}"
            contador+=1
         end

      rescue => e
        puts e
      end
     }






  end

  def self.down
    drop_table :empleados
  end
end
