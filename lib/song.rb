
class Song
  attr_accessor :name, :artist_name

  @@all = []

  def initialize(name = nil, artist_name = nil)
    @name = name 
    @artist_name = artist_name
  end  

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song 
    song
  end 

  def self.new_by_name(name)
    Song.new(name)
  end 

  def self.create_by_name(name, artist = nil)
    song = Song.new(name)
    @@all << song
    song
  end  

  def self.find_by_name(name)
    Song.all.find { |song| song.name == name }
  end 

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end  

  def self.alphabetical
    Song.all.sort_by { |song| song.name }
  end  

  def self.new_from_filename(file)
    artist, song, ext = file.split(/[-.]/)
    Song.new(song.strip, artist.strip)
  end  

  def self.create_from_filename(file)
    artist, title, ext = file.split(/[-.]/)
    song = Song.new(title.strip, artist.strip)
    @@all << song
    song
  end 

  def self.destroy_all
    @@all.clear
  end  

end

