class ParticipantsController < ApplicationController
  def create
    Participant.create!(participant_params)
    redirect_to root_path
  end

  private

  def participant_params
    params.require(:participant).permit(:name)
  end
end
