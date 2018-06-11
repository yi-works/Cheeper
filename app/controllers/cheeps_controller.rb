class CheepsController < ApplicationController
  before_action :set_cheep, only: [:edit, :update, :destroy, :show]
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
      @cheep = Cheep.new
    end
  end

  def confirm
    render :new if @cheep.invalid?
  end

  def edit
    if @cheep.user_id != current_user.id
      redirect_to cheeps_path
    end
  end

  def show
    @favorite = current_user.favorites.find_by(cheep_id: @cheep.id)
  end

  def create
    if @cheep.save
      redirect_to cheeps_path, notice: 'cheepしました！'
    else
      render :new
    end
  end

  def update
    if @cheep.update(cheep_params) && @cheep.user_id == current_user.id
      redirect_to cheeps_path, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    if @cheep.user_id == current_user.id
      @cheep.destroy
      redirect_to cheeps_path, notice: '削除しました。'
    end
  end

  private

  def set_cheep
    @cheep = Cheep.find(params[:id])
  end

  def cheep_params
    params.require(:cheep).permit(:content)
  end

  def set_cheep_params
    @cheep = current_user.cheeps.build(cheep_params)
  end

  def user_logged_in?
    unless logged_in?
      redirect_to new_session_path
    end
  end

end
