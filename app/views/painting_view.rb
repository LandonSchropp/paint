class PaintingView < UIView
  attr_accessor :stroke

  def drawRect(rectangle)
    super

    # ensure the stroke is provided
    return if stroke.nil?

    # set up the drawing context
    context = UIGraphicsGetCurrentContext()
    CGContextSetStrokeColorWithColor(context, stroke.color.CGColor)
    CGContextSetLineWidth(context, 20.0)
    CGContextSetLineCap(context, KCGLineCapRound)
    CGContextSetLineJoin(context, KCGLineJoinRound)

    # move the line to the start point
    CGContextMoveToPoint(context, stroke.start_point.x, stroke.start_point.y)

    # add each line in the path
    stroke.points.drop(1).each do |point|
      CGContextAddLineToPoint(context, point.x, point.y)
    end

    # stroke the path
    CGContextStrokePath(context);
  end
end