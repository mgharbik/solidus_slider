module Spree
  class Slide < ActiveRecord::Base
    acts_as_list scope: :slide_location_id

    belongs_to :slide_location
    belongs_to :product, touch: true
    has_attached_file :attachment,
                      styles: { medium: '240x240>', cropped: '600x600>' },
                      default_style: :cropped,
                      default_url: 'noimage/:style.png',
                      url: '/spree/slides/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/slides/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

    validates_attachment :attachment,
                         :presence => true,
                         :content_type => { content_type: %w(image/jpg image/jpeg image/png image/gif) }

    validates :slide_location, presence: true
    validate :no_attachment_errors

    scope :published, -> { where(published: true).order('position ASC') }
    scope :location, -> (location) { joins(:slide_locations).where('spree_slide_locations.name = ?', location) }

    def initialize(attrs = nil)
      attrs ||= {:published => true}
      super
    end

    def slide_name
      name.blank? && product.present? ? product.name : name
    end

    def slide_link
      link_url.blank? && product.present? ? product : link_url
    end

    def slide_photo
      !attachment && product.present? && product.images.any? ? product.images.first.attachment : attachment
    end


    private

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
  end
end