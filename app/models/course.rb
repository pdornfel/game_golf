class Course < ActiveRecord::Base

  has_many :tournaments
  has_many :holes

end