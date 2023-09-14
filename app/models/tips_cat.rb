class TipsCat < ApplicationRecord
  belongs_to :cat
  belongs_to :tip
  validates_uniqueness_of :cat_id, scope: :tip_id
end
