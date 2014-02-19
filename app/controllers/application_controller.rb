class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Create a random circuit
  
  def get_rand_circuit(name="AKHO")
   
      name=name.upcase.scan(/[A-Z]/).join.scan(/[^U]/).join.split(//)
      style_url= "http://#{request.host}:#{request.port}/assets/application.css"
      family="desire will belief".split
    
    
     
     
      img= Rasem::SVGImage.new(333, 333,style_url) do |f|
         
         group  :fill=>"dd3333" do
           (0..name.length-1).each do |i|
             ran=rand(360)
             text 175, 175, name[i], :class=>"#{family.shuffle.first}", "font-size"=>72, :transform=>" rotate(#{ran}, 175,175)"
           end
         end
         circle 175, 175, 140, :stroke=>"#33cc33", :fill=>"none", :stroke_width=>20
         circle 175, 175, 150, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
         circle 175, 175, 130, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
         circle 175, 175, 148, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
         circle 175, 175, 134, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
         
        end
       @RandomCircuit=img.output
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
    @BlankCircuit=img.output
   end    
      


end
