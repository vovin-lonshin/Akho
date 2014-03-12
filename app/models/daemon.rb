class PhaseValidator < ActiveModel::Validator
  def validate(record)
    msg=""
    if record.name.nil?
      record.name=""
      msg="Must have a name" 
    end
    if record.phase.nil?
      record.phase=""
      msg="Must have a phase" 
    end
    if record.phase.length != record.name.length
      msg="Phase and Name must have same length" 
    end
    if msg != ""
      record.errors[:base] << msg
    end  
 end
end
 


class Daemon < ActiveRecord::Base
  belongs_to :desinger
  
  
  validates_with PhaseValidator
  validates :designer_id, presence: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }
  validates :phase, format: { with: /\A[+-0]+\Z/,
  message: "only allows +,0, or - " }
 

  def get_name(string="",integer=0)
    if integer==0 
      num=3+rand(4)
    else
      num=integer
    end  
    
    if string==""
      string="Great daemon of AKHO, I Desire to create change through the power of my Belief, that I my fulfill my Will!"
    end 
      
    dd=string.split.join.upcase
    if num>dd.length
      dd=dd.ljust(num,"AKHO")
    end  
    
    pad=dd.length
    if (pad % num) != 0
      pad=pad+(num-(pad % num))
    end
    
    dd=dd.ljust(pad,"IAO")
    dd=dd.scan(/[A-Z]/).join.scan(/[^U^G]/).join
    dd=dd.split(//).shuffle
    dd=dd.in_groups(num)

   (0..dd.length-1).each do |col|
   
      dd[col].each do |i|
          if dd[col].length >1
             dd[col] = dd[col].shuffle[0..-2]
          else
            dd[col] = dd[col]
         end
      end
   end
    get_name=dd.join
 end
  
  
end
