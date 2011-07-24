require 'ruboto'

ruboto_import_widgets :TextView, :EditText, :LinearLayout, :Button

$activity.handle_create do |bundle|
  setTitle 'Hit and Blow!'

  setup_content do
    @answer = Array.new(4) { rand(10).to_s }
    @input = []
    linear_layout :orientation => LinearLayout::VERTICAL do
      @input_view = text_view :text => @input.join, :width => :wrap_content, :id => 42
      linear_layout :orientation => LinearLayout::HORIZONTAL do
        0.upto(9) do |i|
          button :text => "#{i}", :width => :wrap_content, :id => 43 + i
        end
      end

      linear_layout :orientation => LinearLayout::HORIZONTAL do
        button :text => "Submit", :width => :wrap_content, :id => 61
        button :text => "Delete", :width => :wrap_content, :id => 62
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
      #toast 'input!'
    when "Delete"
      @input.pop
      @input_view.setText @input.join
    when "Submit"
      hit = @input.zip(@answer).count {|v| v.uniq.size == 1 }
      blow = @input.count {|v| @answer.include?(v) }
      blow = blow - hit
      @answer_view.setText @answer.join
      @hit_blow_view.setText "hit: #{hit}, blow: #{blow}"
    end
  end
end
