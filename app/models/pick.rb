class Pick < ActiveRecord::Base

  validates :user, :uniqueness => {:scope => :player } 

  belongs_to :user
  belongs_to :player
  belongs_to :tournament

end