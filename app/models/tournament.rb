class Tournament < ActiveRecord::Base

  belongs_to :course

  def pick(user)
    Pick.find_by(tournament: self.id)
  end

end