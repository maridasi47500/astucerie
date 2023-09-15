class Tip < ApplicationRecord
  paginates_per 14
  has_many :tips_cats
  belongs_to :user
  has_many :comments
  has_many :notes
  has_many :cats, through: :tips_cats
  def inmyfav(myuser,sesionfav)
    if (myuser and myuser.myfavtips.include?(self)) or sesionfav[self.id.to_s] == "fav"
      "&#x2665;"
    else
      " &#x2661;"
    end
  end
  def self.thismyfav
    " &#x2665;"
  end
   def thissum
         Tip.left_outer_joins(:notes).select("tips.id tipid, sum(notes.note) mysum").group("tipid").having("tipid = #{self.id}")[0].mysum.to_i
           end
   def moy
         Tip.left_outer_joins(:notes).select("tips.id tipid, avg(notes.note) moynote").group("tipid").having("tipid = #{self.id}")[0].moynote.to_i
           end
     def nbnote
           Tip.left_outer_joins(:notes).select("tips.id tipid, count(notes.id) mynbnote").group("tipid").having("tipid = #{self.id}")[0].mynbnote
             end
  def self.thisnotmyfav
    " &#x2661;"
  end
  def inmyfavyesno(myuser,sesionfav)
    if (myuser and myuser.myfavtips.include?(self)) or sesionfav[self.id.to_s] == "fav"
      "true"
    else
      " false"
    end
  end
   def self.findtip(x)
         where("parameterize(title) like ?",x)[0]
           end
  def self.firsttip
    limit(1).offset(0)
  end
  def self.secondtip
    limit(1).offset(1)
  end
  def self.thirdtip
    limit(1).offset(2)
  end
  def self.fourthtip
    limit(1).offset(3)
  end
  def self.tip5
    limit(10).offset(4)
  end
end
