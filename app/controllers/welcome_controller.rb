class WelcomeController < ApplicationController
   include Clearance::Controller
  protect_from_forgery with: :exception

  def index
  end
end