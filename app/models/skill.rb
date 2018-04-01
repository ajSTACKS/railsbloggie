class Skill < ApplicationRecord
  include  Placeholder
  validates_presence_of :title, :percent_utilized


  after_initialize :set_defaults
  #even tho we dont have new image imput on new, this the default
  def set_defaults
    self.badge ||= Placeholder.image_generator(height: '250', width: '200')
  end
end
