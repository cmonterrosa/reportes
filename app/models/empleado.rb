class Empleado < ActiveRecord::Base

def nombre_completo
  "#{self.nombre} #{self.paterno} #{self.nombre}"
end  

end
