class Player < ActiveRecord::Base

  has_many :picks
  has_many :users, through: :picks

  scope :ranked, ->  { order(:world_rank) }

  def name
    "#{first_name} #{last_name} - #{world_rank}"
  end

end