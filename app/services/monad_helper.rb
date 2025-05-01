# frozen_string_literal: true
require 'dry/monads'
require 'dry/monads/do'

module Libus
  module Services
    module MonadHelper
      include Dry::Monads[:result, :do]
    end
  end
end
