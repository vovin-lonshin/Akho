class StaticPagesController < ApplicationController
   before_filter :set_cache_buster, only: [:home]
  
  
  def home
    circuit_name="A circuit"
    get_rand_circuit(circuit_name)
    @circuit_title="[Random circuit]:::#{circuit_name}:::"
   
    if signed_in?
         @pusher = "Designer"
         @designer = current_designer 
         @push = current_designer.pushes.build 
         @feed_items = @designer.feed.paginate(page: params[:page])
       end
    
  end

  def help
    
  end
  
  def about
  end
  
  def news
    @bulletin = current_designer.bulletins.build if signed_in?
    @bulletins = Bulletin.paginate(page: params[:page])
  end
  
  
    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
  
  
end
