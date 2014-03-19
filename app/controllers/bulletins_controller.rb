class BulletinsController < ApplicationController
 
  before_action :admin_designer, only: [:destroy, :create]
  

  
  def destroy
    Bulletin.find(params[:id]).destroy
    flash[:success] = "Bulletin deleted."
    redirect_to news_path
  end
  
  def create
    @bulletin = current_designer.bulletins.build(bulletin_params)
        if @bulletin.save
          flash[:success] = "News bulletin created!"
          redirect_to news_path
        else
          flash[:error]= "News bulletin can not be empty"
          redirect_to news_path
        end
  end
  

  private
  
      def bulletin_params
        params.require(:bulletin).permit(:content)
      end
  private

    
end
