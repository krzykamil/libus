# frozen_string_literal: true

Hanami.app.register_provider(:warden) do
  prepare do
    require "warden"
  end

  start do
    Warden::Strategies.add(:password) do
      def valid?
        params['username'] || params['password']
      end

      def authenticate!
        u = User.authenticate(params['username'], params['password'])
        u.nil? ? fail!("Could not log in") : success!(u)
      end
    end

    Warden::Manager.serialize_from_session do |id|
      User.get(id)
    end
  end
end
