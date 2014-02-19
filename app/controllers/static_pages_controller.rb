class StaticPagesController < ApplicationController
   before_filter :set_cache_buster, only: [:home]
  
  def home
    circuit_name="A circuit"
    get_rand_circuit(circuit_name)
    @circuit_title="[Random circuit]:::#{circuit_name}:::"
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
