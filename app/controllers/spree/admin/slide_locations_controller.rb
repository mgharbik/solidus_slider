module Spree
  module Admin
    class SlideLocationsController < ResourceController

      def index
        @slide_locations = Spree::SlideLocation.order(:name)
      end

    end
  end
end
