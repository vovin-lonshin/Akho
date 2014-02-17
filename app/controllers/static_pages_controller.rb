class StaticPagesController < ApplicationController
   before_filter :set_cache_buster, only: [:home]
  
  def home
    get_rand_circiut
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
  
  def get_rand_circiut
  image_path=Rails.root.join("app", "assets", "images")+"site"
  url= File.expand_path("../circiut.svg",image_path)
  style_path=Rails.root.join("app", "assets", "stylesheet")

   style_url= "http://#{request.host}:#{request.port}/assets/application.css"

  
  family="desire will belief"
  family=family.split
  
  File.open(url, "w") do |f|
    Rasem::SVGImage.new(333, 333,style_url, f) do |f|
    
      group  :fill=>"dd3333" do
      ran=rand(360)
       text 175, 175, "A", :class=>"#{family.shuffle.first}", "font-size"=>72, :transform=>" rotate(#{ran}, 175,175)"
      ran=rand(360)
       text 175, 175, "K", :class=>"#{family.shuffle.first}", "font-size"=>72, :transform=>" rotate(#{ran}, 175,175)"
      ran=rand(360)
       text 175, 175, "H", :class=>"#{family.shuffle.first}", "font-size"=>72, :transform=>" rotate(#{ran}, 175,175)"
      ran=rand(360)
       text 175, 175, "O", :class=>"#{family.shuffle.first}", "font-size"=>72, :transform=>" rotate(#{ran}, 175,175)"
      end
      circle 175, 175, 140, :stroke=>"#33cc33", :fill=>"none", :stroke_width=>20
      circle 175, 175, 150, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
      circle 175, 175, 130, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
      circle 175, 175, 148, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
      circle 175, 175, 134, :stroke=>"#3333cc", :fill=>"none", :stroke_width=>2
        end
     end
  end 
  
end
