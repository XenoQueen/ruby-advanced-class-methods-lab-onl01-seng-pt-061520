class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def Song.create
    song = Song.new
    song.save
    song
  end
  
  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def Song.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def Song.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def song.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def song.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def song.new_from_filename(filename)
    artist_and_song = filename.split(".").first
    artist_and_song = artist_and_song.split(" - ")
    artist = artist_and_song[0]
    song = artist_and_song[1]
    new_song = Song.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end
  
  def song.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def song.destroy_all
    @@all = []
  end
end
