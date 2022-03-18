class WishlistsController < ApplicationController
    def index
        @wishlists = policy_scope(Wishlist)
      end
    
      def new
        @user = User.find(params[:user_id])
        @wishlist = Wishlist.new 
        authorize @wishlist
      end
    
      def create 
        @user = User.find(params[:user_id])
        @wishlist = Wishlist.new(wishlist_params)
        @wishlist.user = @user
        authorize @wishlist
        if @wishlist.save
          redirect_to user_wishlists_path
          flash[:notice] = 'Success. Your book was added to wishlist!'
        else
          render "new"
          flash[:notice] = 'Please enter wishlist info again!'
        end
      end

    
      def destroy
        @wishlist = Wishlist.find(params[:id])
        authorize @wishlist
        if @wishlist.destroy
          redirect_to user_wishlists_path
          flash[:notice] = 'Wishlist item deleted!'
        else
          flash[:notice] = 'Wishlist not deleted!'
        end
      end
    
    
      private
    
      def wishlist_params
        params.require(:wishlist).permit(:title, :author, :photo)
      end
end
