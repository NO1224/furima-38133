class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #Tableアソシエーション
  belongs_to :user, optional: true
  belongs_to :items, optional: true
  has_one :destination
end
