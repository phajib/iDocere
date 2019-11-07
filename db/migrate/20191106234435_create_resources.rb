class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.integer :grade_level
      t.string :subject
      t.string :assignment
      t.integer :teacher_id
      t.integer :parent_id
      t.integer :student_id

      t.timestamps
    end
  end
end
