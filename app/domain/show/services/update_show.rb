# frozen_string_literal: true

module Show
  module Services
    class UpdateShow
      def self.call(show_id:, ticket_price:, show_time:)
        Show.update_show(show_id, ticket_price, show_time)
      end
    end
  end
end
