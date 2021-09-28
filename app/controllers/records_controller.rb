class RecordsController < ApplicationController
    before_action :authenticate_user!

    def index
        @records = Record.all
        @records = policy_scope(Record)
    end
  
    def show
      @records = Record.find(params[:id])
      authorize @record
    end
  
    def new
      @user = User.find(params[:user_id])
      @record = Record.new
      authorize @record
    end
  
    def create
      @user = User.find(params[:user_id])
      @record = Record.new(record_params)
      @record.user = @user
      authorize @record
      if @record.save
        redirect_to user_records_path
        flash[:notice] = 'Success. Your record was added to the Library'
      else
        render "new"
        flash[:notice] = 'Record not created. Please try again'
  
      end
    end
  
    def edit
      @user = User.find(params[:user_id])
      @record = Record.find(params[:id])
      authorize @record
    end
  
    def update
      @record = Record.find(params[:id])
      @record.update(record_params)
      authorize @record
      redirect_to user_record_path
    end
  
    def destroy
      @record = Record.find(params[:id])
      @record.destroy
      authorize @record
      redirect_to user_records_path
    end
  
    private
  
    def record_params
      params.require(:record).permit(:title, :artist, :photo, :info)
    end

end
