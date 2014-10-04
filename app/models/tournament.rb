class Tournament < ActiveRecord::Base

  belongs_to :course

  has_many :results

  def pick(user)
    Pick.find_by(tournament: self.id, user: user)
  end

  def tournament_start_formatted
    tournament_start.strftime('%b %d, %Y')
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

  def purse_formatted
    "$#{separate_comma(self.purse)}"
  end
end

private

def separate_comma(number)
  a = number.to_s.split('')
  b = a.size/3.0
  if a.size < 4
    p number.to_s 
  elsif a.size%3 == 0
    n = -4
    (b.to_i-1).times do |i|
      a.insert(n, ',')
      n -= 4
    end
    p a.join("")
  else
      n = -4
    b.to_i.times do |i|
      a.insert(n, ',')
      n -= 4
    end
  p a.join("")
  end
end