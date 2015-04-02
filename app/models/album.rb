class Album < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :artist
  validates_presence_of :title, :artist
end
