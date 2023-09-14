class ApplicationController < ActionController::Base
  before_action :fav
  def fav
    session[:myfav] ||= {}
    @nb_tips=user_signed_in? ? current_user.myfavs.length : session[:myfav].keys.length
    session[:mynote] ||= []
  end
end
