class Tournament < ActiveRecord::Base

  belongs_to :course

  has_many :results

  def to_param
    "#{id} #{event_name}".parameterize
  end

  def self.all_2014
    start_year = Date.parse("October 1 2013")
    end_year = Date.parse("October 1 2014")
    t = Tournament.where(['tournament_start >= ? AND tournament_start <= ?', start_year, end_year])
    t.order(:tournament_start)
    # 10/1/2013 - 10/1/2014 = 2014 season
  end

  def self.all_2015
    start_year = Date.parse("October 1 2014")
    end_year = Date.parse("November 1 2015")
    t = Tournament.where(['tournament_start >= ? AND tournament_start <= ?', start_year, end_year])
    t.order(:tournament_start)
    # 10/1/2014 - 11/1/2015 = 2015 season
  end 

  def pick(user)
    Pick.find_by(tournament: self.id, user: user)
  end

  def tournament_start_formatted
    tournament_start.strftime('%b %d, %Y')
  end

  def has_not_started_yet
    tournament_start > Date.today
  end

  def winner_formatted
    result = results.find_by(position: 1)
    if result
      "#{result.player.first_name} #{result.player.last_name}"
    end
  end

  def winner
    self.results.winner
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