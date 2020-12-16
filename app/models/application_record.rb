class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sort_alphabetically_by_name
    all.order(name: :asc)
  end
end
