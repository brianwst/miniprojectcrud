namespace :dev do 
	desc "Adding data"
	task :rebuild => ["db:reset", :fake]

	task :fake => :environment do
		15.times do
			@song = Song.create( :name => 
Faker::StarWars.character, :singer => Faker::Name.name, :lyrics => Faker::Lorem.paragraph )
		end
	end	

end
