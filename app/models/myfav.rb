class Myfav < ApplicationRecord
  belongs_to :user
  belongs_to :tip
  validates_uniqueness_of :user_id, scope: :tip_id
  def total_number
    self.user.myfavs.length
  end
    def addedtomyfav
      p user.myfavtips
      if (self.user and self.user.myfavtip_ids.include?(self.tip_id))
                  "&#x2665;"
                      else
                              " &#x2661;"
                                  end
            end
    def addedtomyfavyesno
      p user.myfavtips
      if (user and user.myfavtip_ids.include?(self.tip_id))
                  "true"
                      else
                              "false"
                                  end
            end
end
