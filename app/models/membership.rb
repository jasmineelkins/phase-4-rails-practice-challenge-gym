class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client_id, :gym_id, :charge, presence: true

  # a client can only have one membership with gym:
  validates :client_id, uniqueness: { scope: :gym_id }
end
