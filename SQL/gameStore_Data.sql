USE game_store;


INSERT INTO developers (dev_id, studio_name, country, founded_year) values
(1,  'Nintendo','Japan', 1889),
(2,  'Rockstar Games', 'USA', 1998),
(3,  'Naughty Dog','USA', 1984),
(4,  'CD Projekt Red', 'Poland', 1994),
(5,  'FromSoftware', 'Japan', 1986),
(6,  'Insomniac Games', 'USA', 1994),
(7,  'Bethesda Softworks',  'USA', 1986),
(8,  'Valve', 'USA', 1996),
(9,  'Capcom', 'Japan', 1979),
(10, 'Guerrilla Games', 'Netherlands', 2000);




INSERT INTO platforms (platform_id, platform_name, launch_year, company) values
(1,  'Nintendo 64', 1996, 'Nintendo'),
(2,  'PlayStation 4', 2013, 'Sony'),
(3,  'PlayStation 5',2020, 'Sony'),
(4,  'Xbox One', 2013, 'Microsoft'),
(5,  'Xbox Series X', 2020, 'Microsoft'),
(6,  'Nintendo Switch', 2017, 'Nintendo'),
(7,  'PC (Steam)',  2003, 'Valve'),
(8,  'PlayStation 3', 2006, 'Sony'),
(9,  'Xbox 360', 2005, 'Microsoft'),
(10, 'PC (GOG)', 2008, 'CD Projekt');



INSERT INTO games (game_id, game_name, genre, price, release_year, dev_id) values
(1,  'Super Mario 64','Platformer', 59.99, 1996, 1),
(2,  'Red Dead Redemption 2', 'Action', 79.99, 2018, 2),
(3,  'The Last of Us Part II', 'Action', 69.99, 2020, 3),
(4,  'The Witcher 3: Wild Hunt', 'RPG', 49.99, 2015, 4),
(5,  'Elden Ring', 'RPG', 79.99, 2022, 5),
(6,  'Spider-Man: Miles Morales', 'Action', 49.99, 2020, 6),
(7,  'The Elder Scrolls V: Skyrim','RPG', 39.99, 2011, 7),
(8,  'Half-Life: Alyx', 'FPS', 69.99, 2020, 8),
(9,  'Resident Evil Village', 'Horror', 59.99, 2021, 9),
(10, 'Horizon Zero Dawn', 'Action RPG', 39.99, 2017, 10);



INSERT INTO game_platforms (gp_id, game_id, platform_id, release_date) VALUES
(1,  1,  1,  '1996-09-29'),   
(2,  2,  2,  '2018-10-26'),  
(3,  2,  4,  '2018-10-26'),   
(4,  3,  2,  '2020-06-19'),   
(5,  3,  3,  '2020-09-02'),
(6,  4,  7,  '2015-05-19'),   
(7,  5,  2,  '2022-02-25'), 
(8,  6,  3,  '2020-11-12'),  
(9,  7,  7,  '2011-11-11'),  
(10, 10, 2,  '2017-02-28');  




INSERT INTO reviews (review_id, game_id, game_rating, review_text, review_date) VALUES
(1,  1,  10, 'Groundbreaking 3D platformer, one of the most important titles ever', '2024-01-10'),
(2,  2,  10, 'Beautiful and innovative masterpiece with near boundless exploration', '2024-01-15'),
(3,  2,  9,  'Very pretty and solid story-driven iteration of the first title','2024-02-01'),
(4,  3,  9,  'A bold and emotional rollercoaster story game with thrilling combat and a fitting score',  '2024-02-14'),
(5,  4,  10, 'Incredible storyline and second to none world-building, great RPG elements and unique combat mechanics','2024-02-20'),
(6,  5,  10, 'A monumental achievement in open-world design. The Lands Between are filled with endless secrets and brutal, rewarding combat.', '2024-03-05'),
(7,  6,  9,  'A great addition to the franchise, with improved combat and visuals, whilst the hip-hop inspired soundtrack is faithful to the tone of the story','2024-03-10'),
(8,  7,  8,  'Lush and lively title that expands the franchise to household name', '2024-03-18'),
(9,  9,  9,  'It is a phenomenal fusion of the RE4 combat and RE7 first-person horror, and the village hub is extremely rewarding', '2024-04-02'),
(10, 10, 9,  'A stunning sci-fi mystery title with exciting missions and large-scale combat sections','2024-04-20');




