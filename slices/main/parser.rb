# auto_register: false
# frozen_string_literal: true

require 'dry-struct'
require 'dry-types'

module Main
  class Parser

    attr_accessor :json, :output

    def initialize
      @json = nil
      @output = {}
    end
  end
end
