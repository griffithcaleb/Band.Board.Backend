class Post

DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'project_4_development'})


DB.prepare("find_post",
<<-SQL
SELECT posts.*
FROM posts
WHERE posts.id = $1
SQL
)

DB.prepare("create_post",
    <<-SQL
      INSERT INTO posts (content,number_of_likes, author, date_published)
      VALUES ( $1, $2, $3, $4 )
      RETURNING id, content, number_of_likes, author, date_published;
    SQL
  )


DB.prepare("delete_post",
<<-SQL
DELETE FROM posts
WHERE id=$1
RETURNING id;
SQL
)

DB.prepare("update_post",
    <<-SQL
      UPDATE posts
      SET content = $2, number_of_likes = $3, author = $4, date_published =$5
      WHERE id = $1
      RETURNING id, content, number_of_likes, author, date_published;
    SQL
  )




def self.all
  results = DB.exec("SELECT * FROM posts")
  return results.map do |result|
    {
      "id" => result["id"].to_i,
      "content" => result["content"],
      "number_of_likes" => result["number_of_likes"].to_i,
      "author" => result["author"],
      "date_published" => result["date_published"],
    }
  end
 end

def self.find(id)
  result = DB.exec_prepared("find_post",[id]).first
  return result
end

def self.create(opts)
  results = DB.exec_prepared("create_post", [opts["content"],opts["number_of_likes"],
    opts["author"],opts["date_published"]])
    return {
      "id" => results.first["id"].to_i,
      "content" => results.first["content"],
      "number_of_likes" => results.first["number_of_likes"].to_i,
      "author" => results.first["author"],
      "date_published" => results.first["date_published"],
    }
end

def self.delete(id)
  results = DB.exec_prepared("delete_post",[id])
  return  {deleted:true}
end

def self.update(id,opts)
  results = DB.exec_prepared("update_post",[id,opts["content"],opts["number_of_likes"],
    opts["author"],opts["date_published"]])

  return {
      "id" => results.first["id"].to_i,
      "content" => results.first["content"],
      "number_of_likes" => results.first["number_of_likes"].to_i,
      "author" => results.first["author"],
      "date_published" => results.first["date_published"],
    }

end
end
