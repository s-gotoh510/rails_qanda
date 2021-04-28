class QuestionsController < ApplicationController
  
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @questions = Question.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    # @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.includes(:user).order("created_at DESC")
  end

  def new
    @question = Question.new
  end
  
  def create
    # @question = Question.new(question_params)
    @question = Question.new(title: question_params[:title], content: question_params[:content], user_id: current_user.id)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end

  def edit
    # @question = Question.find(params[:id])
  end
  
  def update
    # @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Update error!'
      render :edit
    end
  end
  
  def destroy
    # @question = Question.find(params[:id])
    if user_signed_in?
      @question.destroy
      redirect_to root_path, notice: 'Deleted!'
    else
      redirect_to root_path, alert: 'ログインしてください'
    end
  end
  
  private
  def set_question
     @question = Question.find(params[:id])
  end
  
  def question_params
    # params.require(:question).permit(:name, :title, :content)
    params.require(:question).permit(:title, :content)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
