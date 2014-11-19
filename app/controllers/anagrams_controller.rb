class AnagramsController < ApplicationController
  respond_to :json
  def show
    @anagrams = current_user.as(AnagramFinder).find(anagrams_params[:anagrams])
  end

  private

  def anagrams_params
    params.permit(:anagrams)
  end

end