class Task < ActiveRecord::Base
  belongs_to :list
  
  validates :list, presence: true
  validates :description, presence: true
  
  def days_left
    [7 - (Time.zone.now.to_date - created_at.to_date).to_i, 0].max
  end
  
  def to_s
    description
  end
end
