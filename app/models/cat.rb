class Cat < ApplicationRecord
  has_many :tips_cats
  has_many :tips, through: :tips_cats
  def self.counttips
    left_outer_joins(:tips).select("cats.name, count(tips.id) as nbtip").group("cats.id").order("nbtip desc")
  end
  def self.findcat(x)
    where("parameterize(name) like ?",x)[0]
  end
end
