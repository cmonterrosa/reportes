class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string   :login,                     :limit => 40
      t.string   :rfc, :limit => 13
      t.string   :paterno, :limit => 40
      t.string   :materno, :limit => 40
      t.string   :nombre, :limit => 60
      t.string   :email,                     :limit => 100
      t.string   :crypted_password,          :limit => 40
      t.string   :salt,                      :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :remember_token,            :limit => 40
      t.datetime :remember_token_expires_at
      t.string   :activation_code,           :limit => 40
      t.datetime :activated_at
      t.integer :escuela_id
     end
    add_index :users, :login, :unique => true
    add_index :users, :rfc
    add_index :users, :escuela_id
  end

  def self.down
    drop_table "users"
  end
end