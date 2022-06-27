class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_pay
  belongs_to :delivery_source
  belongs_to :delivery_time

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id,        numericality: { other_than: 1,
                                                   message: "can't be blank" }
    validates :condition_id,       numericality: { other_than: 1,
                                                   message: "can't be blank" }
    validates :delivery_pay_id,    numericality: { other_than: 1,
                                                   message: "can't be blank" }
    validates :delivery_source_id, numericality: { other_than: 1,
                                                   message: "can't be blank" }
    validates :delivery_time_id,   numericality: { other_than: 1,
                                                   message: "can't be blank" }
    validates :price
  end
end
