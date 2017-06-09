class PairsController < ApplicationController
  before_action :authenticate_user!
  before_action :must_be_admin, only: :index
  helper_method :rotate_and_generate_new

  def index
    @pairs = Pair.all
    @my_pairs1 = Pair.where(student_one_id: current_user.id)
    @my_pairs2 = Pair.where(student_two_id: current_user.id)
    @users = User.all
    @students_half_1, @students_half_2 = @users.each_slice( (@users.count/2.0).round ).to_a
  end

  def choose_date

    @users = User.all
    @students_half_1, @students_half_2 = @users.each_slice( (@users.count/2.0).round ).to_a
    Pair.daily_rotation
    total_of_pairs = (User.count % 2 == 0) ? (User.count / 2) : (User.count / 2 + 1)
    (0...total_of_pairs).each do |index_of_pair|
    @pair = Pair.create(student_one: @students_half_1[index_of_pair], student_two: @students_half_2[index_of_pair], pair_date: params[:chosen_date] )

  end
  end


  def new
    @pair = Pair.new
  end

  def create
    @pair = Pair.new
    @pair.save
  end

  def destroy
    @pair.destroy
  end

  def show
    @pair = Pair.find_by(student_one_id: current_user.id) || @pair = Pair.find_by(student_two_id: current_user.id)
  end

  def update
    @pair = Pair.find(params[:id])
    @pair.update(pair_params)
    @pair.save
  end




  private

  def must_be_admin
    unless current_user && current_user.admin?
      redirect_to root_path, notice: "Only admin can view all pairs"
    end
  end

  def pair_params
    params.require(:pair).permit(:student_one, :student_two, :pair_date)
  end

end
