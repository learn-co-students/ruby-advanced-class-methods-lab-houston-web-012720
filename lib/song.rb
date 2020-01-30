class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil,artist_name = nil)
    @name = name 
    @artist_name = artist_name
    @@all << self
  end

  def self.create
    self.new
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new(name)
  end

  def self.find_by_name(name)
    @@all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    if !!(self.find_by_name(name))
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|e| e.name}
  end

  def self.new_from_filename(file)
    fileArr = file.split(/\-|\.mp3/)
    artist_name = fileArr[0].strip
    song_name = fileArr[1].strip
    self.new(song_name,artist_name)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

# class Song 
#   attr_accessor :name, :artist_name
#   @@all = []
#   def initialize(name)
#     @name = name 
#     @@all << self
#   end
#   def self.create 
#     newsong = self.new()
#   end
#   def self.newName(name)
#     song = self.new(name)
#   end
#   def self.all
#     @@all
#   end
# end
