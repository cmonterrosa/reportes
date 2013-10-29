include SendDocHelper
class CartaCompromisoController < ApplicationController
  before_filter :login_required
   #----------- Cambio de idioma de las fechas --------------------
  Date::MONTHNAMES = [nil] + %w(Enero Febrero Marzo Abril Mayo Junio Julio Agosto Septiembre Octubre Noviembre Diciembre)
  Date::DAYNAMES = %w(Domingo Lunes Martes Miercoles Jueves Viernes Sábado)
  Date::ABBR_MONTHNAMES = [nil] + %w(ene Feb Mar Abr May Jun Jul Ago Sep Oct Nov Dic)
  Date::ABBR_DAYNAMES = %w(Dom Lun Mar Mie Jue Vie Sab)

  def index
    @user = current_user
    @empleado = Empleado.find_by_rfc(current_user.login.upcase)
    @plazas_por_empleado = EmpleadoPlaza.find_by_rfc(@empleado.rfc) if @empleado
    
    #render :text => "Empleados encontrados: #{@empleado.rfc}"
  end

    def imprimir
    @plaza = Plaza.find(params[:id])
    if @plaza
      param=Hash.new {|k, v| k[v] = {:tipo=>"",:valor=>""}}
      #-- Parametros

      #        FECHA
      #ESCUELA
      #CLAVE
      #LOCALIDAD
      #MUNICIPIO
      #TRABAJADOR
      #RFC
      #CORREO
      #CLAVE_PRESUPUESTAL

      param["P_TRABAJADOR"]={:tipo=>"String", :valor=>clean_string("CARLOS AUGUSTO MONTERROSA LOPEZ")}
      param["P_ESCUELA"]={:tipo=>"String", :valor=>clean_string("21 DE AGOSTO")}
      param["P_CLAVE"]={:tipo=>"String", :valor=>clean_string("07EPRO209E")}
      param["P_RFC"]={:tipo=>"String", :valor=>clean_string("MOLC8509121S0")}
      param["P_LOCALIDAD"]={:tipo=>"String", :valor=>clean_string("LAS CRUCES")}
      param["P_MUNICIPIO"]={:tipo=>"String", :valor=>clean_string("TUXTLA GUTIERREZ")}
      param["P_CORREO"]={:tipo=>"String", :valor=>clean_string("XXXX@GMAIL.COM")}
      param["P_CLAVE_PRESUPUESTAL"]={:tipo=>"String", :valor=>clean_string("E0363XXXXXXXXXXXXXX")}
     
      param["P_FECHA"]={:tipo=>"String", :valor=>DateTime.now.strftime("%d de %B de %Y").upcase}
      
#      param["P_DIRECTOR"]= (@escuela.nombre_director) ? {:tipo=>"String", :valor=>@escuela.nombre_director} : {:tipo=>"String", :valor=>" "}
#      param["P_CLAVE"]={:tipo=>"String", :valor=>@escuela.clave}
#      param["P_LOCALIDAD"]={:tipo=>"String", :valor=>@escuela.localidad}
#      param["P_MUNICIPIO"]={:tipo=>"String", :valor=>@escuela.municipio}
      if File.exists?(REPORTS_DIR + "/carta_compromiso.jasper")
        send_doc_jdbc("carta_compromiso", "carta_compromiso", param, output_type = 'pdf')
      else
        render :text => "Error"
      end
    else
      render :text => "Imposible generar reporte involucrado, verifique los parámetros"
    end
  end

end
