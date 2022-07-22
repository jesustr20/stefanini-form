class Lab < ApplicationRecord
  #Validations
  validates :code, presence: true, uniqueness: true
  validates :productname, presence: true, uniqueness: { message: "Product already exists" }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0}
  has_enumeration_for :labname, with: ::Labs::Labname, required: true,
                      create_scopes: true  #create_scopes: true

end
