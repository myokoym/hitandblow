require 'ruboto'

ruboto_import_widgets :TextView, :EditText, :LinearLayout, :Button

$activity.handle_create do |bundle|
  setTitle 'Hit and Blow!'

  setup_content do
    @input_text = ""
    linear_layout :orientation => LinearLayout::VERTICAL do
      @text_view = text_view :text => @input_text, :width => :wrap_content, :id => 42
      linear_layout :orientation => LinearLayout::HORIZONTAL do
        0.upto(9) do |i|
          button :text => "#{i}", :width => :wrap_content, :id => 43 + i
        end
      end

      linear_layout :orientation => LinearLayout::HORIZONTAL do
        button :text => "Submit", :width => :wrap_content, :id => 61
        button :text => "Delete", :width => :wrap_content, :id => 62
      end
    end
  end

  handle_click do |view|
    if /\d+/ =~ view.getText 
      @input_text << view.getText
      @text_view.setText @input_text
      toast 'input!'
    end
  end
end
