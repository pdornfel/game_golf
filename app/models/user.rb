class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password
  validates_presence_of :full_name
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email

  has_many :picks
  has_many :players, through: :picks

  def earnings_formatted
    "$#{separate_comma(self.earnings)}"
  end

  def earnings_updated_at_formatted
    if earnings_updated_at.nil?
      "Not Updated Yet"
    else
      earnings_updated_at.in_time_zone(Time.zone).strftime('%B %d, %Y at %I:%M%P')
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

end