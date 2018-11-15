class TwiitsController < ApplicationController

before_action :move_to_index , except: [:index , :show]

  def index
    @twiits = Twiit.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Twiit.create(image:twiits_params[:image],text:twiits_params[:text],user_id: current_user.id)
  end

  def destroy
    twiit = Twiit.find(params[:id])
     twiit.destroy if twiit.user_id == current_user.id
  end

  def update
    twiit = Twiit.find(params[:id])
    twiit.update(twiits_params) if current_user.id == twiit.user_id
  end

  def edit
    @twiit = Twiit.find(params[:id])
  end

  def show
    @twiit = Twiit.find(params[:id])
    @comments = @twiit.comments.includes(:user)
  end

  private
  def twiits_params
    params.permit(:image,:text)
  end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end
end
