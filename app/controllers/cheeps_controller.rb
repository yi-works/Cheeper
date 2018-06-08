class CheepsController < ApplicationController
  before_action :set_cheep, only: [:edit, :update, :destroy]
  before_action :set_cheep_params, only: [:confirm, :create]
  before_action :user_logged_in?, only: [:new, :edit, :show, :destroy]

  def home
  end

  def index
    @cheeps = Cheep.all.reverse_order
  end

  def new
    if params[:back]
      set_cheep_params
    else
      set_user
      @cheep = @user.cheeps.build
    end
  end

  def confirm
    render :new if @cheep.invalid?
  end

  def edit
  end

  def create
    if @cheep.save
      redirect_to cheeps_path, notice: 'cheepしました！'
    else
      render :new
    end
  end

  def update
    if @cheep.update(cheep_params)
      redirect_to cheeps_path, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @cheep.destroy
    redirect_to cheeps_path, notice: '削除しました。'
  end

  private

  def set_cheep
    @cheep = Cheep.find(params[:id])
  end

  def cheep_params
    params.require(:cheep).permit(:content, :user_id)
  end

  def set_cheep_params
    set_user
    @cheep = @user.cheeps.build(cheep_params)
  end

  def user_logged_in?
    if logged_in?
    else
      redirect_to new_session_path
    end
  end

  def set_user
    @user = User.find(current_user.id) if logged_in?
  end
end
