class Pairing < ApplicationRecord
  def self.max_unique_pairs
    Participant.count * (Participant.count - 1) / 2
  end

  def self.generate_round
    if Pairing.count >= max_unique_pairs
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

