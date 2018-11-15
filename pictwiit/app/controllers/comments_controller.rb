class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text],twiit_id: comment_params[:twiit_id], user_id: current_user.id)
    redirect_to "/twiits/#{@comment.twiit.id}"
  end

private
  def comment_params
    params.permit(:text , :twiit_id)
  end

end
