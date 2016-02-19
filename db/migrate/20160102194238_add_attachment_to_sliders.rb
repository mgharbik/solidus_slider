class AddAttachmentToSliders < ActiveRecord::Migration
  def change
    add_attachment :spree_slides, :attachment
  end
end
