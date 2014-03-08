class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'RMagick'
  
  # Create a random circuit
  
  def get_rand_circuit(name="circvit")
   
      name=name.upcase.scan(/[A-Z]/).join.scan(/[^U]/).join.split(//)
     
          
          family= %w{will belief desire}
           family=family.shuffle
          
           fill = Magick::HatchFill.new("Transparent", "LightGreen")
        
           i = Magick::ImageList.new 
           i.new_image(333, 333, fill){ self.background_color = "Transparent" }
           gc = Magick::Draw.new
           
       
       gc.gravity(Magick::CenterGravity)
       gc.stroke("#33cc33")
       gc.fill("#222222")
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

           (0..name.length-1).each do |n|
             i.new_image(333, 333){ self.background_color = "Transparent" }
             gc = Magick::Draw.new    
             gc.stroke("transparent")
             gc.fill("transparent")
             
             gc.pointsize = (52 + (rand(23)) )
            
             gc.gravity(Magick::CenterGravity)
              f=rand(3)
              gc.font= "#{Rails.root}/app/assets/fonts/akho#{family[f]}.ttf" 
              gc.text((-rand(72) + rand(72)), (-rand(72) + rand(72)), name[n]).rotate(rand(360))
              gc.fill('red')
              gc.text((-rand(72) + rand(72)), (-rand(72) + rand(72)), name[n]).rotate(rand(360))
              gc.draw(i)
            
           end
        @Circuit=i.flatten_images
        @Circuit.format = 'png'
        # send_data @Circuit.to_blob ,type: "image/png" , disposition: "inline"
         require 'base64'

         data_uri = Base64.encode64(@Circuit.to_blob).gsub(/\n/, "") 
         @image_tag = '<img alt="preview" src="data:image/png;base64,%s">' % data_uri
       
     end 

     # Create a blank circuit

def get_blank_circuit()
 
  style_url= "http://#{request.host}:#{request.port}/assets/application.css"
  
   img= Rasem::SVGImage.new(333, 333,style_url) do |f|
      
      
      circle 175, 175, 140, :stroke=>"#33cc33", :fill=>"none", :stroke_width=>20
      circle 175, 175, 150, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
      circle 175, 175, 130, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
      circle 175, 175, 148, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
      circle 175, 175, 134, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
      
     end
    @Circuit=img.output
   end    
      


end
