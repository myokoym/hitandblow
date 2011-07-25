require 'ruboto'

ruboto_import_widgets :TextView, :EditText, :LinearLayout, :Button

$activity.handle_create do |bundle|
  setTitle 'Hit and Blow!'

  setup_content do
    @answer = Array.new(10) {|i| i.to_s }.shuffle.slice(0, 4)
    @input = []

    linear_layout :orientation => LinearLayout::VERTICAL do
      NUM_BTN_SIDE = 70
      CTRL_BTN_HEIGHT = 40
      @input_view = edit_text :text => @input.join, :width => :wrap_content, :id => 42

      linear_layout :orientation => LinearLayout::HORIZONTAL do
        button :text => "1", :width => CELL_SIDE, :height => CELL_SIDE, :id => 51
        button :text => "2", :width => CELL_SIDE, :height => CELL_SIDE, :id => 52
        button :text => "3", :width => CELL_SIDE, :height => CELL_SIDE, :id => 53
      end

      linear_layout :orientation => LinearLayout::HORIZONTAL do
        button :text => "4", :width => CELL_SIDE, :height => CELL_SIDE, :id => 54
        button :text => "5", :width => CELL_SIDE, :height => CELL_SIDE, :id => 55
        button :text => "6", :width => CELL_SIDE, :height => CELL_SIDE, :id => 56
      end

      linear_layout :orientation => LinearLayout::HORIZONTAL do
        button :text => "7", :width => CELL_SIDE, :height => CELL_SIDE, :id => 57
        button :text => "8", :width => CELL_SIDE, :height => CELL_SIDE, :id => 58
        button :text => "9", :width => CELL_SIDE, :height => CELL_SIDE, :id => 59
      end

      linear_layout :orientation => LinearLayout::HORIZONTAL do
        button :text => "Submit", :width => CELL_SIDE, :height => CELL_HEIGHT,:id => 61
        button :text => "0", :width => CELL_SIDE, :height => CELL_SIDE, :id => 50
        button :text => "Delete", :width => CELL_SIDE, :height => CELL_HEIGHT, :id => 62
      end

      linear_layout :orientation => LinearLayout::VERTICAL do
        @answer_view = text_view :text => "", :width => :fill_parent, :id => 71
        @hit_blow_view = text_view :text => "", :width => :fill_parent, :id => 72
      end
    end
  end

  handle_click do |view|
    case view.getText
    when /\d+/ 
      @input << view.getText
      @input_view.setText @input.join
    when "Delete"
      @input.pop
      @input_view.setText @input.join
    when "Submit"
      hit = @input.zip(@answer).count {|v| v.uniq.size == 1 }
      blow = @input.count {|v| @answer.include?(v) }
      blow = blow - hit
      @answer_view.setText @input.join
      @hit_blow_view.setText "hit: #{hit}, blow: #{blow}"
      @input = []
      @input_view.setText @input.join
    end
  end
end
