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

ActiveRecord::Schema.define(:version => 20111129161724) do

  create_table "admins", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercicios", :force => true do |t|
    t.string   "nome"
    t.string   "maquina"
    t.string   "tipo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercicios_planos", :id => false, :force => true do |t|
    t.integer  "peso"
    t.integer  "series"
    t.integer  "repeticoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plano_id"
    t.integer  "exercicio_id"
  end

  create_table "ginasio_notificacao", :force => true do |t|
    t.integer "ginasio_id"
    t.integer "notificacao_id"
  end

  create_table "ginasios", :force => true do |t|
    t.string   "nome"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "morada"
  end

  create_table "notificacaos", :force => true do |t|
    t.date     "data"
    t.string   "titulo"
    t.text     "texto"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ginasio_id"
  end

  create_table "planos", :force => true do |t|
    t.integer  "altura"
    t.integer  "peso"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "admin_id"
    t.date     "data"
  end

  create_table "staffs", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "nome"
    t.string   "datanascimento"
    t.string   "telefone"
    t.string   "morada"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "url_foto"
    t.integer  "ginasio_id"
  end

end
