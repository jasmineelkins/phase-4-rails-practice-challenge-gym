class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client_id, :gym_id, :charge, presence: true
  #   validates :client_id, uniqueness: true

  # a client can only have one membership with gym
end
