
module Concerns::Findable

  def find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  #helper method 
  def sorted
    all.sort {|a,b| a.name <=> b.name}
  end

end