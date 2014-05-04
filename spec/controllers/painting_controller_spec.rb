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
end