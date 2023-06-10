class PairingsController < ApplicationController
  def index
    @pairs = Pairing.all
  end

  def create
    Pairing.generate_pairs
    redirect_to pairings_path(show_pairs: true), notice: 'Duplas geradas com sucesso'
  rescue
    redirect_to root_path, alert: 'Não foi possível gerar as duplas'
  end


end


