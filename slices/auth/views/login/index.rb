# frozen_string_literal: true

module Auth
  module Views
    module Login
      class Index < Auth::View
        config.template = "login/index"
        expose :rodauth, decorate: false do |roda_request:|
          roda_request.env['rodauth'] || Auth::EmptyRodauth.new
        end
      end
    end
  end
end
