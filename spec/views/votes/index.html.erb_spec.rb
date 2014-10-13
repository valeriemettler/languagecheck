require 'rails_helper'

RSpec.describe "votes/index", :type => :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :value => 1,
        :user => nil,
        :answer => nil
      ),
      Vote.create!(
        :value => 1,
        :user => nil,
        :answer => nil
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
