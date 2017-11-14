require 'jwt'

class JWToken

  SECRET_KEY_BASE = Rails.application.secrets.secret_key_base
  
  class << self

    def encode(payload, exp = 7.days.from_now.to_i)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY_BASE)
    end

    def decode(token)
      JWT.decode(token, SECRET_KEY_BASE)
    end

    def valid_load(payload)
      if expired(payload)
        return false
      else
        return true
      end
    end

    def expired(payload)
      Time.at(payload['exp']) < Time.now
    end

  end

end

