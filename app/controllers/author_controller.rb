class AuthorController < ApplicationController
  def show
    @mycats=Cat.counttips
    @user=User.findname(current_user.try(:username))
  end
end
