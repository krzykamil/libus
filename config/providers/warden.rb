# frozen_string_literal: true
Hanami.app.register_provider(:warden) do
  prepare do
    require "bcrypt"
    require "warden"
  end

  start do
    target.start(:persistence)
    Warden::Strategies.add(:password) do
      def valid?
        params['email'] || params['password']
      end

      def authenticate!
        user_repo = Libus::Repositories::Users.new(Hanami.app["persistence.rom"])
        user = user_repo.by_email(params["email"])
        return success!(user) if user && user.password_hash == BCrypt::Engine.hash_secret(request.params["password"], user.password_salt)
        fail!("Could not log in")
      end
    end

    Warden::Manager.serialize_into_session{|user| user.id }
    Warden::Manager.serialize_from_session{|id| Libus::Repositories::Users.new(Hanami.app["persistence.rom"]).by_id(id) }
  end
end
