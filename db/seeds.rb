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
    chris_shoe_reviews
    chris_outerwear_reviews
    chris_hydration_pack_reviews
  end
  
  private
  
  def chris_admin_user
  end
  
  def chris_shoe_reviews
    shoes.values.each do |shoe|
      Shoe.create(shoe)
      puts "#{shoe["brand"]} #{shoe["model"]} created!"
    end
  end
    # Shoe.create({
    #   brand: New Balance,
    #   model: Vazee Summit,
    #   sex: M,
    #   avg_rating: 10,
    #   type: Shoe,
    #   image_path: http://s7d5.scene7.com/is/image/NB/mtsumbg_nb_14_i?$dw_temp_default_gallery$
    #   comments: "This is a great lightweight shoe with grippy rubber and a relatively pliable sole. I used it during the Leadville Silver Rush 50, Angeles Crest 100, and Silverton Double Dirty 30 all without ever changing my shoes. It's my go-to for all trail running."
    # })
  
  def chris_outerwear_reviews
  end
  
  def chris_hydration_pack_reviews
  end
  
  def shoes
    YAML.load(File.read("spec/fixtures/shoes.yml"))
  end
end

Seed.new