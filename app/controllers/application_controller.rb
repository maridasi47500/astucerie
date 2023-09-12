class ApplicationController < ActionController::Base
  before_action :fav
  def fav
    session[:fav] ||= []
    @nb_tips=session[:fav].length
  end
end
