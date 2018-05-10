class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                               allow_destroy: true,
                               reject_if: lambda { |attrs| attrs['name'].blank?}


  validates_presence_of :title, :body

  mount_uploader :thumb_img, PortfolioUploader
  mount_uploader :main_img, PortfolioUploader

  def self.reactnative
    where(subtitle: "react Native")
  end

  def self.by_position
    order("position ASC")
  end


 scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails') }


end
