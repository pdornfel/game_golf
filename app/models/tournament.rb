class Tournament < ActiveRecord::Base

  belongs_to :course

  has_many :results

  def pick(user)
    Pick.find_by(tournament: self.id)
  end

end