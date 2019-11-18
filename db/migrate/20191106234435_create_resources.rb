class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.integer :grade_level
      t.string :subject
      t.text :assignment
      t.integer :user_id
      t.integer :parent_id
      t.integer :student_id
      t.integer :message_id

      t.timestamps
    end
  end
end
