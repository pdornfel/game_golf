class Pick < ActiveRecord::Base

  validates :user, :uniqueness => {:scope => :player, message: "Cannot Pick Same Player Twice" }

  belongs_to :user
  belongs_to :player
  belongs_to :tournament

end