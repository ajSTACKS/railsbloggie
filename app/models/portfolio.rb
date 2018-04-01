class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_img, :thumb_img

  def self.reactnative
    where(subtitle: "react Native")
  end

  after_initialize :set_defaults
  #even tho we dont have new image imput on new, this the default
  def set_defaults
    self.main_img ||= "http://via.placeholder.com/600x200"
    self.thumb_img ||= "http://via.placeholder.com/350x100"
  end
end
