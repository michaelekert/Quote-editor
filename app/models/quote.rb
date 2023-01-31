class Quote < ApplicationRecord
  has_many :line_item_dates, dependent: :destroy
  belongs_to :company
  validates :name, presence: true
  has_many :line_items, through: :line_item_dates

  scope :ordered, ->{order(id: :desc)}



   broadcasts_to -> (quote) {[quote.company, "quotes"]}, inserts_by: :prepend

  def total_price
    line_items.sum(&:total_price)
  end
end
