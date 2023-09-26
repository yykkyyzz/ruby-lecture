class BoardsController < ActionController::Base
  layout "application"

  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards = Board.page(params[:page])
  end
  def show
    # @board = Board.find(params[:id])
    # commentsオブジェクト（空)を作成している
    # @comment = @board.comments.new
    @comment = Comment.new(board_id: @board.id)
  end
  def new
    @board = Board.new(flash[:board])
  end
  def create
    board = Board.new(board_params)

    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end
  def edit
   # @board = Board.find(params[:id])
  end
  def update
   board = Board.find(params[:id])
    if board.update(board_params)
      redirect_to board
    else
      flash[:board] = board
      flash[:error_messages] = board.errors.full_messages
      redirect_back fallback_location: board
    
    end
  end
  
  def destroy
   # @board = Board.find(params[:id])
   @board.destroy

    redirect_to @board, status: :see_other, flash: {notice: "「#{@board.title}」の掲示板が削除されました"}
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board = Board.find(params[:id])
  end

end
