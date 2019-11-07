class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :comment
      t.integer :teacher_id
      t.integer :parent_id
      t.string :resource_id
      t.belongs_to :teacher
      t.belongs_to :parent

      t.timestamps
    end
  end
end
