class Comment
  attr_accessor :comment, :id

  def initialize(id, comment)                       #* INITIALIZE A NEW COMMENT
    @id = id
    @comment = comment
  end

  def save
    CSV.open("./db/comment.csv", "a") do |csv|  #*SAVE IT IN A CSV
      csv << [@id, @comment]
    end
  end

  def self.all
    all_gossip_comment = []
    CSV.read("./db/comment.csv").each do |row|        #* CREATE AN ARRAY WITH ALL COMMENT
      all_gossip_comment << Comment.new(row[0], row[1])
    end
    return all_gossip_comment
  end

  def self.all_with_id (id) 
		return self.all.select {|comment| comment.id.to_i == id}    #* ALL COMMENT HAVE THE SAME ID OF A GOSSIP
	end

end