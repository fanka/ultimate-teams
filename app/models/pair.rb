class Pair < ApplicationRecord
  has_many :users
  validates :users, length: {maximum: 2}

all_students = User.all
total_of_students = all_students.count
max_cycle = total_of_students - 1
students_half_1, students_half_2 = all_students.each_slice( (total_of_students/2.0).round ).to_a

def even_number(number)?
  number % 2 == 0
end

def total_of_pairs(total_of_students)
  even_number(total_of_students)? ? (total_of_students / 2) : (total_of_students / 2 + 1)
end

def daily_rotation(students_half_1, students_half_2)
  x=students_half_1.pop
  students_half_2.push(x)
  y=students_half_2.shift
  students_half_1.insert(1,y)
end

def make_pair(index_of_pair)
  pair = [students_half_1[index_of_pair], students_half_2[index_of_pair]]
end

def generate_pairs(total_of_pairs)
  total_of_pairs=total_of_pairs(total_of_students)
  @pairs=[]
  (0...total_of_pairs).each do |index_of_pair|
  @pairs << make_pair(index_of_pair)
end






end
