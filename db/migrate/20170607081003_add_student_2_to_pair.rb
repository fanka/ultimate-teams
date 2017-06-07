class AddStudent2ToPair < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :student_2, :string
  end
end
