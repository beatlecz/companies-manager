class String

  def to_const_name
    res = []
    self.capitalize!

    self.scan(/_[a-z]/) do |c|
      res << [c, $~.offset(0)[0]]
    end

    res.each do |r|
      self.sub! /#{r[0]}/,r[0][1].upcase
    end

    self
  end

end