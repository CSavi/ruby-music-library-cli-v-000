require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre
  @@all = []  #Class Variable

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all  #Class Reader
    @@all
  end

  def self.destroy_all #Class Helper
    @@all.clear
  end

  def save
    @@all << self
  end

  #Custom Constructor
  def self.create(new_artist)
    n = Artist.new(new_artist)
    n.save
    n
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end
  # OR
  # def add_song(song)
  #   song.artist = self unless song.artist == self
  #   @songs << song unless @song.include?(song)
  # end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

end
