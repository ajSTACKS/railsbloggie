class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                               reject_if: lambda { |attrs| attrs['name'].blank?}

  include  Placeholder
  validates_presence_of :title, :body, :main_img, :thumb_img

  def self.reactnative
    where(subtitle: "react Native")
  end

  after_initialize :set_defaults
  #even tho we dont have new image imput on new, this the default
  def set_defaults
    self.main_img ||= Placeholder.image_generator(height:'600', width: '200')
    self.thumb_img ||= Placeholder.image_generator(height:'350', width: '100')
  end
end
