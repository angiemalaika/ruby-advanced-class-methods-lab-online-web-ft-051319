class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
  s = Song.new
  s.save
  s
  end 
  
  def self.new_by_name(song_name)
  song = self.new 
  song.name = song_name 
  song 
  end 
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name
    song 
    
  end 
  
  def self.find_by_name(song_name) 
    # self.all.detect {|s| s.name == song_name}
    Song.all.find { |song| song.name == song_name }
  end 
  

  def self.find_or_create_by_name(song_name)
    # Song.find_by_name(name).nil? ? Song.create_by_name(name) : Song.find_by_name(name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def self.alphabetical
    # self.all.sort_by{|s| s.name}
    all.sort_by(&:name)
  end
  
  def self.new_from_filename(filename)
    filename.slice!('.mp3')
    file = filename.split(' - ')
    Song.new(file[1])
  end
  
  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
