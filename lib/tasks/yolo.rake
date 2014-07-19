namespace :db do
  desc "YOLO MOFOS"
  task :yolo => [:drop, :create, :migrate] do
    puts "YOLO"
  end
end
