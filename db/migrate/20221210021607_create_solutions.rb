class CreateSolutions < ActiveRecord::Migration[6.1]
  def change
    create_table :solutions do |t|
      t.text :content
      t.text :picture
      t.boolean :done
      t.references :cause, null: false, foreign_key: true

      t.timestamps
    end
  end
end
