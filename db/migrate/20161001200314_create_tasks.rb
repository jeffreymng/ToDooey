class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, limit: 256
      t.boolean :completed, null: false, default: false
      # t.boolean :in_progress, default: false
      t.datetime :completion_time
      # t.datetime :start_time
      t.references :user, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
