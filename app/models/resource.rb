class Resource < ApplicationRecord
    belongs_to :user
    has_many :messages
    # has_many :parents
    searchkick

    Resource.reindex # or reindex_async
end
