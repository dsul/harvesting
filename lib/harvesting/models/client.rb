module Harvesting
  module Models
    class Client < HarvestRecord
      attributed :id,
                 :name,
                 :is_active,
                 :address,
                 :currency,
                 :created_at,
                 :updated_at
    end
  end
end
