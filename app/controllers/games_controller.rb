class GamesController < ApplicationController
  include SessionsHelper


  def play
    current_user
    if @current_user==nil
      flash[:success] = "Please Login to play the quiz"
      redirect_to login_path and return
    end
    puts("in play")
    @game1=Score.where(quiz_id: params[:id] ,user_id: @current_user.id).first

    #if already there
    if @game1
      @newquestion=State.where(quiz_id: params[:id]).first
      @score1=@game1.actscore
        if @newquestion
            @question=Question.find(@newquestion.question_id)
        else
          puts("in else of if")
          flash[:success] = "Quiz completed"
          @score1=@game1.actscore
          render 'show' and return
          #redirect_to @current_user and return
        end
    #if not there add all the question of this quiz to state table
    else
      @questions=Question.where(quiz_id: params[:id])
      #Score.new(quiz_id: params[:id] ,user_id: @current_user.id ,score: 0).save

      @questions.each do |f|
        @newstate=State.new(user_id: @current_user.id,quiz_id: params[:id],question_id: f.id)
        @newstate.save
      end

      @question=@questions.first
      @score1=0
    end

    @qzid=params[:id]

    if @question
      render 'play' and return
    else
      if @current_user.admin
        flash[:success] = "Add questions please"
        redirect_to questions_new_path and return
      else
        flash[:success] = "Quiz contains no question"
        redirect_to categories_path and return
      end

    end

  end

  def update
    current_user
    @game=Score.where(quiz_id: params[:id] ,user_id: @current_user.id).first
    @quiz=Quiz.find(params[:id])

    temp=""
    if params[:one]
      temp=temp+'A'
    end
    if params[:two]
      temp=temp+'B'
    end
    if params[:three]
      temp=temp+'C'
    end
    if params[:four]
      temp=temp+'D'
    end

    # if games exists
     if @game
       puts("In if")

       answer=Question.find(params[:question_id]).answer

        if temp==answer
         tempscore=@game.actscore+10
         @game.update_attribute(:actscore, tempscore)
         @sub=Subcategory.find(@quiz.subcategory_id)
         @lecat=Lecategory.where(category_id: @sub.category_id ,user_id: @current_user.id ).first
         @lesubcat=Lesubcategory.where(subcategory_id: @quiz.subcategory_id,user_id: @current_user.id ).first
         @lequiz=Lequiz.where(quiz_id: @quiz.id,user_id: @current_user.id).first
         @lecat.update_attribute(:actscore, tempscore)
         @lesubcat.update_attribute(:actscore, tempscore)
         @lequiz.update_attribute(:actscore, tempscore)



        end

       @state=State.where(user_id: @current_user.id , question_id:params[:question_id])
       State.delete(@state)
     else
       puts("In else")
       @score=Score.new(quiz_id: params[:id] ,user_id: @current_user.id ,actscore: 0)
       @score.save
       @sub=Subcategory.find(@quiz.subcategory_id)
       @lecat=Lecategory.new(category_id: @sub.category_id,user_id: @current_user.id ,actscore: 0)
       @lesubcat=Lesubcategory.new(subcategory_id: @quiz.subcategory_id,user_id: @current_user.id,actscore: 0)
       @lequiz=Lequiz.new(quiz_id: @quiz.id,user_id: @current_user.id,actscore: 0)
       @lecat.save
       @lesubcat.save
       @lequiz.save
       answer=Question.find(params[:question_id]).answer

       if temp==answer
         tempscore=@score.actscore+10
         @score.update_attribute(:actscore, tempscore)

         @lecat=Lecategory.where(category_id: @sub.category_id,user_id: @current_user.id ).first
         @lesubcat=Lesubcategory.where(subcategory_id: @quiz.subcategory_id,user_id: @current_user.id).first
         @lequiz=Lequiz.where(quiz_id: @quiz.id,user_id: @current_user.id).first
         @lecat.update_attribute(:actscore, tempscore)
         @lesubcat.update_attribute(:actscore, tempscore)
         @lequiz.update_attribute(:actscore, tempscore)

       end
       @state=State.where(user_id: @current_user.id , question_id:params[:question_id])
       State.delete(@state)
     end
    flash[:success] = "Answer Recorded"
    redirect_to play_path and return







  end
end
