class Painting
  attr_accessor :strokes

  def initialize
    @strokes = []
  end

  def start_stroke(point, color)
    strokes << Stroke.new(point, color)
  end

  def continue_stroke(point)
    current_stroke.add_point(point)
  end

  def current_stroke
    strokes.last
  end
end