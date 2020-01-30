require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    track = self.new
    track.save
    track
  end

  def self.new_by_name(name)
    track = self.new
    track.name = name
    track
  end

  def self.create_by_name(name)
    track = self.new
    track.name = name
    track.save
    track
  end

  def self.find_by_name(sname)
    self.all.find{|i| i.name == sname}
  end

  def self.find_or_create_by_name(sname)
    if !self.find_by_name(sname)
      self.create_by_name(sname)
    else
      self.find_by_name(sname)
    end
  end

  def self.alphabetical
    namelist = []
    self.all.each do |i|
      namelist << i.name
    end
    namelist.sort!.map do |k|
       find_by_name(k)
    end
  end

  def self.new_from_filename(file)
    fnarry = file.split(" - ")
    fname = fnarry[1].chomp(".mp3")
    fartist = fnarry[0]
    fvar = self.new_by_name(fname)
    fvar.artist_name = fartist
    fvar
  end

  def self.create_from_filename(file)
    fnarry = file.split(" - ")
    fname = fnarry[1].chomp(".mp3")
    fartist = fnarry[0]
    fvar = self.create_by_name(fname)
    fvar.artist_name = fartist
    fvar
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end
# binding.pry
  def save
    self.class.all << self
  end

end
