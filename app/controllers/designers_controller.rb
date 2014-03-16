class DesignersController < ApplicationController
  
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
  
  private

    def designer_params
      params.require(:designer).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
end
