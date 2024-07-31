class Course < ApplicationRecord
    belongs_to :account, foreign_key: :account_id
    has_many :assignments, dependent: :destroy, foreign_key: :context_id
end
  