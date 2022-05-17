class Discussion < ApplicationRecord
    belongs_to :user, default: -> { Current.user }
    has_many :posts, dependent: :destroy

    validates :name, presence: true

    after_create_commit -> { broadcast_append_to "discussions" }
    after_update_commit -> { broadcast_replace_to "discussions" }
    after_destroy_commit -> { broadcast_remove_to "discussions" }

    accepts_nested_attributes_for :posts

    def to_param
        "#{id}-#{name.downcase.to_s[0..20]}".parameterize
    end
end
