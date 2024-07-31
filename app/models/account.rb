class Account < ApplicationRecord
    has_many :courses, dependent: :destroy
end
  