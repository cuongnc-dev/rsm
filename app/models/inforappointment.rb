class Inforappointment < ApplicationRecord
  belongs_to :user
  belongs_to :appointment
  attr_accessor :activation_token


  def create_activation_digest
    self.activation_token  = Inforappointment.new_token
    self.activation_digest = Inforappointment.digest(activation_token)
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
