namespace :tournaments do 

  desc 'populate tournaments'
  task :populate_tournaments => :environemnt do
    tournaments = Sportsdata.golf.tournament_schedule
  end

end











#<Sportsdata::Golf::Event 

# event_id="8d463c8b-e259-482d-8729-3c9efa877a22", 
# event_name="Frys.com Open", 
# event_type="stroke", 
# event_purse=nil, 
# event_start_date="2013-10-10", 
# event_end_date="2013-10-13", 
# venue_name="CordeValle Golf Club", 
# city="San Martin", state="California", 
# country="USA", 

# course_info={"description"=>nil, "holes"=>{"hole"=>[{"number"=>"1", "par"=>"4", "yardage"=>"422"}, {"number"=>"2", "par"=>"4", "yardage"=>"434"}, {"number"=>"3", "par"=>"3", "yardage"=>"230"}, {"number"=>"4", "par"=>"4", "yardage"=>"418"}, {"number"=>"5", "par"=>"4", "yardage"=>"454"}, {"number"=>"6", "par"=>"4", "yardage"=>"480"}, {"number"=>"7", "par"=>"3", "yardage"=>"166"}, {"number"=>"8", "par"=>"4", "yardage"=>"478"}, {"number"=>"9", "par"=>"5", "yardage"=>"555"}, {"number"=>"10", "par"=>"4", "yardage"=>"425"}, {"number"=>"11", "par"=>"3", "yardage"=>"236"}, {"number"=>"12", "par"=>"5", "yardage"=>"605"}, {"number"=>"13", "par"=>"4", "yardage"=>"407"}, {"number"=>"14", "par"=>"4", "yardage"=>"497"}, {"number"=>"15", "par"=>"5", "yardage"=>"568"}, {"number"=>"16", "par"=>"3", "yardage"=>"210"}, {"number"=>"17", "par"=>"4", "yardage"=>"358"}, {"number"=>"18", "par"=>"4", "yardage"=>"425"}]}, "id"=>"68ffd2ac-802c-40e5-92bb-4bc8eede5158", "name"=>"CordeValle", "yardage"=>"7368", "par"=>"71"}>