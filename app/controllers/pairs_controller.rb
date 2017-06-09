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

  def rotate_and_generate_new
    Pair.destroy_all
    Pair.daily_rotation
    Pair.generate_pairs


    respond_to do |format|
        format.html { redirect_to pairs_path }
        format.js { render :file => "/app/assets/javascripts/pairs.js" }
    end
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
