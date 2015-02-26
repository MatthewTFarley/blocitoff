namespace :task do
  desc "Delete tasks older than seven days"
  task delete_tasks: :environment do
    tasks_to_delete = Task.where("created_at <= ?", Time.now - 7.days)
    
    puts "Preparing to delete the following tasks: "
    tasks_to_delete.each { |t| puts "'#{t.description}'\n" }
    
    if tasks_to_delete.destroy_all
      puts "These tasks have been deleted!"
    else
      puts "There was a problem deleting these tasks!"
    end
  end
end
