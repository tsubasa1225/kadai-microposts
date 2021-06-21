class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :new]
  
  def index
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "メッセージを投稿しました"
      redirect_to root_url
    else
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])
      flash.now[:danger] = "メッセージを投稿できませんでした"
      render "toppages/index"
    end
  end

  def show
  end

  def destroy
    @micropost.destroy
    flash[:success] = "メッセージを破棄しました"
    redirect_back(fallback_location: root_path)
  end
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  end
end
