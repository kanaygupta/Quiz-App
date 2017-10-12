class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @quizzes=Quiz.where(name="")
    @array=[]
    @quizzes.each do |f|
      @array.append([f.name,f.id])
    end
  end

  def index
  end

  def create
    @question = Question.new(content: params[:question][:content],q_type: "string", quiz_id: params[:question][:quiz_id],option_a: params[:question][:option_a],option_b: params[:question][:option_b],option_c: params[:question][:option_c],option_d: params[:question][:option_d],answer: params[:question][:answer])

    @quiz=Quiz.find_by(id: params[:question][:quiz_id])

    if @question.save
      flash[:success] = "Question Successfully added"
      redirect_to @quiz
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

end



