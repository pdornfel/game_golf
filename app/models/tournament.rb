class Tournament < ActiveRecord::Base

  belongs_to :course

  has_many :results

  def pick(user)
    Pick.find_by(tournament: self.id)
  end

  def has_not_started_yet
    tournament_start > Date.today
  end

  def winner
    result = results.find_by(position: 1)
    if result
      "#{result.player.first_name} #{result.player.last_name}"
    end
  end

end