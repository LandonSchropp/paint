class StrokeGestureRecognizer < UIGestureRecognizer
  attr_accessor :position

  def touchesBegan(touches, withEvent: event)
    super
    @position = touches.anyObject.locationInView(self.view)
    self.state = UIGestureRecognizerStateBegan
  end

  def touchesMoved(touches, withEvent: event)
    super
    @position = touches.anyObject.locationInView(self.view)
    self.state = UIGestureRecognizerStateChanged
  end

  def touchesEnded(touches, withEvent: event)
    super
    @position = touches.anyObject.locationInView(self.view)
    self.state = UIGestureRecognizerStateEnded
  end

  def touchesCancelled(touches, withEvent: event)
    super
    @position = touches.anyObject.locationInView(self.view)
    self.state = UIGestureRecognizerStateEnded
  end
end