class Cat < ApplicationRecord
  def self.findcat(x)
    where("parameterize(name) like ?",x)[0]
  end
end
