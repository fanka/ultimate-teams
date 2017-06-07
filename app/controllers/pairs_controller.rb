class PairsController < ApplicationController
  helper_method :rotate

  def index
    @pairs = Pair.all
    @users = User.all
    @students_half_1, @students_half_2 = @users.each_slice( (@users.count/2.0).round ).to_a
  end

  def new
    @pair = Pair.new
  end

  def create
    @pair = Pair.new
    #@pair = [@students_half_1[index_of_pair], @students_half_2[index_of_pair]]
    @pair.save
  end

  def destroy
    @pair.destroy
  end

  def rotate
  x=@students_half_1.pop
  @students_half_2.push(x)
  y=@students_half_2.shift
  @students_half_1.insert(1,y)
  end

end
