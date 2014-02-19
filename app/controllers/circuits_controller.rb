class CircuitsController < ApplicationController
  

  def form(name="Akho Code",action="random")
    @circuit_title=""
    if params[:name].nil? || params[:name].empty?
      circuit_name= name
      params[:name]=circuit_name
    else
      circuit_name=  params[:name] 
    end
    
    if params[:do_action].nil? || params[:do_action].empty?
      to_do= action
    else
      to_do=  params[:do_action] 
    end
   
    case to_do  
    when "random"    
      get_rand_circuit(circuit_name)
      @circuit_title="[Random circuit]:::#{circuit_name}:::"
    when "blank"    
      get_blank_circuit()
      @circuit_title="[BLANK Circuit]:::"
      when "edit"    
        get_rand_circuit(circuit_name)
        @circuit_title="[Circuit to Edit]:::#{circuit_name}:::"
    else
      puts "something is wrong"
    end 
     

  end
  
  def random(name="Random")
    @circuit_title=""
    if params[:name].nil? || params[:name].empty?
      circuit_name= name
    else
      circuit_name=  params[:name] 
    end
    
    get_rand_circuit(circuit_name)
    @circuit_title="[Random circuit]:::#{circuit_name}:::"
  end
  
  def blank()
       get_blank_circuit()
       @circuit_title="[BLANK Circuit]:::"

       end 
        

  
end
