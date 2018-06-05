class CheepsController < ApplicationController
  before_action :set_cheep, only: [:edit, :update, :destroy]
  before_action :set_cheep_params, only: [:confirm, :create]

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
    params.require(:cheep).permit(:content)
  end

  def set_cheep_params
    @cheep = Cheep.new(cheep_params)
  end
end
