class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.save
      flash[:notice] = "「#{comment.name}」のコメントを作成しました"
      redirect_to comment.board
    else
      # redirect_to :back, flash: {
      #   comment: comment,
      #   error_messages: comment.errors.full_messages
      # }
      flash[:comment] = comment
      flash[:error_messages] = comment.errors.full_messages
      redirect_back fallback_location: comment.board
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_to comment.board, status: :see_other, flash: {notice: "「#{comment.name}」のコメントが削除されました"}

  end

  private
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
