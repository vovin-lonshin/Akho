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
       
  def png
       
  
           family= %w{will belief desire}
           family=family.shuffle
           @title = "today".upcase.split(//)
         
         i = Magick::ImageList.new 
           i.new_image(333, 333){ self.background_color = "transparent" }
           gc = Magick::Draw.new
           
       
       gc.gravity(Magick::CenterGravity)
       gc.stroke("#33cc33")
       gc.fill("Black")
       gc.stroke_width(20)
       gc.circle(167, 167, 167, 20)
       gc.stroke("#3333cc")
       gc.fill("transparent")
       gc.stroke_width(2)
       gc.circle(167, 167, 167, 25)
       gc.circle(167, 167, 167, 15)
       gc.circle(167, 167, 167, 22)
       gc.circle(167, 167, 167, 17)
       gc.draw(i)

           (0..@title.length-1).each do |n|
             i.new_image(333, 333){ self.background_color = "Transparent" }
             gc = Magick::Draw.new    
             gc.stroke("transparent")
             gc.fill("transparent")
             
             gc.pointsize = (52 + (rand(23)) )
            
             gc.gravity(Magick::CenterGravity)
              f=rand(3)
              gc.font= "#{Rails.root}/app/assets/fonts/akho#{family[f]}.ttf" 
              gc.text((-rand(72) + rand(72)), (-rand(72) + rand(72)), @title[n]).rotate(rand(360))
              gc.fill('red')
              gc.text((-rand(72) + rand(72)), (-rand(72) + rand(72)), @title[n]).rotate(rand(360))
              gc.draw(i)
            
           end
  
           canvas=i.flatten_images
           canvas.format = 'png'
           
          send_data canvas.to_blob ,type: "image/png" , disposition: "inline"
     end
   

       
   def download(data="file")
     if params[:data].nil? || params[:data].empty?
       circuit_data= data
       params[:data]=circuit_data
     else
       circuit_data=  params[:data] 
     end
   
    send_file circuit_data ,type: "image/png" , disposition: "attachment"
     
   end 

  
end
