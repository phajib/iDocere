class Resource < ApplicationRecord
    belongs_to :user
    has_many :messages
    # has_many :parents
    searchkick

    has_rich_text :assignment

    Resource.reindex # or reindex_async
end
