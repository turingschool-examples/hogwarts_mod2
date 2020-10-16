class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort_alpha
    order(:name)
  end
end
