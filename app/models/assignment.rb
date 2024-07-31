class Assignment < ApplicationRecord
    belongs_to :course, foreign_key: :context_id
end
