class ActividadesController < ApplicationController
  before_filter :login_required
  def index
  end

  def show
  end

  def edit
  end

  def new_or_edit
    @actividad = Actividad.new
  end

  def save
    @empleado = Empleado.find_by_rfc(params[:rfc]) if params[:rfc]
    @empleado ||= Empleado.new
    @actividad = Actividad.new(params[:actividad])
    @actividad.user_id = current_user.id
    if @actividad.save
      flash[:notice] = "Actividad guardada correctamente"
      #redirect_to :controller => "constancia", :action => "generar", :id => @escuela
      redirect_to :action => "index"
    else
      flash[:error] = "No se puedo guardar, verifique el registro"
      render :action => "new_or_edit"
    end
  end

end
