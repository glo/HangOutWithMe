class Event < ActiveRecord::Base
  attr_accessible :activity, :location, :start_time
  belongs_to :user
  
  validates :activity, presence: true, length: { maximum: 500 }
  validates :location, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  
  default_scope order: 'events.created_at DESC'
end
