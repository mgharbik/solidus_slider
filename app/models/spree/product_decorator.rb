Spree::Product.class_eval do
  has_one :slide, :dependent => :destroy
  after_update :destroy_slide_if_deleted

  private
    def destroy_slide_if_deleted
      slide.update_attributes(:published => false) if slide && deleted_at
    end
end
