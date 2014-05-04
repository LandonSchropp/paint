describe AppDelegate do

  describe "#application:didFinishLaunchingWithOptions:" do

    before do
      @application = UIApplication.sharedApplication
    end

    it "creates the window" do
      @application.windows.size.should == 1
    end

    it "makes the window key" do
      @application.windows.first.isKeyWindow.should.be.true
    end

    it "sets the root view controller" do
      @application.windows.first.rootViewController.should.be.instance_of PaintingController
    end
  end
end