module Functions

  def selected(relacion)
    if relacion
      @selected=relacion.clave
    else
      @selected=""
    end
    return @selected
  end


  # formato a la Plaza
  def self.formatPlaza(*columnas)
    cod_pago,unidad,subunidad,cat_pto,hrs,cons_pza= columnas.collect{|c|c.to_s}
    pza = "#{cod_pago.rjust(2,'0')}#{unidad.rjust(2,'0')}"
    pza+=  "#{subunidad.rjust(2,'0 ')}"
    pza+= "#{cat_pto}#{hrs.rjust(4,'0')}#{cons_pza.rjust(6,'0')}"
    return pza
  end

  # formato al Centro de Trabajo
  def self.formatCt(ent_fed,ct_c,ct_id,ct_s,ct_dv)
    ct= "#{ent_fed.to_s.rjust(2,'0')}#{ct_c}#{ct_id}"
    ct+="#{ct_s.to_s.rjust(4,'0')}#{ct_dv}"
    return ct
  end



end