class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 64, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :first_name, limit: 64
      t.string :last_name, limit: 64

      t.timestamps
    end
  end
end
