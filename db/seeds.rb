heroes = ActiveSupport::JSON.decode(File.read('db/seeds/heroes.json'))
heroes.each do |hero|
  universe = Universe.find_or_create_by(name: hero['universe'])
  hero = Hero.create(real_name: hero['real_name'], name: hero['name'], universe_id: universe.id, species: hero['species'])
end

