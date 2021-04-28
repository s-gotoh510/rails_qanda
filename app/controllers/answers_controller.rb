class AnswersController < ApplicationController
  
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    # if @answer.update(answer_params)
    if @answer.update(content: answer_params[:content], question_id: @question.id, user_id: current_user.id)
      redirect_to question_path(@question), notice: '回答が完了しました!'
    else
      redirect_to question_path(@question), alert: '回答に失敗しました。'
    end
  end
  
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: '回答を更新しました!'
    else
      flash[:alert] = '回答の更新に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: '回答の削除が完了しました!'
  end
  
  private
  def answer_params
    # params.require(:answer).permit(:name, :content, :question_id)
    params.require(:answer).permit(:content)
  end
end
