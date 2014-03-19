class Bulletin < ActiveRecord::Base
  belongs_to :designer
  default_scope -> { order('created_at DESC') }
  validates :designer_id, presence: true
  validates :content, presence: true, length: { maximum: 333 }
end
