class User

DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'project_4_development'})


DB.prepare("find_users",
<<-SQL
SELECT users.*
FROM users
WHERE users.id = $1
SQL
)

DB.prepare("create_user",
    <<-SQL
      INSERT INTO users (name,email_address, primary_instrument, secondary_instrument, bio, location)
      VALUES ( $1, $2, $3, $4, $5, $6 )
      RETURNING id, name, email_address, primary_instrument, secondary_instrument, bio,location;
    SQL
  )


DB.prepare("delete_user",
<<-SQL
DELETE FROM users
WHERE id=$1
RETURNING id;
SQL
)
DB.prepare("update_user",
    <<-SQL
      UPDATE users
      SET name = $2, email_address = $3, primary_instrument = $4, secondary_instrument = $5, bio = $6, location = $7
      WHERE id = $1
      RETURNING id, name, email_address, primary_instrument, secondary_instrument, bio, location;
    SQL
  )




def self.all
  results = DB.exec("SELECT * FROM users")
  return results.map do |result|
    {
      "id" => result["id"].to_i,
      "name" => result["name"],
      "email_address" => result["email_address"].to_i,
      "primary_instrument" => result["primary_instrument"],
      "secondary_instrument" => result["secondary_instrument"],
      "bio" => result["bio"],
      "location" => result["location"]
    }
  end
 end

def self.find(id)
  result = DB.exec_prepared("find_users",[id]).first
  return result
end

def self.create(opts)
  results = DB.exec_prepared("create_user", [opts["name"],opts["email_address"],
    opts["primary_instrument"],opts["secondary_instrument"],opts["bio"],opts["location"]])
    return {
      "id" => results.first["id"].to_i,
      "name" => results.first["name"],
      "email_address" => results.first["email_address"],
      "primary_instrument" => results.first["primary_instrument"],
      "secondary_instrument" => results.first["secondary_instrument"],
      "bio" => results.first["bio"],
      "location" => results.first["location"]
    }
end

def self.delete(id)
  results = DB.exec_prepared("delete_user",[id])
  return  {deleted:true}
end

def self.update(id,opts)
  results = DB.exec_prepared("update_user",[id,opts["name"],opts["email_address"],
    opts["primary_instrument"],opts["secondary_instrument"],opts["bio"],opts["location"]])

  return {
      "id" => results.first["id"].to_i,
      "name" => results.first["name"],
      "email_address" => results.first["email_address"],
      "primary_instrument" => results.first["primary_instrument"],
      "secondary_instrument" => results.first["date_published"],
      "bio" => results.first["bio"],
      "location" => results.first["location"],
    }

end
end
