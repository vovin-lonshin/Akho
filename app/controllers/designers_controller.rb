class DesignersController < ApplicationController
  before_action :signed_in_designer, only: [:index, :edit, :update, :destroy]
  before_action :correct_designer,   only: [:edit, :update]
  before_action :admin_designer,     only: :destroy
  
   def index
     @designers = Designer.paginate(page: params[:page])
   end
   
  def destroy
    Designer.find(params[:id]).destroy
    flash[:success] = "Designer deleted."
    redirect_to designers_url
  end
    
    def new
    @designer = Designer.new
  end

  def show
      @designer = Designer.find(params[:id])
    end
    
  def create
    @designer = Designer.new(designer_params) 
    if @designer.save
      sign_in @designer
      flash[:success] = "[Welcome {DESIGNER}] TO:: [Circuit{manser}.com ]"
      redirect_to @designer
    else
      render 'new'
    end
  end
  
  def edit
      @designer = Designer.find(params[:id])
    end
    
  def update
    @designer = Designer.find(params[:id])
    if @designer.update_attributes(designer_params)
      flash[:success] = "Profile updated"
      redirect_to @designer
    else
      render 'edit'
    end
  end
  
  private

    def designer_params
      params.require(:designer).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def signed_in_designer
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Please sign in."
          end
    end
    

  def correct_designer
    @designer = Designer.find(params[:id])
    redirect_to(root_url) unless current_designer?(@designer)
  end
  
  def admin_designer
       redirect_to(root_url) unless current_designer.admin?
     end
    
end
