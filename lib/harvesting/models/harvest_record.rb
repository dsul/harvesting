module Harvesting
  module Models
    class HarvestRecord < Base

      def initialize(attrs, opts = {})
        super(attrs, opts)
        @models = {}
      end

      def self.modeled(opts = {})
        opts.each do |attribute_name, model_name|
          attribute_name_string = attribute_name.to_s
          define_method(attribute_name_string) do
            @models[attribute_name_string] ||= model_name.new(@attributes[attribute_name_string] || {}, client: @client)
          end
        end
      end

      def save
        id.nil? ? create : update
      end

      def create
        @client.create(self)
      end

      def update
        @client.update(self)
      end
    end
  end
end
