module Spree
  module Admin
    class SlidesController < ResourceController
      before_action :set_slide_location

      def index
        @slides = @slide_location.slides.order(:position)
      end

      private
        def location_after_save
          if @slide.created_at == @slide.updated_at
            edit_admin_slide_location_slide_path(@slide_location, @slide)
          else
            admin_slide_location_slides_path(@slide_location)
          end
        end

        def set_slide_location
          @slide_location = Spree::SlideLocation.find(params[:slide_location_id])
        end
    end
  end
end
