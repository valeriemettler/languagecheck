require 'rails_helper'

RSpec.describe "votes/edit", :type => :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :value => 1,
      :user => nil,
      :answer => nil
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input#vote_value[name=?]", "vote[value]"

      assert_select "input#vote_user_id[name=?]", "vote[user_id]"

      assert_select "input#vote_answer_id[name=?]", "vote[answer_id]"
    end
  end
end
