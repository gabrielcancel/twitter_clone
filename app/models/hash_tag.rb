class HashTag < ApplicationRecord
    has_and_belongs_to_many :tweets
    accepts_nested_attributes_for :tweets
end
