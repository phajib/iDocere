class Resource < ApplicationRecord
    belongs_to :teacher
    belongs_to :parent
    belongs_to :student
end
