namespace :routes do
  desc 'Output routes to a file for easy reference.'
  task :print do# => :environment do
    routes   = `rake routes` # Probably a better way to do this...
    filename = File.join Rails.root, 'routes.txt'
    File.write filename, routes
  end # task
end # namespace
