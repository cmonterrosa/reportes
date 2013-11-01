class CreateEmpleadoPlazas < ActiveRecord::Migration
  def self.up
    create_table :empleado_plazas do |t|
      t.integer :empleado_id
      t.string :rfc, :limit => 13
      t.string :clave_presupuestal, :limit => 30
      t.string :ct, :limit => 12
    end

    add_index :empleado_plazas, :rfc
    add_index :empleado_plazas, :empleado_id
    add_index :empleado_plazas, :clave_presupuestal

     ################# CARGAMOS TOTALIDA DE CATALOGO DE PLAZAS ###########################

      ### Creamos municipios ###
        cont_mun=1
        File.open("#{RAILS_ROOT}/db/migrate/catalogos/municipios.csv").each_line { |line|
          #!|7|0|CHIAPAS|
          v,st,clave,descripcion = line.split("|")
          Municipio.create(:clave => clave, :descripcion => descripcion)
          puts "M #{cont_mun}"
          cont_mun+=1
         }

        ### Creamos localidades ####
        cont_local=1
         File.open("#{RAILS_ROOT}/db/migrate/catalogos/localidades.csv").each_line { |line|
          #!|7|12|146|999999|199901|2|0|R|0|232|60.0|VISTAHERMOSA|
          v,st,mun,clave,fin,inicio,x,y,z,h,i,ec,descripcion = line.split("|")
          municipio = Municipio.find_by_clave(mun)
          Localidad.create(:municipio_id => municipio.id, :clave => clave, :descripcion => descripcion)
          puts "L #{cont_local}"
          cont_local+=1
         }



        #---- Cargamos el catalogo de empleados ------
        contador=1
        File.open("#{RAILS_ROOT}/db/migrate/catalogos/plazas.csv").each_line { |line|
        begin
         #ZEMI6106197DA|ZEMI610619MCSNRR03|7|62|60|  E1587|0.0|13|7|D|BA|1|M|1|101|
         federalizado = Subsistema.find_by_descripcion("FEDERALIZADO")
         rfc,curp,cod_pago,unidad,subunidad,cat_pto,hrs,cons_pza,ent_fed,ct_id, ct_c, ct_s, ct_dv, municipio, localidad = line.split("|")

        #### Formateamos plaza y ct ######
        ct = formatct(ent_fed,ct_c,ct_id,ct_s,ct_dv)
        pza = formatplaza(cod_pago,unidad,subunidad,cat_pto,hrs,cons_pza)

        cve_municipio = (Municipio.find_by_clave(municipio)) ? Municipio.find_by_clave(municipio).id : nil
        cve_localidad = (Localidad.find_by_clave(localidad)) ? Localidad.find_by_clave(localidad).id : nil

        @ct = Centrotrabajo.find_by_clave(ct)
        @centro_trabajo = (@ct) ? @ct : nil
        #formateamos la plaza

        @plaza = Plaza.new(:clave_presupuestal => pza,
                  :subsistema_id => federalizado,
                  :centro_trabajo_id => @centro_trabajo,
                  :municipio_id => cve_municipio,
                  :localidad_id => cve_localidad)

        ## Creamos el registro en Empleado PLaza ###
        @empleado_plaza = EmpleadoPlaza.new(:rfc => rfc, :clave_presupuestal => pza, :ct => ct)
        @empleado = Empleado.find_by_rfc(rfc)
        @empleado.update_attributes(:curp => curp) if @empleado
        @empleado_plaza.empleado_id = @empleado.id if @empleado
        
        if @plaza.save && @empleado_plaza.save
            puts "=> EP #{contador}"
            contador+=1
        end

      rescue => e
        puts e
      end
     }
 end

  # formato a la Plaza
  def self.formatplaza(*columnas)
    cod_pago,unidad,subunidad,cat_pto,hrs,cons_pza= columnas.collect{|c|c.to_s}
    pza = "#{cod_pago.rjust(2,'0')}#{unidad.rjust(2,'0')}"
    pza+=  "#{subunidad.rjust(2,'0 ')}"
    pza+= "#{cat_pto}#{hrs.rjust(4,'0')}#{cons_pza.rjust(6,'0')}"
    return pza
  end

  # formato al Centro de Trabajo
  def self.formatct(ent_fed,ct_c,ct_id,ct_s,ct_dv)
    ct= "#{ent_fed.to_s.rjust(2,'0')}#{ct_c}#{ct_id}"
    ct+="#{ct_s.to_s.rjust(4,'0')}#{ct_dv}"
    return ct
  end



  def self.down
    drop_table :empleado_plazas
  end
end
