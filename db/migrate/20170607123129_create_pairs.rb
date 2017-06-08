class CreatePairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|
      t.integer :student_one_id
      t.integer :student_two_id

      t.timestamps
    end
    add_index :pairs, :student_one_id
    add_index :pairs, :student_two_id
  end
end
