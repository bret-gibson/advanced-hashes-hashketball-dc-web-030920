require 'pry'

def game_hash
  {:home =>
    {:team_name => "Brooklyn Nets",
     :colors => ["Black", "White"],
     :players =>
     [{ :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      { :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      { :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      { :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      { :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }]
    },

    :away =>
      {:team_name => "Charlotte Hornets",
       :colors => ["Turquoise", "Purple"],
       :players =>
       [{ :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        { :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        { :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
         },
         { :player_name => "Ben Gordon",
           :number => 8,
           :shoe => 15,
           :points => 33,
           :rebounds => 3,
           :assists => 2,
           :steals => 1,
           :blocks => 1,
           :slam_dunks => 0
         },
         { :player_name => "Kemba Walker",
           :number => 33,
           :shoe => 15,
           :points => 6,
           :rebounds => 12,
           :assists => 12,
           :steals => 7,
           :blocks => 5,
           :slam_dunks => 12
         }]
      }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            return data_item[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            return data_item[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  game_hash.map {|location, team| team[:team_name]}
end

def player_numbers(team_name)
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          return data.map{|data_item| data_item[:number]}
        end
      end
    end
  end
end

def player_stats(player_name)
  statsHash = {}
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:player_name] == player_name
            data_item.each do |k,v|
              unless k == :player_name
                statsHash[k] = v
              end
            end
          end
        end
      end
    end
  end
  return statsHash
end

def big_shoe_rebounds
  largest_shoe = 0
  largest_shoe_rebounds = 0
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:shoe] > largest_shoe
            largest_shoe = data_item[:shoe]
            largest_shoe_rebounds = data_item[:rebounds]
          end
        end
      end
    end
  end
  return largest_shoe_rebounds
end

def most_points_scored
  most_points = 0
  player_with_most = ""
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[:points] > most_points
            most_points = data_item[:points]
            player_with_most = data_item[:player_name]
          end
        end
      end
    end
  end
  return player_with_most
end

def winning_team
  #REDUCEEEEE
  scoreArr = []
  game_hash.each do |location, team|
    team.each do |attribute, data|
      score = 0
      if attribute == :players
        data.each do |data_item|
          data_item.each do |k, v|
            if k == :points
              score += data_item[k]
            end
          end
        end
        scoreArr << score
      end
    end
  end
  if scoreArr[0] > scoreArr [1]
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  longest_name_length = 0
  player = ""
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if longest_name_length < data_item[:player_name].split("").length
          nameArr = data_item[:player_name].split("")
          longest_name_length = nameArr.length
          player = data_item[:player_name]
        end
        end
      end
    end
  end
  return player
end

def long_name_steals_a_ton?
  puts player_with_longest_name

end
pp game_hash
