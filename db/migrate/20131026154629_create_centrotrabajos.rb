class CreateCentrotrabajos < ActiveRecord::Migration
  def self.up
    create_table :centrotrabajos do |t|
      t.string :clave, :limit => 30
      t.string :nombre, :limit => 120
      t.string :direccion, :limit => 120
      t.string :poblacion, :limit => 120
      t.string :subsistema_id
    end

   add_index :centrotrabajos, :clave
   add_index :centrotrabajos, :subsistema_id



        #---- Cargamos el catalogo de empleados ------
      contador=1
      File.open("#{RAILS_ROOT}/db/migrate/catalogos/cts.csv").each_line { |line|
      begin
        #ent_fed,ct_id, ct_clasif, ct_secuencial, ct_digito_ver, descripcion, ct_dom_calle, ct_dom_pob
        #7|CI|F|1|B|PROCURADURIAS INDIGENAS|PRIMERA PONIENTE NUM. 12 Y TERCERA AVENIDA SUR|MOTOZINTLA|


        #--- Datos de plaza ---

        #t.string :clave_presupuestal
        #t.integer :subsistema_id
        #t.integer :centro_trabajo_id



        federalizado = Subsistema.find_by_descripcion("FEDERALIZADO")
        ent_fed,ct_id, ct_c, ct_s, ct_dv, descripcion, ct_dom_calle, ct_dom_pob = line.split("|")
        ### Formateamos el ct
        ct= "#{ent_fed.to_s.rjust(2,'0')}#{ct_c}#{ct_id}"
        ct+="#{ct_s.to_s.rjust(4,'0')}#{ct_dv}"

        @ct = Centrotrabajo.new(:clave => ct, :nombre => descripcion, :direccion => ct_dom_calle, :poblacion => ct_dom_pob, :subsistema_id => federalizado)
        if @ct.save
            puts "=> CT #{contador}"
            contador+=1
         end

      rescue => e
        puts e
      end
     }


  end

  def self.down
    drop_table :centrotrabajos
  end

end
