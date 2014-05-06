class PaintingController < UIViewController
  extend IB

  attr_reader :painting

  outlet :black_button
  outlet :purple_button
  outlet :green_button
  outlet :blue_button
  outlet :white_button
  outlet :painting_view

  COLORS = [
    "#333333".uicolor,
    "#7059ac".uicolor,
    "#196e76".uicolor,
    "#80a9cc".uicolor,
    "#fafafa".uicolor
  ]

  def select_color(sender)

    buttons.each do |button|
      button.selected = false
    end

    sender.selected = true
  end

  def selected_color
    COLORS[buttons.find_index { |button| button.state == UIControlStateSelected }]
  end

  def viewDidLoad
    @painting = Painting.new
    painting_view.painting = painting
  end

  def stroke_gesture_changed(stroke_gesture_recognizer)

    if stroke_gesture_recognizer.state == UIGestureRecognizerStateBegan
      painting.start_stroke(stroke_gesture_recognizer.position, selected_color)
    else
      painting.continue_stroke(stroke_gesture_recognizer.position)
    end

    painting_view.setNeedsDisplay
  end

  private

  def buttons
    [ black_button, purple_button, green_button, blue_button, white_button ]
  end
end