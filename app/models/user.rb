class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_presence_of :full_name
  validates_uniqueness_of :email

  has_many :picks
  has_many :players, through: :picks

end