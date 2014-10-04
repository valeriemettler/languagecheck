require 'rails_helper'

RSpec.describe "questions/index", :type => :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        :body => "MyText"
      ),
      Question.create!(
        :body => "MyText"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
