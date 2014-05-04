class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    storyboard = UIStoryboard.storyboardWithName("main", bundle: nil)
    @window.rootViewController = storyboard.instantiateInitialViewController

    true
  end
end