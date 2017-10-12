class SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.paginate(page: params[:page])
  end


  def new
    current_user
    if @current_user.admin
        @subcategory = Subcategory.new
        @categories=Category.where(name="")
        @array=[]
        @categories.each do |f|
          @array.append([f.name,f.id])
        end

    else
       flash[:success] = "You are not an Admin"
       redirect_to subcategories_path and return

    end
  end
  def destroy
    current_user
    if @current_user.admin
      Subcategory.find(params[:id]).destroy
      flash[:success] = "Subcategory deleted"
      redirect_to subcategories_url
    else
      flash[:success] = "You need admin permission for this"
      redirect_to subcategories_url
    end
  end

  def create

    @subcategory = Subcategory.new(name: params[:subcategory][:name],category_id: params[:subcategory][:category_id])
    @category=Category.find_by(id: params[:subcategory][:category_id])

    if @subcategory.save
       flash[:success] = "Subcategory Successfully added"
       redirect_to @category
    else
       render 'new'
    end
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    @quizzes = Quiz.where(subcategory_id: params[:id])
  end

  def leaderboard
    @subcategory=Subcategory.find(params[:id])
    @temp=Lesubcategory.where(subcategory_id: params[:id])
    @leaderboard=@temp.order(actscore: :desc)
    render 'leader'
  end

end




