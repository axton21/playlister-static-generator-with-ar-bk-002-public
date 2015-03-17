require 'pry'
require 'fileutils'

class SiteGenerator
  attr_reader :rendered_path

  def initialize(path)
    @rendered_path = path
  end

  def build_index
    erb = ERB.new(File.read("./app/views/index.html.erb"))
    File.open("#{rendered_path}/index.html", 'w') { |file| file.write(erb.result(binding)) }
  end

  def build_artists_index
    erb = ERB.new(File.read("./app/views/artists/index.html.erb"))
    File.open("#{rendered_path}/artists/index.html", 'w'){|file| file.write(erb.result(binding)) }
  end

  def build_artist_page
    erb = ERB.new(File.read("./app/views/artists/show.html.erb"))
    Artist.all.each do |artist|
      @artist = artist
      File.open("#{rendered_path}/artists/#{artist.to_slug}.html", 'w'){|file| file.write(erb.result(binding)) }
    end
  end

  def build_genres_index
    erb = ERB.new(File.read("./app/views/genres/index.html.erb"))
    File.open("#{rendered_path}/genres/index.html", 'w'){|file| file.write(erb.result(binding)) }
  end

  def build_genre_page
    erb = ERB.new(File.read("./app/views/genres/show.html.erb"))
    Genre.all.each do |genre|
      @genre = genre
      File.open("#{rendered_path}/genres/#{genre.to_slug}.html", 'w'){|file| file.write(erb.result(binding)) }
    end
  end


  def build_songs_index
    erb = ERB.new(File.read("./app/views/songs/index.html.erb"))
    File.open("#{rendered_path}/songs/index.html", 'w'){|file| file.write(erb.result(binding)) }
  end

  def build_song_page
    erb = ERB.new(File.read("./app/views/songs/show.html.erb"))
    Song.all.each do |song|
      @song = song
    File.open("#{rendered_path}/songs/#{song.to_slug}.html", 'w'){|file| file.write(erb.result(binding))}
    end
  end
end
