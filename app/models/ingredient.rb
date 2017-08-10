class Ingredient < ApplicationRecord
  has_many :doses
  before_destroy :check_for_doses

  validates :name, presence: true, uniqueness: true

  private

  def check_for_doses
    if doses.count > 0
      # errors.add_to_base("cannot delete ingredient used in cocktail")
      raise ActiveRecord::InvalidForeignKey, "Cannot delete ingredient if used in cocktail"
      return false
    end
  end
end
