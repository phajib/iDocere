class Resource < ApplicationRecord
    belongs_to :user
    has_many :messages
    # has_many :parents
    
    searchkick

    scope :the_resource, -> { where(resource_id: @resource.id) }
    scope :last_weeks_resources, -> { where(created_at: 7.days.ago..Date.today) }

    has_rich_text :assignment

    Resource.reindex # or reindex_async
end
