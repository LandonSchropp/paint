describe Painting do

  before do
    @point1 = CGPoint.new(10, 60)
    @point2 = CGPoint.new(20, 50)
    @point3 = CGPoint.new(30, 40)
    @point4 = CGPoint.new(40, 30)
    @point5 = CGPoint.new(50, 20)
    @point6 = CGPoint.new(60, 10)

    @painting = Painting.new
  end

  describe "#initialize" do

    before do
      @painting = Painting.new
    end

    it "sets the stroke to an empty array" do
      @painting.strokes.should == []
    end
  end

  describe "#start_stroke" do

    before do
      @painting.start_stroke(@point1, UIColor.redColor)
      @painting.start_stroke(@point2, UIColor.blueColor)
    end

    it "starts new strokes" do
      @painting.strokes.length.should == 2
      @painting.strokes[0].points.should == [ @point1 ]
      @painting.strokes[0].color.should == UIColor.redColor
      @painting.strokes[1].points.should == [ @point2 ]
      @painting.strokes[1].color.should == UIColor.blueColor
    end
  end

  describe "#continue_stroke" do

    before do
      @painting.start_stroke(@point1, UIColor.redColor)
      @painting.continue_stroke(@point2)
      @painting.start_stroke(@point3, UIColor.blueColor)
      @painting.continue_stroke(@point4)
    end

    it "adds points to the current strokes" do
      @painting.strokes[0].points.should == [ @point1, @point2 ]
      @painting.strokes[1].points.should == [ @point3, @point4 ]
    end
  end
end