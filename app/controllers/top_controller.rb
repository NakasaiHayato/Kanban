class TopController < ApplicationController
  def index
    # 現在ログインしているユーザーのレコードを取得する
    @lists = List.where(user: current_user).order("created_at ASC")
  end
end
