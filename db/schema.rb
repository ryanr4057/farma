# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_24_004713) do
  create_table "atendentes", force: :cascade do |t|
    t.string "nome"
    t.integer "usuario"
    t.string "cpf"
    t.integer "idade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.integer "idade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "medicamento_id", null: false
    t.integer "venda_id", null: false
    t.integer "qtd"
    t.float "unit"
    t.float "s_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicamento_id"], name: "index_items_on_medicamento_id"
    t.index ["venda_id"], name: "index_items_on_venda_id"
  end

  create_table "medicamentos", force: :cascade do |t|
    t.string "nome"
    t.float "preco"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendas", force: :cascade do |t|
    t.integer "atendente_id", null: false
    t.integer "cliente_id", null: false
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atendente_id"], name: "index_vendas_on_atendente_id"
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
  end

  add_foreign_key "items", "medicamentos"
  add_foreign_key "items", "vendas"
  add_foreign_key "vendas", "atendentes"
  add_foreign_key "vendas", "clientes"
end
