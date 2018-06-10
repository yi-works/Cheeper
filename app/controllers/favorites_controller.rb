class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(cheep_id: params[:cheep_id])
    redirect_to cheeps_url, notice: "#{favorite.cheep.user.name}さんのCheepをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to cheeps_url, notice: "#{favorite.cheep.user.name}さんのCheepをお気に入り解除しました"
  end
end
