class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.name_sort
    self.all.order(:name)
  end
end
