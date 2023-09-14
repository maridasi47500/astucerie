class Note < ApplicationRecord
  belongs_to :user
  belongs_to :tip
  def self.mynote(x)
    case x
    when 1
      "Pas du tout utile"
    when 2
      "Assez utile"
    when 3
      "Utile"
    when 4
      "Très utile"
    when 5
      "Indispensable"
    end
  end
  def moy
    Tip.joins(:notes).select("tips.id tipid, moy(notes.note) moynote").group("tipid").having("tipid = #{self.id}")[0].moynote.to_i
  end
  def nbnote
    Tip.joins(:notes).select("tips.id tipid, count(notes.id) nbnote").group("tipid").having("tipid = #{self.id}")[0].nbnote
  end

end
