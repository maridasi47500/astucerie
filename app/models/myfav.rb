class Myfav < ApplicationRecord
  belongs_to :user
  belongs_to :tip
  def total_number
    self.user.myfavs.length
  end
    def addedtomyfav
          if (user and user.tips.include?(self))
                  "&#x2665;"
                      else
                              " &#x2661;"
                                  end
            end
end
