class Resource < ApplicationRecord
    belongs_to :teacher
    has_many :parents
end
