class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
  end

  def self.new_by_name(name)
    song = Song.new
    song.name= name
    song
  end

  def self.create_by_name(name)
    song = Song.new_by_name(name)
    song.save
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.find { |song|
      song.name == name
    }
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    song = Song.create_by_name(filename[1].delete_suffix('.mp3'))
    song.artist_name= filename[0]
    song
  end

  def self.create_from_filename(filename)
    filename = filename.split(" - ")
    song = Song.create_by_name(filename[1].delete_suffix('.mp3'))
    song.artist_name= filename[0]
    song
  end

  def self.find_or_create_by_name(name)
    mysong = Song.find_by_name(name)
    if mysong
      mysong
    else
      Song.create_by_name(name)
    end
  end

  def save
    self.class.all << self
    self
  end

  def self.alphabetical
    @@all.sort {|a, b| 
      a.name <=> b.name 
    }

  end

  def self.destroy_all
    @@all = []
  end


end
