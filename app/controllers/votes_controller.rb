class VotesController < ApplicationController
  before_action :load_answer_and_vote

  def up_vote

    if @vote
      @vote.update_attribute(:value, 1)
    else
      @vote = current_user.answers.create(value: 1, answer: @answer)
    end
    # http://apidock.com/rails/ActionController/Base/redirect_to
    redirect_to :back
  end

  def down_vote

    if @vote
      @vote.update_attribute(:value, -1)
    else
      @vote = current_user.answers.create(value: -1, answer: @answer)
    end
    # http://apidock.com/rails/ActionController/Base/redirect_to
    redirect_to :back
  end

  private

  def load_answer_and_vote
    @answer = Answer.find(params[:answer_id])
    @vote = @answer.votes.where(user_id: current_user.id).first
  end

  def update_vote(new_value)
    if @vote
       authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
       @vote = current_user.votes.build(value: new_value, answer: @answer)
       authorize @vote, :create?
       @vote.save
    end
  end
end
