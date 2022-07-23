class Lab < ApplicationRecord
  #Validations
  validates :code, presence: true, 
            uniqueness: {
                message: -> (object, data) do
                    "The code '#{data[:value]}' is already taken"
                end
              }
  validates :productname, presence: true, 
            uniqueness: { 
              message: -> (_, data) do
                "The Product name '#{data[:value]}' is already taken"
              end
            }
  validates :amount, presence: true, 
            numericality: { 
              only_integer: true, greater_than: 0, 
              message: -> (_, data) do
                "'#{data[:value]}' must be positive integer"
              end
            }
  validates :price, presence: true, numericality: { greater_than: 0}
  has_enumeration_for :labname, with: ::Labs::Labname, required: true,
                      create_scopes: true, presence: true
end
