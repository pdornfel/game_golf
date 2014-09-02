class User < ActiveRecord::Base

  has_many :picks
  has_many :players, through: :picks

end