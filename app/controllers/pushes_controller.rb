class PushesController < ApplicationController
  before_action :signed_in_designer
  before_action :correct_designer,   only: :destroy

  def create
    
    if params[:commit] == "Designer"
      @push = current_designer.pushes.build(push_params)
    else
      @push = current_daemon.pushes.build(push_params)
    end
   
    
    if @push.save
      flash[:success] = "Push created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @push.destroy
    redirect_to root_url
  end
  
 

  private

    def push_params
      params.require(:push).permit(:content)
    end
    
  def correct_designer
    if Push.find_by(id: params[:id]).pushable_type = "Designer"
      @push = current_designer.pushes.find_by(id: params[:id])
    else
      @push = current_designer.daemons.pushes.find_by(id: params[:id])   
    end
      
       
         redirect_to root_url if @push.nil?
     end
end