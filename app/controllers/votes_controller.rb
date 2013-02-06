class VotesController < ApplicationController

  def create
    vote = @current_user.votes.find_by_joke_id(params[:joke_id])
    if vote.nil?
      @current_user.votes.create(:joke_id => params[:joke_id],
                                 :score => params[:score])
      redirect_to '/'
    else
      vote.update_attributes(:score => params[:score])
      redirect_to '/'
    end
  end
end
