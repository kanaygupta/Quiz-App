class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = Subcategory.where(category_id: params[:id])
  end

  def destroy
    current_user
    if @current_user.admin
      Category.find(params[:id]).destroy
      flash[:success] = "Category deleted"
      redirect_to categories_url
    else
      flash[:success] = "You need admin permission for this"
      redirect_to categories_url
    end
  end


    def new
    current_user
    if @current_user.admin
      @category = Category.new
    else
      flash[:success] = "You are not an Admin"
      redirect_to users_path and return
    end

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Added category"
      redirect_to @category
    else
      render 'new'
    end
  end

  def leaderboard
    @category=Category.find(params[:id])
    @temp=Lecategory.where(category_id: params[:id])
    @leaderboard=@temp.order(actscore: :desc)
    render 'leader'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


end
