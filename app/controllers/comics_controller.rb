class ComicsController < ApplicationController
    before_action :authenticate_user!

  def index
    @comics = Comic.all
    @comics = policy_scope(Comic)    
  end

  def show
    @comic = Comic.find(params[:id])
    authorize @comic
  end

  def new
    @user = User.find(params[:user_id])
    @comic = Comic.new
    authorize @comic
  end

  def create
    @user = User.find(params[:user_id])
    @comic = Comic.new(comic_params)
    @comic.user = @user
    authorize @comic
    if @comic.save
      redirect_to user_comics_path
      flash[:notice] = 'Success. Your comic was added to the Library'
    else
      render "new"
      flash[:notice] = 'Comic not created. Please try again'

    end
  end

  def edit
    @user = User.find(params[:user_id])
    @comic = Comic.find(params[:id])
    authorize @comic
  end

  def update
    @comic = Comic.find(params[:id])
    @comic.update(comic_params)
    authorize @comic
    redirect_to user_comic_path
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    authorize @comic
    redirect_to user_comics_path
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :colection, :photo, :comments)
  end
end


