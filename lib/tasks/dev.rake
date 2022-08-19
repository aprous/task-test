desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do

user = User.new
user.email = "ant@example.com"
user.password =  "password"
user.save



p "#{User.count} users are in the database."

20.times do 
 task = Task.new
 task.body = Faker::TvShows::GameOfThrones.quote
 task.status = ["in_progress", "completed"].sample
 task.user_id = user.id
 task.save 
end 

p "#{Task.count} tasks are in the database."

end
