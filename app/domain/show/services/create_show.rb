# frozen_string_literal: true

module Show
  module Services
    class CreateShow
      def self.call(catalog_id, ticket_price, show_time)
        Show.create_show(catalog_id, ticket_price, show_time)
      end
    end
  end
end
