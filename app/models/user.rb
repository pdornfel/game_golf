class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :picks
  has_many :players, through: :picks

  def name
    "#{first_name} #{last_name}"
  end
end