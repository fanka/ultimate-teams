class Pair < ApplicationRecord
  belongs_to :student_one, class_name: User
  belongs_to :student_two, class_name: User
  validates_presence_of :student_one, :student_two

  @students_half_1, @students_half_2 = User.all.each_slice( (User.all.count/2.0).round ).to_a


  def even_number?(number)
    number % 2 == 0
  end

  def total_of_pairs
    even_number?(User.all.count) ? (User.all.count / 2) : (User.all.count / 2 + 1)
  end

  def self.daily_rotation
    x=@students_half_1.pop
    @students_half_2.push(x)
    y=@students_half_2.shift
    @students_half_1.insert(1,y)
  end

  def self.generate_pairs
    total_of_pairs = (User.count % 2 == 0) ? (User.count / 2) : (User.count / 2 + 1)
    #Pair.destroy_all

    (0...total_of_pairs).each do |index_of_pair|
      @pair = Pair.create(student_one: @students_half_1[index_of_pair], student_two: @students_half_2[index_of_pair], pair_date: @pair_date )
    end
  end

  def self.show_today
    Pair.where(:pair_date == Date.today)
  end

end
