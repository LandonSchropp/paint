describe StrokeGestureRecognizer do
  extend Facon::SpecHelpers

  before do
    @stroke_gesture_recognizer = StrokeGestureRecognizer.new
    @touch1 = mock(UITouch, :"locationInView:" => CGPoint.new(100, 200))
    @touch2 = mock(UITouch, :"locationInView:" => CGPoint.new(300, 400))
    @touches1 = NSSet.setWithArray [ @touch1 ]
    @touches2 = NSSet.setWithArray [ @touch2 ]
  end

  describe "#touchesBegan:withEvent:" do

    before do
      @stroke_gesture_recognizer.touchesBegan(@touches1, withEvent: nil)
    end

    it "sets the position to the gesture's position" do
      @stroke_gesture_recognizer.position.should == CGPoint.new(100, 200)
    end

    it "sets the state of the gesture recognizer" do
      @stroke_gesture_recognizer.state.should == UIGestureRecognizerStateBegan
    end
  end

  describe "#touchesMoved:withEvent:" do

    before do
      @stroke_gesture_recognizer.touchesBegan(@touches1, withEvent: nil)
      @stroke_gesture_recognizer.touchesMoved(@touches2, withEvent: nil)
    end

    it "sets the position to the gesture's position" do
      @stroke_gesture_recognizer.position.should == CGPoint.new(300, 400)
    end

    it "sets the state of the gesture recognizer" do
      @stroke_gesture_recognizer.state.should == UIGestureRecognizerStateChanged
    end
  end

  describe "#touchesEnded:withEvent:" do

    before do
      @stroke_gesture_recognizer.touchesBegan(@touches1, withEvent: nil)
      @stroke_gesture_recognizer.touchesEnded(@touches2, withEvent: nil)
    end

    it "sets the position to the gesture's position" do
      @stroke_gesture_recognizer.position.should == CGPoint.new(300, 400)
    end

    it "sets the state of the gesture recognizer" do
      @stroke_gesture_recognizer.state.should == UIGestureRecognizerStateEnded
    end
  end

  describe "#touchesCancelled:withEvent:" do

    before do
      @stroke_gesture_recognizer.touchesBegan(@touches1, withEvent: nil)
      @stroke_gesture_recognizer.touchesCancelled(@touches2, withEvent: nil)
    end

    it "sets the position to the gesture's position" do
      @stroke_gesture_recognizer.position.should == CGPoint.new(300, 400)
    end

    it "sets the state of the gesture recognizer" do
      @stroke_gesture_recognizer.state.should == UIGestureRecognizerStateEnded
    end
  end
end