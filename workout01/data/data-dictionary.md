# Data Dictionary Workout01

### This dictionary will provide names and brief descriptions of the data found in this folder.

* **team_name**
    + Name of team that player is on.
    + Given as character
    
* **game_date**
    + Date game was played; date observations were made.
    + Given as character
    
* **season**
    + Year observations took place in.
    + Given as double.
    
* **period**
    + One of four equally divided periods of the game: each period is 12 minutes long.
    + Given as integer.
    + Units given as minutes.
    
* **minutes_remaining**
    + Number of minutes remaining in the given period.
    + Given as integer.
    + Units given as minutes.
    
* **seconds_remaining**
    + Number of seconds remaining in the given period.
    + Given as integer.
    + Units given as seconds.
    
* **shot_made_flag**
    + Describes whether or not a shot attempt was successful. 'y' is success, 'n' is a failure.
    + Given as factor.
        + levels: y, n.
    
* **action_type**
    + Strategy used by player to get in position to shoot a basket.
    + Given as factor. 
        + levels: Alley Oop Dunk Shot, Cutting Dunk Shot, Cutting Finger Roll Layup Shot, Cutting Layup Shot, Driving Dunk Shot, Driving Finger Roll Layup Shot, Driving Floating Bank Jump Shot, Driving Layup Shot, Driving Reverse Dunk Shot, Dunk Shot...

* **shot_type**
    + Whether shot was worth 2 points or 3 points
    + Given as factor.
        + Levels: 2 Point Field Goal, 3-Point Field Goal.
    
* **shot_distance**
    + Distance to basket when shot was made.
    + Given as integer.
    + Units given in feet.
    
* **opponent**
    + Team player was playing against when observation was made.
    + Given as character.
    
* **x**
    + X value for court coordinates where shot was made.
    + Given as integer.
    + Units given as inches.
    
* **y**
    + Y value for court coordinates where shot was made.
    + Given as integer.
    + Units given as inches.
    
    

