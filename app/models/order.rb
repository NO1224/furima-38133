class Order < ApplicationRecord
  #Tableアソシエーション
  belongs_to :user
  belongs_to :item
  has_one :destination
end
