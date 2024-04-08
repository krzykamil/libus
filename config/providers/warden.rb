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

    Warden::Manager.serialize_into_session{|user| user.id }
    Warden::Manager.serialize_from_session{|id| Main::Repositories::Users.by_id(id) }
  end
end
