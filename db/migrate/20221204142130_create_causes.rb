class CreateCauses < ActiveRecord::Migration[6.1]
  def change
    create_table :causes do |t|
      t.text :content, null: false
      t.text :picture
      t.text :movie
      t.boolean :done
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
