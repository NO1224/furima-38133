class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #Tableアソシエーション
  belongs_to :user
  belongs_to :item
  has_one :destination
end
