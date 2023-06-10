class Participant < ApplicationRecord
  has_many :pairings

  def self.update_pairs
    participants = all.shuffle
    participants.each_slice(2) do |participant1, participant2|
      participant1.update(pair: participant2.name)
      participant2.update(pair: participant1.name)
    end
  end
end


