class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    # @nickname = current_user.nickname
    @nickname = user.nickname
    
    # @questions = Question.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
    # @questions = current_user.questions.page(params[:page]).per(5).order("created_at DESC")
    # @questions = user.questions.page(params[:page]).per(5).order("created_at DESC")
    @questions = user.questions.order("created_at DESC")
    @answers = user.answers.order("created_at DESC")
  end
end
