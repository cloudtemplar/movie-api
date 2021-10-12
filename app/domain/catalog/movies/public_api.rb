module Catalog
  module Movies
    module PublicApi
      def catalog
        Repository.all
      end
    end
  end
end
