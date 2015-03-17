class Genre < ActiveRecord::Base
  include Slug
  has_many :songs
  has_many :artists, through: :songs


end
