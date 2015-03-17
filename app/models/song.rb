class Song < ActiveRecord::Base
  include Slug
  belongs_to :artist
  belongs_to :genre


end
