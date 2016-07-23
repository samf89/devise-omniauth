class PagesController < ApplicationController

  before_action :authenticate_user!, only: %i(secret)

  def secret
  end

end
