class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, limit: 128
      t.boolean :completed, null: false, default: false
      t.references :user, foreign_key: true, index: true, null: false
    end
  end
end
