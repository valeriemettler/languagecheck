require 'rails_helper'

RSpec.describe "votes/show", :type => :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :value => 1,
      :user => nil,
      :answer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
