class SearchController < ApplicationController
  def index
      render locals: {
        facade: SearchFacade.new(params[:q])
      }
  end
end
