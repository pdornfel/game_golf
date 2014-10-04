class Result < ActiveRecord::Base

  scope :winner, -> { find_by(position: 1) }

  belongs_to :tournament
  belongs_to :player

end