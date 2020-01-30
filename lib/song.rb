require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
 
#THE ABOVE IS THE BASE CODE 

  def self.create
    song = self.new
    song.save
    song
  end
 
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    filename = filename.chomp(".mp3")
    filename = filename.split(" - ")
    name = filename[1]
    artist = filename[0]
    new_song = self.new_by_name(name)
    new_song.artist_name = artist
    new_song
    # binding.pry
  end

  def self.create_from_filename(filename)
    filename = filename.chomp(".mp3")
    filename = filename.split(" - ")
    name = filename[1]
    artist = filename[0]
    new_song = self.create_by_name(name)
    new_song.artist_name = artist 
  end

  def self.destroy_all 
    self.all.clear
  end


end




# binding.pry 
# 0