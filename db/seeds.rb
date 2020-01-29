require('pry')
require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()

gryffindor = House.new({
  'name' => 'Gryffindor',
  'logo' => 'https://www.hp-lexicon.org/wp-content/uploads/2015/08/gryffindor-shield-200x0-c-default.jpg'
});

slytherin = House.new({
  'name' => 'Slytherin',
  'logo' => 'https://www.hp-lexicon.org/wp-content/uploads/2015/08/gryffindor-shield-200x0-c-default.jpg'
});

hufflepuff = House.new({
  'name' => 'Hufflepuff',
  'logo' => 'https://www.hp-lexicon.org/wp-content/uploads/2015/08/gryffindor-shield-200x0-c-default.jpg'
});

ravenclaw = House.new({
  'name' => 'Ravenclaw',
  'logo' => 'https://www.hp-lexicon.org/wp-content/uploads/2015/08/shield_rav-200x0-c-default.jpg'
});

gryffindor.save()
slytherin.save()
hufflepuff.save()
ravenclaw.save()


harry = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'age' => 11,
  'house_id' => gryffindor.id
  });

harry.save()
hermione = Student.new({
  'first_name' => 'Hermione',
  'last_name' => 'Granger',
  'age' => 10,
  'house_id' => gryffindor.id
  });

hermione.save()
draco = Student.new({
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'age' => 13,
  'house_id' => slytherin.id
  });

draco.save()

binding.pry
nil
