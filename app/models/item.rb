class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #Tableアソシエーション
  belongs_to :user
  #ActiveHashアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_pay
  belongs_to :delivery_source
  belongs_to :delivery_time
  #ActiveStorageアソシエーション
  has_one_attached :image

  #画像ファイル拡張子指定
  validate :image_content_type, if: :was_attached?

  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "format or file extension is not valid") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end
  #//画像ファイル拡張子指定

  with_options presence: true do
    validates :image
    validates :name,        length: {maximum: 40}
    validates :explanation, length: {maximum: 1000}
    validates :price,       numericality: { allow_blank: true,
                                           only_integer: true, 
                                           greater_than: 300,
                                           less_than: 9999999}
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_pay_id
    validates :delivery_source_id
    validates :delivery_time_id
  end
end
