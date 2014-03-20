class Push < ActiveRecord::Base
  
  belongs_to :pushable, polymorphic: true
  default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 156 }
  validates :pushable_id, presence: true
  
  
  
  def designer
     if self.pushable_type = "Designer"
       return Designer.find(self.pushable_id)
     else
       return Designer.find(Daemon.find(self.pushable_id).designer_id)
     end
    
   end

  
  
end
