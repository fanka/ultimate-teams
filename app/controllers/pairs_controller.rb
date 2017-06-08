class PairsController < ApplicationController
  before_action :authenticate_user!
  before_action :must_be_admin, only: :index
  helper_method :rotate_and_generate_new

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

  def show
    @pair = Pair.find_by(student_one_id: current_user.id) || @pair = Pair.find_by(student_two_id: current_user.id)


  end

  def rotate_and_generate_new
    Pair.daily_rotation
    Pair.generate_pairs
  end

  private

  def must_be_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: "Only admin can view all pairs"
    end
  end

end
