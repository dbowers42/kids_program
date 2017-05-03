require './story'

Story.new.build do
  LITTLE_GOAT = 'Little Billy Goat Gruff'
  MIDDLE_GOAT = 'Middle Billy Goat Gruff'
  BIG_GOAT = 'Great Big Billy Goat Gruff'

  character :narrator => :allison
  character :little_goat => :oliver
  character :middle_goat => :fred
  character :big_goat => :tom
  character :troll => :ralph

  template :trip_trap do
    narrator "Triptrap triptrap, he went over the wooden bridge."
  end

  template :troll_shout do
    troll "Who is that trip-trapping over my bridge?"
    narrator "shouted the ugly troll."
  end

  template :troll_climb do
    troll "No, you are not!"
    narrator "growled the troll."
    troll "I am going to eat you first"
    narrator "And he climbed up onto the bridge"
  end

  template :frightened_goat do |t|
    narrator "#{t.goat}} was very frightened,"
  end

  template :eat_grass do |t|
    self.send(t.voice, "It is I #{t.goat}")
    narrator "Replied the goat"
    self.send(t.voice, "I am going over to the meadow to eat the green grass")
  end

  page do
    narrator do
      "Once upon a time, there were three billy goats
      who lived on a hillside near a river. Their names
      were #{LITTLE_GOAT}, #{MIDDLE_GOAT},
      and #{BIG_GOAT}. They ate the grass
      on the hillside and grew fatter and fatter."
    end
  end

  narrator do
    "One day, the three billy goats looked around and saw that
     They had eaten all the grass on the hillside!"
  end

  big_goat do
    "There is plenty of yummy green grass over there,"
  end

  narrator do
    "said #{BIG_GOAT}, looking at a meadow
     on the other side of the river"
  end
  #
  big_goat do
    pronounce "content" => "cun tint"

    "All we have to do is cross the wood bridge, and we can eat to
     our hearts content!"
  end

  narrator do
    "But the bridge was guarded by a horrible, ugly troll. He was
    green with a great big head and a bright red nose. There were
    warts on his skin and hairs on his chin, and his terrible teeth
    were yellow. And he was very smelly!"
  end

  big_goat do
    "Which one of will be brave enough to cross the bridge"
  end

  narrator do
    "#{BIG_GOAT} asked his brothers. Little Billy Goat Gruff piped up,"
  end

  little_goat do
    "I will cross the bridge!"
  end

  narrator do
    "And off he went, down the hillside."
  end

  trip_trap

  troll_shout

  eat_grass voice: :little_goat, goat: LITTLE_GOAT

  troll_climb

  frightened_goat LITTLE_GOAT

  narrator "But he knew what to say"

  little_goat do
    "I would not make a very good meal. Can you see how little I am?
     You should wait for my brother #{MIDDLE_GOAT}. He is much bigger and
     fatter than me!"
  end

  narrator "The greedy troll thought about it."

  troll "All right,"

  narrator "He said."

  narrator do
    "So #{LITTLE_GOAT} went trip trap, trip trap across the wood bridge and
     skipped into the meadow."
  end

  narrator do
    "When he saw that #{LITTLE_GOAT} was safe #{BIG_GOAT} said to
    his younger brother,"
  end

  big_goat "It is your turn now."

  narrator "So #{MIDDLE_GOAT} trotted down the hillside."

  trip_trap

  troll_shout

  eat_grass voice: :middle_goat, goat: MIDDLE_GOAT

  troll_climb

  frightened_goat MIDDLE_GOAT

  narrator "But he did not let the troll see that"

  middle_goat do
    "You should wait for my brother, #{BIG_GOAT}"
  end

  narrator "He said"

  middle_goat do
    "He is the biggest and fattest of us all,
    and he would make much tastier meal for you"
  end

  troll "All right,"

  narrator "said the troll"

  narrator do
    "So #{MIDDLE_GOAT} trip trap, trip trap over
     the wooden bridge to join his brother
     in the meado on the other side."
  end

  narrator do
    "At last, it was #{BIG_GOAT} turn to cross the bridge. Trip trap, trip trap
     went his hooves on the wooden bridge"
  end
end
