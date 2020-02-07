class BoardsController < ApplicationController
  before_action :set_taget_board, only: %i[show edit update destroy]

  def index
    boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    boards = params[:area_id].present? ? Area.find(params[:area_id]).boards : Board.all
    @boards = boards.page(params[:page]).order(created_at: :desc)
  end

  def new
    @board = Board.new(flash[:board])
  end

  def create
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "#{board.title}が投稿されました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board, # boardオブジェクトをflashでnewに渡す事でリダイレクトされた後も値を保持できる
        error_message: board.errors.full_messages
      }
    end
  end

  def show
    # before_action :set_taget_board
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
    # before_action :set_taget_board
  end

  def update
    # before_action :set_taget_board
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_to :back, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def destroy
    # before_action :set_taget_board
    @board.destroy
    redirect_to boards_path, flash: { notice: "#{@board.title}の投稿が削除されました" }
  end

  private

      def board_params
        params.require(:board).permit(:title, :body, tag_ids: [], area_ids: [])
      end

      def set_taget_board
        @board = Board.find(params[:id])
      end
end