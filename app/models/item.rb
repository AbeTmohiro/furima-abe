class Item < ApplicationRecord
  with_options numericality: { other_than: 0, message: 'Select please.' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :delivery_day_id
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  has_one_attached :image

  belongs_to :user
  has_one :deal

end
