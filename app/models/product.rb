class Product < ApplicationRecord
  #Asosciations
  belongs_to :laboratory

  #Validations
  validates :code, presence: true, uniqueness: true
  validates :productname, presence: true, uniqueness: { true, message: "Product already exists" }
  validates :ammount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0}
end
