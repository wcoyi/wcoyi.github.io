CREATE INDEX idx_game_genre ON games(genre);
-- ^ order index, appropriate for any searches by genre, saves resources by only retreiving conditional data 

CREATE INDEX idx_dev_name ON developers(studio_name);

-- ^ another conditional index, for studio_name searches

CREATE INDEX idx_review_game ON reviews(game_id);

-- ^ covering a very common join, specifically used for review ordering and viewing

CREATE INDEX idx_games_dev ON games(dev_id);
-- ^ very useful as the join with the developers table and games through dev_id logically would be one of the most commmon operation


CREATE INDEX idx_gp_platform ON game_platforms(platform_id);
-- ^ figured that in sql, when a unique constraint is implemented, a hidden A, B index is used, where the first column is sorted and the second column is therefore easier to find. if we do the inverse, the B column needs a index, for instance if we have millions of entries and we want to find the A of B, or in this case the games on a platform. SQL will perform a full-table scan, likely crashing. This index is to prevent that.


CREATE INDEX idx_games_price ON games(price);
--  ^ basic sales index for ordering