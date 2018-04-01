class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_img, :thumb_img

  def self.reactnative
    where(subtitle: "react Native")
  end
end
