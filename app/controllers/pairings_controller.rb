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

  def add_manual_pair
    pair1 = params[:participant1] + " e " + params[:participant2]
    pair2 = params[:participant2] + " e " + params[:participant1]

    if Pairing.exists?(pair: pair1) || Pairing.exists?(pair: pair2)
      redirect_to pairings_path, alert: 'Esta dupla já existe no histórico'
    else
      Pairing.create(pair: pair1)
      redirect_to pairings_path, notice: 'Dupla adicionada com sucesso'
    end
  end
end


