class Gossip
  attr_accessor :author, :content, :comment

  def initialize(author, content, comment="Pas de commentaire")
    @author = author
    @content = content
    @comment = []                                               #* INITIALIZE THE NEW GOSSIP
    @comment << comment
  end
  def save
      CSV.open("./db/gossip.csv", "ab") do |csv|
        csv << [@author," #{@content}"]                       #* SAVE IN THE CSV
    end
  end

  def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])     #* CREATE A ARRAY WITH ALL GOSSIP
    end
    return all_gossips
  end

  def self.find(id)
   return Gossip.all[id.to_i - 1]             #* IF YOU NEED TO FIND ONE GOSSIP PARTICULARY, USE THIS METHOD
  end


  def self.update(new_author, new_content, id)
    update_gossip = []
    CSV.read("./db/gossip.csv").each_with_index do |row, index|
      if id.to_i - 1 == index
        update_gossip << [row[0], "#{new_content}, updated by #{new_author}", row[2]]     #* CAN UPDATE A GOSSIP, KEEP THE AUTHOR AND ADD AN ' updated by ...'
      else
        update_gossip << [row[0],row[1], row[2]]
      end
    end

    CSV.open("./db/gossip.csv", "w") do |csv|
      update_gossip.each do |caca|                                                #* AFTER THE UPDATE IN AN ARRAY, REINJECT ARRAY IN CSV
      csv << caca
      end
    end
    end
end