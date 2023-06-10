class PairingsController < ApplicationController
  def index
    @pairs = Pairing.all
    @latest_pairing = Pairing.last
  end

  def create
    Pairing.generate_round
    redirect_to pairings_path(show_latest_pairs: true), notice: 'Duplas geradas com sucesso'
  rescue => e
    redirect_to root_path, alert: e.message
  end


end


