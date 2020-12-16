class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort_alphabetically
    order(name: :asc)
  end
end
