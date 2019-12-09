class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show; end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  # POST /comments.json
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to(
            article_path(@article),
            notice: "Comment was successfully created.",
          )
        end
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  # rubocop:disable Metrics/MethodLength
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html do
          redirect_to @comment, notice: "Comment was successfully updated."
        end
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
  end
  # rubocop:enable Metrics/MethodLength

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html do
        redirect_to comments_url, notice: "Comment was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def comment_params
    params.require(:comment).permit(:commenter, :body, :article)
  end
end
