class Artist < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :albums
end
