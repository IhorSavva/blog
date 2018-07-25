class Session < ApplicationRecord
  has_secure_token :access_token
  has_secure_token :refresh_token

  TIMEOUT = 1.days

  belongs_to :user

  scope :not_expired, -> { where('expires_on > ?', Time.current) }

  before_create :create_tokens

  validates_presence_of :user


  def create_tokens
    self.access_token = SecureRandom.uuid
    self.refresh_token = SecureRandom.uuid
    self.access_token_redeem = false
    self.refresh_token_redeemed = false
    self.expires_on = Time.zone.now + TIMEOUT
  end
end
