class EmpleadoPlaza < ActiveRecord::Base
belongs_to :empleado
belongs_to :plaza
end
