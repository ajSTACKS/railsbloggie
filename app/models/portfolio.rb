class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_img, :thumb_img
end
