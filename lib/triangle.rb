class Triangle
  attr_reader :a, :b, :c

  def initialize (a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    raise TriangleError unless validate_length? && validate_tri_ineq? 
    if (a == b && b == c)
      :equilateral
    elsif (a == b || b == c || a == c)
      :isosceles
    elsif (a != b && b != c && a != c)
      :scalene
    end
  end

  def validate_length?
    a.positive? && b.positive? && c.positive?
  end

  def validate_tri_ineq?
    a + b > c && b + c > a && a + c > b
  end

  class TriangleError < StandardError
    def message
      "Invalid lengths. The sum of the lengths of any two sides of a triangle always exceeds the length of the third side. This is a principle known as the triangle inequality."
    end
  end

end
