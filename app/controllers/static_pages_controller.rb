class StaticPagesController < ApplicationController
   before_filter :set_cache_buster, only: [:home]
  
  def home
    circiut_name="A Circiut"
    get_rand_circiut(circiut_name)
    @circiut_title="[Random Circiut]:::#{circiut_name}:::"
  end

  def help
    
  end
  
  def about
  end
  
  
  
    def set_cache_buster
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
  
end
