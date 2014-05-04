class PaintingController < UIViewController
  extend IB

  outlet :black_button
  outlet :purple_button
  outlet :green_button
  outlet :blue_button
  outlet :white_button

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

  private

  def buttons
    [ black_button, purple_button, green_button, blue_button, white_button ]
  end
end