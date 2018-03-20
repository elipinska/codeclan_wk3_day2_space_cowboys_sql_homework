require('pg')

class Bounty
attr_accessor :name, :species, :bounty_value, :danger_level
attr_reader :id

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @danger_level = options['danger_level']
    @id = options['id']
  end

  def save()
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "INSERT INTO bounties
      (name, species, bounty_value, danger_level)
    VALUES
      ($1, $2, $3, $4);
    "
    values = [@name, @species, @bounty_value, @danger_level]
    db.prepare("save_it", sql)
    db.exec_prepared("save_it", values)
    db.close()
  end

  def Bounty.all()
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "SELECT * FROM bounties ORDER BY name;
    "
    db.prepare("get_all", sql)
    all_bounties = db.exec_prepared("get_all")
    db.close()

    bounties_objects = all_bounties.map {|bounty| Bounty.new(bounty)}

    return bounties_objects

  end

  def update()
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "UPDATE bounties
      SET (name, species, bounty_value, danger_level) =
      ($1, $2, $3, $4)
      WHERE id = $5;
    "
    values = [@name, @species, @bounty_value, @danger_level, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()

  end

  def delete()
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "DELETE FROM bounties
        WHERE id = $1;"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close() 
  end

  def Bounty.delete_all()
    db = PG.connect({dbname: 'bounty_hunters', host: 'localhost'})
    sql = "DELETE FROM bounties;
    "
    db.prepare("delete_all", sql)
    all_bounties = db.exec_prepared("delete_all")
    db.close()
  end


end
