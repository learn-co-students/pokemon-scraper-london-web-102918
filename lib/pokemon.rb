class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_found = db.execute("SELECT * FROM pokemon WHERE ID=?", id_num).flatten
    Pokemon.new(id: pokemon_found[0], name: pokemon_found[1], type: pokemon_found[2], hp: pokemon_found[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end

end
