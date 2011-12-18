# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111218155652) do

  create_table "admins", :force => true do |t|
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "alimentar_planos", :force => true do |t|
    t.date     "data"
    t.text     "pequenoalmoco"
    t.text     "manha"
    t.text     "almoco"
    t.text     "tarde"
    t.text     "jantar"
    t.text     "ceia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "aulas", :force => true do |t|
    t.integer   "staff_id"
    t.integer   "estudio_id"
    t.integer   "tipo_aula_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "ginasio_id"
    t.integer   "dia"
    t.integer   "duracao"
    t.time      "inicio"
  end

  add_index "aulas", ["estudio_id"], :name => "index_aulas_on_estudio_id"
  add_index "aulas", ["staff_id"], :name => "index_aulas_on_staff_id"
  add_index "aulas", ["tipo_aula_id"], :name => "index_aulas_on_tipo_aula_id"

  create_table "cidades", :force => true do |t|
    t.string    "nome"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.float     "latitude"
    t.float     "longitude"
  end

  create_table "estudios", :force => true do |t|
    t.string    "nome"
    t.integer   "lotacao"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "ginasio_id"
  end

  create_table "exercicios", :force => true do |t|
    t.string    "nome"
    t.string    "maquina"
    t.string    "tipo"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "exercicios_planos", :id => false, :force => true do |t|
    t.integer   "peso"
    t.integer   "series"
    t.integer   "repeticoes"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "plano_id"
    t.integer   "exercicio_id"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer   "aula_id"
    t.integer   "valor"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
  end

  add_index "feedbacks", ["aula_id"], :name => "index_feedbacks_on_aula_id"

  create_table "ginasio_notificacao", :force => true do |t|
    t.integer "ginasio_id"
    t.integer "notificacao_id"
  end

  create_table "ginasio_notificacaos", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "ginasios", :force => true do |t|
    t.string    "nome"
    t.float     "latitude"
    t.float     "longitude"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "morada"
    t.string    "telefone"
  end

  create_table "modalidade_pagamentos", :force => true do |t|
    t.string   "nome"
    t.float    "preco"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notificacaos", :force => true do |t|
    t.date      "data"
    t.string    "titulo"
    t.text      "texto"
    t.integer   "admin_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "ginasio_id"
  end

  create_table "pagamentos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mes"
    t.boolean  "pago"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ano"
    t.float    "preco"
    t.integer  "modalidade_pagamento_id"
  end

  add_index "pagamentos", ["user_id"], :name => "index_pagamentos_on_user_id"

  create_table "pedido_planos", :id => false, :force => true do |t|
    t.timestamp "data_pedido"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
  end

  create_table "planos", :force => true do |t|
    t.integer   "altura"
    t.integer   "peso"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "user_id"
    t.integer   "admin_id"
    t.date      "data"
  end

  create_table "reserva_aulas", :id => false, :force => true do |t|
    t.integer   "aula_id"
    t.integer   "user_id"
    t.date      "dia"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "staffs", :force => true do |t|
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "tipo_aulas", :force => true do |t|
    t.string    "tipo"
    t.text      "descricao"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "turnos", :force => true do |t|
    t.time      "hora"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email"
    t.string    "password_hash"
    t.string    "password_salt"
    t.string    "nome"
    t.string    "datanascimento"
    t.string    "telefone"
    t.string    "morada"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "token"
    t.string    "url_foto"
    t.integer   "ginasio_id"
    t.integer   "modalidade_pagamento_id"
  end

end
