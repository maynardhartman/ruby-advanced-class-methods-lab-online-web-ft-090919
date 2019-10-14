class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end

  def self.save
    @@all << self
  end

  def self.create
    song = self.new
    @@all << song
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
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find { |x| x.name == name }
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil 
      # create song
      self.create_by_name(name)
    else
      return song
    end
  end  
  
  def self.alphabetical
    array = @@all.sort_by { |song| song.name }
    array
  end
 
  def self.new_from_filename(filename) 
    
  end
  
  def self.destroy_all
    @@all.clear
  end
end

song = Song.new
song.name = "Blank Space"
song.artist_name = "Taylor Swift"
puts "#{song}"