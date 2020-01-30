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

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.split_filename(filename)
    split_filename = filename.split(" - ")
    split_filename[1].slice!(".mp3")
    split_filename
  end

  def self.new_from_filename(filename)
    split_filename = split_filename(filename)
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = split_filename(filename)
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    @@all << song
    song
  end

    def self.destroy_all
      @@all.clear
    end
end
