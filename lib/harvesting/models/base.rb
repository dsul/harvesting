require 'pry'
module Harvesting
  module Models
    class Base

      attr_reader :client
      attr_accessor :attributes

      def initialize(attrs, opts = {})
        @attributes = attrs.dup
        @client = opts[:client] || Harvesting::Client.new(opts)
      end

      def self.attributed(*attribute_names)
        attribute_names.each do |attribute_name|
          define_method(attribute_name) do
            @attributes[__method__.to_s]
          end
        end
      end

      def to_hash
        @attributes
      end

    end
  end
end
