class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.paginate(page: params[:page])
  end

  def new
    current_user
    if @current_user.admin
      puts("Rendering new")
      @quiz = Quiz.new
      @categories=Category.where(name="")
      @subcategories=Subcategory.where(name="")
      @cat_array=[]
      @sub_array=[]
      @categories.each do |f|
        @cat_array.append([f.name,f.id])
      end
      @subcategories.each do |g|
        @sub_array.append([g.name,g.id])
      end
    else
      flash[:success] = "You are not an Admin"
      redirect_to quizzes_path and return

    end
  end
  def destroy
    current_user
    if @current_user.admin
      Quiz.find(params[:id]).destroy
      flash[:success] = "Quiz deleted"
      redirect_to quizzes_url
    else
      flash[:success] = "You need admin permission for this"
      redirect_to quizzes_url
    end
  end

  def create

    @subcategory=Subcategory.find(params[:quiz][:subcategory_id])
    @category=Category.find(@subcategory.category_id)

    if @subcategory.category_id == @category.id
      @quiz=Quiz.new(name: params[:quiz][:name],subcategory_id: params[:quiz][:subcategory_id])
      if @quiz.save
        flash[:success] = "Quiz Successfully added"
        redirect_to @subcategory
      end
    else
      puts("Failed to add")
      flash[:success] = "Please select subcategory according to category"
      redirect_to :action => 'new'

    end
  end

  def show
    @quiz = Quiz.find(params[:id])
    @questions = Question.where(quiz_id: params[:id])
    puts(@questions)
  end

  def play
    @quiz = Quiz.find(params[:id])
    @questions = Question.where(quiz_id: params[:id])
    render 'show'
  end
  def leaderboard
    @quiz=Quiz.find(params[:id])
    @temp=Lequiz.where(quiz_id: params[:id])
    @leaderboard=@temp.order(actscore: :desc)
    render 'leader'
  end

end

