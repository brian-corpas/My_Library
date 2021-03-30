class ComicloansController < ApplicationController
    def index
        @comics = policy_scope(Comic)
        @comicloans = policy_scope(Comicloan)
      end
    
      def new
        @comic = Comic.find(params[:comic_id])
        @comicloan = Comicloan.new 
        authorize @comicloan
      end
    
      def create
        @comic = Comic.find(params[:comic_id]) 
        @comicloan = Comicloan.new(comicloan_params)
        @comicloan.comic = @comic 
        authorize @comicloan
        if @comicloan.save
          @comic.loan_status = 'loan'
          redirect_to user_comics_path
          flash[:notice] = 'Success. Your comic was loaned!'
        else
          render "new"
          flash[:notice] = 'Please enter loan info again!'
        end
      end
    
      def destroy
        @comicloan = Comicloan.find(params[:id])
        authorize @comicloan
        if @comicloan.destroy
          redirect_to root_path
          flash[:notice] = 'Comic returned!'
        else
          flash[:notice] = 'Comic still not returned!'
        end
      end
    
      private
    
      def comicloan_params
        params.require(:comicloan).permit(:name, :date, :photo)
      end
end
