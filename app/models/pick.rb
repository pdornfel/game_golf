class Pick < ActiveRecord::Base

  belongs_to :user
  belongs_to :player
  belongs_to :tournament

end