class Pair < ApplicationRecord
  belongs_to :student_one, class_name: User
  belongs_to :student_two, class_name: User
  validates_presence_of :student_one, :student_two

  @students_half_1, @students_half_2 = User.all.each_slice( (User.all.count/2.0).round ).to_a

  def self.daily_rotation
    x=@students_half_1.pop
    @students_half_2.push(x)
    y=@students_half_2.shift
    @students_half_1.insert(1,y)
  end

  
  def self.show_today
    Pair.where(:pair_date == Date.today)
  end

end
