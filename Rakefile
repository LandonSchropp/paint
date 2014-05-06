# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

require "sugarcube-color"
require "motion-facon"

Motion::Project::App.setup do |app|
  app.name = 'Paint'
  app.info_plist['UIStatusBarHidden'] = true
  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = false
  app.icons = [ "icon.png" ]
end