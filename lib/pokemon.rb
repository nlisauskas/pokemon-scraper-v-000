class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, hp:, db:)
    @id = id
    @name = name
    @type = type
    @hp =  60
    @db = db
    @@all << self
  end

  def self.save(name, hp, type, database_connection)
    pokemon = database_connection.execute("INSERT INTO pokemon (name, hp, type) VALUES (?, ?, ?)", name, hp, type)
    @@all << pokemon
  end

  def self.find(id, db)
    @@all.detect do |pokemon|
      pokemon.id = id
    end
  end

end
