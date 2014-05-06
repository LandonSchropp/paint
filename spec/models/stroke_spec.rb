describe Stroke do

  before do
    @start_point = CGPoint.new(0.0, 50.0)
    @middle_point = CGPoint.new(50.0, 100.0)
    @end_point = CGPoint.new(100.0, 0.0)
    @color = UIColor.blueColor

    @stroke = Stroke.new(@start_point, @color)
    @stroke.add_point(@middle_point)
    @stroke.add_point(@end_point)
  end

  describe "#initialize" do
    before do
      @stroke = Stroke.new(@start_point, @color)
    end

    it "sets the color" do
      @stroke.color.should == @color
    end
  end

  describe "#start_point" do
    it "returns the stroke's start point" do
      @stroke.start_point.should == @start_point
    end
  end

  describe "#add_point" do
    it "adds the points to the stroke" do
      @stroke.points.should == [ @start_point, @middle_point, @end_point ]
    end
  end

  describe "#start_point" do
    it "returns the start point" do
      @stroke.start_point.should == @start_point
    end
  end
end