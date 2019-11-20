class Message < ApplicationRecord
    belongs_to :user
    belongs_to :resource

    searchkick

    has_rich_text :description

    # Message.reindex
end
