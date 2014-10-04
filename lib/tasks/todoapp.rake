desc "Deletes tasks older than 7 days"
task auto_delete_tasks: :environment do
  Task.delete_tasks
end