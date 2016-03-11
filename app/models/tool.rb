class Tool < ActiveRecord::Base
  validates :name, presence: true

  def formatted_price
    price / 100.00
  end
end
