class VotesController < ApplicationController
  def create
    if Vote.where('voter_id = ? AND review.id = ?', params[], params[]) != nil
      don't create
    elsif Vote.where('voter_id = ? AND restaurant.id = ?', params[], params[]) != nil
      don't create
    elsif Vote.where('voter_id = ? AND comment.id = ?', params[], params[]) != nil
      don't create
    elsif something something review id
      Vote.create('voter_id = ? AND review.id = ?', params[], params[])
    elsif something something restaurant id
      Vote.create('voter_id = ? AND restaurant.id = ?', params[], params[])
    elsif something something comment id
      Vote.create('voter_id = ? AND comment.id = ?', params[], params[])
    else

  end
end
