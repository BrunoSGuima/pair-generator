class Pairing < ApplicationRecord
  def self.generate_pairs
    participants = Participant.all.shuffle

    participants.each_slice(2) do |participant1, participant2|
      Pairing.create(pair: "#{participant1.name} e #{participant2.name}")
      Pairing.create(pair: "#{participant2.name} e #{participant1.name}")
    end
  end
end


