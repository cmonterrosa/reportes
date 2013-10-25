# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131025183408) do

  create_table "bitacoras", :force => true do |t|
    t.integer  "user_id"
    t.integer  "estatu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bitacoras", ["estatu_id"], :name => "estatus"
  add_index "bitacoras", ["user_id"], :name => "usuario"

  create_table "categoria_escuelas", :force => true do |t|
    t.string "clave",       :limit => 23
    t.string "descripcion", :limit => 30
  end

  create_table "competencias", :force => true do |t|
    t.string   "doc_capacitan_salud",         :limit => 3
    t.string   "doc_capacitan_salud_desc"
    t.string   "doc_capacitan_ma",            :limit => 3
    t.string   "doc_capacitan_ma_desc"
    t.string   "aplica_conocimientos",        :limit => 3
    t.string   "aplica_conocimientos_desc"
    t.string   "esc_desarrolla_proy",         :limit => 3
    t.string   "esc_desarrolla_proy_desc"
    t.string   "esc_prom_des_proy",           :limit => 3
    t.string   "esc_prom_des_proy_desc"
    t.string   "doc_part_temas_ma_s",         :limit => 3
    t.string   "doc_part_temas_ma_s_desc"
    t.string   "doc_interes_proy",            :limit => 3
    t.string   "doc_interes_proy_desc"
    t.string   "doc_suma_acc_edu",            :limit => 3
    t.string   "doc_suma_acc_edu_desc"
    t.string   "esc_prom_cursos",             :limit => 3
    t.string   "esc_prom_cursos_desc"
    t.string   "alu_involucran_proy",         :limit => 3
    t.string   "alu_involucran_proy_desc"
    t.string   "alu_interes_proy",            :limit => 3
    t.string   "alu_interes_proy_desc"
    t.string   "alu_capacitan_salud_ma",      :limit => 3
    t.string   "alu_capacitan_salud_ma_desc"
    t.string   "alu_des_competencias",        :limit => 3
    t.string   "alu_des_competencias_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "diagnostico_id"
  end

  add_index "competencias", ["diagnostico_id"], :name => "diagnostico"

  create_table "consumos", :force => true do |t|
    t.string   "desayunos_escolares",            :limit => 3
    t.string   "tipo_establecimiento",           :limit => 20
    t.string   "aplican_norma_ofic_mex",         :limit => 3
    t.string   "capacita_manejo_prep_alimentos", :limit => 3
    t.string   "disminuido_alim_chatarras",      :limit => 3
    t.string   "alim_norma_ofic_mex",            :limit => 3
    t.string   "alim_bajos_sodio_grasa",         :limit => 3
    t.string   "agua_simple_potable",            :limit => 3
    t.string   "alim_preparan_higienica",        :limit => 3
    t.string   "utensilios_esterilizados",       :limit => 3
    t.string   "recipientes_residuos_solidos",   :limit => 3
    t.string   "material_servir_alim",           :limit => 50
    t.string   "utilizan_popotes",               :limit => 3
    t.string   "libres_fauna_nociva",            :limit => 3
    t.string   "reperc_alim_chatarra",           :limit => 3
    t.string   "platicas_alim_bebidas",          :limit => 3
    t.string   "porcentaje_obesidad",            :limit => 3
    t.string   "inasist_problem_salud",          :limit => 3
    t.string   "enfermedades_gastro",            :limit => 3
    t.string   "enfermedades_gastro_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "diagnostico_id"
  end

  add_index "consumos", ["diagnostico_id"], :name => "diagnostico"

  create_table "diagnosticos", :force => true do |t|
    t.integer  "escuela_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnosticos", ["escuela_id"], :name => "escuela"

  create_table "empleados", :force => true do |t|
    t.string "rfc",     :limit => 13
    t.string "paterno"
    t.string "materno"
    t.string "nombre"
  end

  create_table "entornos", :force => true do |t|
    t.string   "areas_verdes_esc",              :limit => 3
    t.string   "areas_verdes_esc_desc"
    t.string   "cuidado_preserv_reforest",      :limit => 3
    t.string   "cuidado_preserv_reforest_desc"
    t.string   "adopta_areas_verdes",           :limit => 3
    t.string   "adopta_areas_verdes_desc"
    t.string   "promueve_cuidado_salud",        :limit => 3
    t.string   "promueve_cuidado_salud_desc"
    t.string   "promueve_activacion_cartilla",  :limit => 3
    t.string   "participacion_sector_salud",    :limit => 50
    t.string   "promueve_activacion_fisica",    :limit => 3
    t.string   "tiempo_activacion_fisica",      :limit => 200
    t.string   "tipo_suelo"
    t.string   "esc_espacio_fisico"
    t.string   "alrededores_cuenta_av"
    t.string   "aire_libre_contaminantes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "diagnostico_id"
  end

  add_index "entornos", ["diagnostico_id"], :name => "diagnostico"

  create_table "escuelas", :force => true do |t|
    t.string   "region",                        :limit => 60
    t.string   "clave",                         :limit => 15
    t.string   "nombre",                        :limit => 130
    t.string   "zona_escolar",                  :limit => 20
    t.string   "sector",                        :limit => 10
    t.string   "dsr",                           :limit => 4
    t.string   "telefono",                      :limit => 16
    t.string   "modalidad",                     :limit => 100
    t.string   "clave_localidad",               :limit => 10
    t.string   "localidad",                     :limit => 120
    t.string   "clave_municipio",               :limit => 10
    t.string   "municipio",                     :limit => 140
    t.string   "domicilio",                     :limit => 160
    t.string   "correo_electronico",            :limit => 90
    t.string   "nombre_director",               :limit => 130
    t.string   "telefono_director",             :limit => 100
    t.string   "categoria_desc",                :limit => 20
    t.integer  "total_personal_docente"
    t.integer  "total_personal_administrativo"
    t.integer  "total_personal_apoyo"
    t.integer  "nivel_id"
    t.integer  "categoria_escuela_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estatu_id"
  end

  add_index "escuelas", ["categoria_escuela_id"], :name => "categoria_escuela"
  add_index "escuelas", ["clave"], :name => "index_escuelas_on_clave", :unique => true
  add_index "escuelas", ["localidad"], :name => "localidad"
  add_index "escuelas", ["municipio"], :name => "municipio"
  add_index "escuelas", ["nivel_id"], :name => "nivel"

  create_table "estatus", :force => true do |t|
    t.string "clave",       :limit => 10
    t.string "descripcion", :limit => 100
  end

  add_index "estatus", ["clave"], :name => "clave"

  create_table "huellas", :force => true do |t|
    t.string   "mant_instalaciones",               :limit => 3
    t.integer  "computadoras_num"
    t.integer  "computadoras_hrs_diarias"
    t.integer  "impresoras_num"
    t.integer  "impresoras_hrs_diarias"
    t.integer  "proyectores_num"
    t.integer  "proyectores_hrs_diarias"
    t.integer  "reguladores_num"
    t.integer  "reguladores_hrs_diarias"
    t.integer  "ventiladores_num"
    t.string   "ventiladores_hrs_diarias"
    t.integer  "climas_num"
    t.integer  "climas_hrs_diarias"
    t.integer  "enfriadores_num"
    t.integer  "enfriadores_hrs_diarias"
    t.integer  "cafeteras_num"
    t.integer  "cafeteras_hrs_diarias"
    t.integer  "refrigeradores_num"
    t.integer  "refrigeradores_hrs_diarias"
    t.integer  "bombas_agua_num"
    t.integer  "bombas_agua_hrs_diarias"
    t.integer  "aparatos_sonido_num"
    t.integer  "aparatos_sonido_hrs_diarias"
    t.string   "desconectan_equipos_elec",         :limit => 3
    t.string   "utilizan_lamp_ahorradoras",        :limit => 3
    t.string   "aprovecha_luz_natural",            :limit => 3
    t.integer  "tipo_agua_id"
    t.integer  "potabilidad_agua_id"
    t.integer  "sanitarios_num"
    t.string   "sanitarios_fugas",                 :limit => 3
    t.integer  "bebederos_num"
    t.string   "bebederos_fugas",                  :limit => 3
    t.integer  "tomas_agua_num"
    t.string   "tomas_agua_fugas",                 :limit => 3
    t.integer  "cisternas_num"
    t.string   "cisternas_fugas",                  :limit => 3
    t.string   "captacion_agua_pluv",              :limit => 3
    t.string   "reutiliza_agua",                   :limit => 3
    t.string   "reutiliza_agua_desc"
    t.string   "recip_residuos_solid",             :limit => 3
    t.integer  "recip_residuos_solid_num"
    t.string   "separa_residuos_org_inorg",        :limit => 3
    t.string   "elabora_compostas_residuos",       :limit => 3
    t.string   "cuenta_recipientes_org_inorg",     :limit => 3
    t.integer  "cuenta_recipientes_org_inorg_num"
    t.string   "meca_elim_residuos_solid"
    t.string   "act_reutiliza_residuos",           :limit => 3
    t.string   "act_reutiliza_residuos_desc"
    t.integer  "diagnostico_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "huellas", ["diagnostico_id"], :name => "diagnostico"

  create_table "nivels", :force => true do |t|
    t.integer "clave"
    t.string  "descripcion", :limit => 60
  end

  add_index "nivels", ["clave"], :name => "clave"

  create_table "participacions", :force => true do |t|
    t.string   "familia_involucran_actividades",      :limit => 3
    t.string   "familia_involucran_actividades_desc"
    t.string   "esc_participa_proy",                  :limit => 3
    t.string   "esc_participa_proy_desc"
    t.string   "esc_capacita_salud_ma",               :limit => 3
    t.string   "esc_capacita_salud_ma_desc"
    t.string   "padres_participan_proy",              :limit => 3
    t.string   "padres_participan_proy_desc"
    t.string   "proy_vincula_comunidad",              :limit => 3
    t.string   "proy_vincula_comunidad_desc"
    t.string   "familia_participa_acciones",          :limit => 3
    t.string   "familia_participa_acciones_desc"
    t.string   "acciones_padres_ma_desc"
    t.string   "padres_aprov_esc_hijos_desc"
    t.string   "promueven_aprendizajes_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "diagnostico_id"
  end

  add_index "participacions", ["diagnostico_id"], :name => "diagnostico"

  create_table "potabilidad_aguas", :force => true do |t|
    t.string "descripcion", :limit => 12
  end

  create_table "programas", :force => true do |t|
    t.string "clave",       :limit => 3
    t.string "descripcion", :limit => 110
  end

  create_table "proyectos", :force => true do |t|
    t.integer  "escuela_id"
    t.string   "clave"
    t.string   "participa_programa",             :limit => 120
    t.string   "nombre",                         :limit => 120
    t.string   "responsables",                   :limit => 200
    t.string   "telefono_responsable",           :limit => 16
    t.string   "correo_electronico_responsable"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "programa_id"
  end

  add_index "proyectos", ["escuela_id"], :name => "escuela_proyecto"

  create_table "roles", :force => true do |t|
    t.string "name"
    t.string "descripcion", :limit => 60
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "tipo_aguas", :force => true do |t|
    t.string "descripcion", :limit => 12
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "rfc",                       :limit => 13
    t.string   "paterno",                   :limit => 40
    t.string   "materno",                   :limit => 40
    t.string   "nombre",                    :limit => 60
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "escuela_id"
    t.boolean  "blocked"
  end

  add_index "users", ["escuela_id"], :name => "index_users_on_escuela_id"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["rfc"], :name => "index_users_on_rfc"

end
