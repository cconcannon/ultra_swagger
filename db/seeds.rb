# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class Seed
  def initialize
    chris_admin_user
    chris_strava_user_total
    chris_races
    chris_items
    chris_reviews
  end
  
  private
  
  def chris_admin_user
    User.create(
      strava_id: 5189780,
      email: "christopher.concannon@gmail.com",
      firstname: "Christopher",
      lastname: "Concannon",
      admin: true
    )
  end
  
  def chris_strava_user_total
    StravaUserTotal.create(
      user: User.find_by(strava_id: 5189780),
      avg_weekly_distance: 49,
      avg_weekly_time: 7.0,
      avg_weekly_elevation_gain: 4458,
      avg_speed: 7.0
    )
  end
  
  def chris_races
    races.values.each do |race|
      Race.create(race)
      puts "#{race["name"]} in #{race["location"]} added to race list!"
    end
  end
  
  def chris_items
    items.each do |item|
      i = Item.create(item)
      puts "#{item.brand} #{item.model} created!"
    end
  end
  
  def chris_reviews
    reviews.each do |review|
      r = Review.create(review)
      puts "Review ##{r.id} created!"
    end
  end
  
  def items
    YAML.load(File.read("db/fixtures/items.yml"))
  end
  
  def races
    YAML.load(File.read("db/fixtures/races.yml"))
  end

  def reviews
    YAML.load(File.read("db/fixtures/reviews.yml"))
  end
  #   [ 
  #     { race: Race.find_by(name: "Angeles Crest 100"),
  #       user: User.find_by(strava_id: 5189780),
  #       item: Item.find_by(model: "Vazee Summit"),
  #       rating: 10,
  #       comments: "Grippy in the wet stuff, yet lightweight and flexible. Supportive enough for 100 miles. My go-to shoe for everything on trail.",
  #       approved: true,
  #       reviewed: true
  #     },
  #     { race: Race.find_by(name: "Angeles Crest 100"),
  #       user: User.find_by(strava_id: 5189780),
  #       item: Item.find_by(model: "Timothy Olson Race Vest 3.0"),
  #       rating: 8,
  #       comments: "Lightweight and breathable, but still somewhat 'bouncy'... I ended up modifying the pack so that the bottles sit higher. Out of the box, it's not as great a fit as their AK vest. Nice size for warm-weather ultras.",
  #       approved: true,
  #       reviewed: true
  #     },
  #     { race: Race.find_by(name: "Leadville Silver Rush 50"),
  #       user: User.find_by(strava_id: 5189780),
  #       item: Item.find_by(model: "Short Tight"),
  #       rating: 10,
  #       comments: "These are my go-to for all runs longer than a few hours. They're a little warm for hot weather running, but otherwise perfect. The built-in liner is a great feature.",
  #       approved: true,
  #       reviewed: true
  #     },
  #     { race: Race.find_by(name: "Silverton Double Dirty 30"),
  #       user: User.find_by(strava_id: 5189780),
  #       item: Item.find_by(model: "Houdini"),
  #       rating: 10,
  #       comments: "Greatest lightweight shell, ever! Not waterproof, but it does the job as an emergency layer (or extremely lightweight wind blocker).",
  #       approved: false,
  #       reviewed: false
  #     },
  #     { race: Race.find_by(name: "Leadville Silver Rush 50"),
  #       user: User.find_by(strava_id: 5189780),
  #       item: Item.find_by(model: "Short Tight"),
  #       rating: 10,
  #       comments: "blah blah blah didn't finish",
  #       approved: false,
  #       reviewed: true,
  #       admin_comments: "Duplicate Review"
  #     } 
  #   ]
  # end
end

Seed.new