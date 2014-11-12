class TodoReaper
  def self.run
    Todo.where(["created_at <= ?", 8.days.ago]).where(:completed_at => nil).destroy_all
    puts "Todo is complete"
  end
end