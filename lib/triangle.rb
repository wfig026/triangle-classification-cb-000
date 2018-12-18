class Triangle
  # write code here
  attr_accessor :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
    @test_one = (@side_one == @side_two)
    @test_two = (@side_two == @side_three)
    @test_three = (@side_one == @side_three)
    @test_four = ((@side_one + @side_two) <= @side_three) ||
                 ((@side_two + @side_three) <= @side_one) ||
                 ((@side_one + @side_three) <= @side_two)
    @test_five = @side_one <= 0 || @side_two <= 0 || @side_three <= 0
  end

  def kind
    if @test_four || @test_five
      raise TriangleError
    elsif @test_one && @test_two
      return :equilateral
    elsif @test_one || @test_two || @test_three
      return :isosceles
    else
      return :scalene
    end
  end
  
  class TriangleError < StandardError
    # triangle error code
  end
end
