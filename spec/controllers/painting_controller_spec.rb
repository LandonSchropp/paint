describe PaintingController do
  tests PaintingController, :storyboard => 'main', :id => 'PaintingController'

  describe "#black_button" do
    it "is connected in the storyboard" do
      controller.black_button.should.not.be.nil
    end
  end

  describe "#purple_button" do
    it "is connected in the storyboard" do
      controller.purple_button.should.not.be.nil
    end
  end

  describe "#green_button" do
    it "is connected in the storyboard" do
      controller.green_button.should.not.be.nil
    end
  end

  describe "#blue_button" do
    it "is connected in the storyboard" do
      controller.blue_button.should.not.be.nil
    end
  end

  describe "#white_button" do
    it "is connected in the storyboard" do
      controller.white_button.should.not.be.nil
    end
  end

  describe "#select_color" do

    before do
      controller.select_color(controller.green_button)
    end

    it "deselects the other colors" do
      controller.black_button.state.should == UIControlStateNormal
      controller.purple_button.state.should == UIControlStateNormal
      controller.blue_button.state.should == UIControlStateNormal
      controller.white_button.state.should == UIControlStateNormal
    end

    it "selects the color" do
      controller.green_button.state.should == UIControlStateSelected
    end
  end

  describe "#selected_color" do

    before do
      controller.select_color(controller.green_button)
    end

    it "returns the correct color" do
      controller.selected_color.should == PaintingController::COLORS[2]
    end
  end

  describe "#painting_view" do
    it "is connected in the storyboard" do
      controller.painting_view.should.not.be.nil
    end
  end

  describe "#viewDidLoad" do

    it "sets the painting" do
      controller.painting.should.be.instance_of Painting
    end

    it "sets the painting attribute of the painting view" do
      controller.painting_view.painting.should == controller.painting
    end
  end

  describe "#stroke_gesture_changed" do

    before do
      drag(controller.painting_view, :points => [ CGPoint.new(100, 100), CGPoint.new(150, 150), CGPoint.new(200, 200) ])
    end

    it "adds the points to the stroke" do
      controller.painting.strokes.first.points[0].should == CGPoint.new(100, 100)
      controller.painting.strokes.first.points[1].should == CGPoint.new(150, 150)
      controller.painting.strokes.first.points[2].should == CGPoint.new(200, 200)
    end

    it "sets the stroke's color to the selected color" do
      controller.painting.strokes.first.color.should == controller.selected_color
    end
  end

  describe "#painting_view" do

    it "is connected in the storyboard" do
      controller.painting_view.should.not.be.nil
    end

    it "has a stroke gesture recognizer" do
      controller.painting_view.gestureRecognizers.length.should == 1
      controller.painting_view.gestureRecognizers[0].should.be.instance_of StrokeGestureRecognizer
    end
  end
end