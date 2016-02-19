module Spree
  class SlideLocation < ActiveRecord::Base
    has_many :slides
    validates :name, :presence => true
    validates :width, :presence => true
    validates :height, :presence => true

    def initialize(attrs = nil)
      attrs ||= {
        :name => 'home',
        :width => 800,
        :height => 500
      }
      super
    end
  end
end
