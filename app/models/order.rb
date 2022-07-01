class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #Tableアソシエーション
  belongs_to :user
  belongs_to :items
  has_one :destination
end
