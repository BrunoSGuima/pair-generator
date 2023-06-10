class Pairing < ApplicationRecord
  MAX_UNIQUE_PAIRS = (Participant.count * (Participant.count - 1) / 2)

  def self.generate_round
    if Pairing.count >= MAX_UNIQUE_PAIRS
      raise 'Todas as combinações possíveis já foram feitas'
    end

    participants = Participant.all.shuffle
    new_pairs = []
    
    participants.each_slice(2) do |participant1, participant2|
      pair1 = "#{participant1.name} e #{participant2.name}"
      pair2 = "#{participant2.name} e #{participant1.name}"
      if exists?(pair: pair1) || exists?(pair: pair2)
        return generate_round
      else
        new_pairs << pair1
      end
    end

    new_pairs.each do |pair|
      Pairing.create(pair: pair)
    end
  end
end
