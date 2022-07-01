class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #Tableアソシエーション
  belongs_to :order
  #ActiveHashアソシエーション
  belongs_to :prefecture
end
