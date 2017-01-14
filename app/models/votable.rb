module Votable
  def vote_count
    self.votes.reduce(0){|memo, vote| memo + vote.vote_count }
  end
end
