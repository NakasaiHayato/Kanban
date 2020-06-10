class ListController < ApplicationController
  # edit updateアクションを呼ぶ前にset_listメソッドを読む
  before_action :set_list, only: %i(edit update destroy)

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    # update_attributesメソッド
    # 成功した場合に更新と保存を続けて同時に行う
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  private
  def list_params
    # mergeメソッドは２つのハッシュを統合するメソッド
    params.require(:list).permit(:title).merge(user: current_user)
  end

  def set_list
    @list = List.find_by(id: params[:id])
  end

end
