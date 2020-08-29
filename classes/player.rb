class Player

  def initialize(name)
    @name = name
    @lives =3
  end

  def name
    @name
  end

  def lives()
    @lives = @points
  end

  def isAlive?
    @lives>0
  end

  def question_opportunity(answer,result)
    result == answer ? (@points = @lives+1) : (@points = @lives-1)
  end

end