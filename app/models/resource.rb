class Resource < ApplicationRecord
    belongs_to :user
    has_many :parents
end
