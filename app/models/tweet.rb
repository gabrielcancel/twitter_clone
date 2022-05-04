class Tweet < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :hash_tags
  accepts_nested_attributes_for :hash_tags
end
