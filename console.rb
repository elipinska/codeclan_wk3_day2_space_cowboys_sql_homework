require('pry')
require_relative('models/bounty.rb')

options_hash1 = {'name'=> 'C5P4', 'species'=> 'android', 'bounty_value'=> 4500, 'danger_level'=>'medium'}

options_hash2 = {'name'=> 'Jack Dolan', 'species'=> 'human', 'bounty_value'=> 30000, 'danger_level'=>'ermagerdyerderd'}

options_hash3 = {'name'=> 'Vak Irruct', 'species'=> 'klingon', 'bounty_value'=> 10000, 'danger_level'=>'high'}

Bounty.delete_all

bounty1 = Bounty.new(options_hash1)
bounty2 = Bounty.new(options_hash2)
bounty3 = Bounty.new(options_hash3)

bounty1.save()
bounty2.save()
bounty3.save()

p Bounty.all()
puts ""
bounties = Bounty.all()
first_bounty_object = bounties.first
first_bounty_object.bounty_value = 5000
first_bounty_object.update()
p Bounty.all()
puts ""
first_bounty_object.delete()
p Bounty.all()
