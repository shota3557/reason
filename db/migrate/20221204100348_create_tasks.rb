class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :picture
      t.boolean :done
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
