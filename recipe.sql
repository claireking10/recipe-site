CREATE DATABASE IF NOT EXISTS recipes_db;
USE recipes_db;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE recipe_ingredients;
TRUNCATE TABLE recipes;
TRUNCATE TABLE ingredients;
SET FOREIGN_KEY_CHECKS = 1;

SET @@auto_increment_increment=1;

CREATE TABLE IF NOT EXISTS ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    info TEXT
);

CREATE TABLE IF NOT EXISTS recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    protein_type VARCHAR(100),
    instructions TEXT
);

CREATE TABLE IF NOT EXISTS recipe_ingredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ingredients (name, info) VALUES
('Lemon juice','Lemons were first cultivated in India over 2500 years ago; the juice can also help tenderize meat.'),
('Garlic','Ancient Egyptians used garlic for strength; crushing garlic releases allicin, which adds both flavor and potential health benefits.'),
('Olive oil','Extra virgin olive oil is rich in antioxidants and was prized by ancient Greeks for both cooking and skin care.'),
('Honey','Honey never spoils if stored properly; archaeologists found edible honey in 3000-year-old Egyptian tombs.'),
('Dijon mustard','Originated in Dijon, France, in the 1850s; the seeds are soaked in vinegar and wine for a smooth, tangy flavor.'),
('Salt','Salt was once so valuable it was used as currency; it''s also key to enhancing flavors and preserving food.'),
('Pepper','Black pepper was once called "black gold" and traded along ancient spice routes; it can help unlock other flavors in dishes.'),
('Paprika','Made from ground sweet or hot peppers; it originated in Central America but became a staple in Hungarian cuisine.'),
('Chili flakes','Dried crushed chili peppers were first used by the Aztecs; they add heat and a rich red color.'),
('Soy sauce','Soy sauce originated in China over 2500 years ago; a little goes a long way in flavoring dishes.'),
('Fresh ginger','Ginger has been used medicinally for over 2000 years in Asia; it also helps with digestion.'),
('Green onions','Also called scallions, they''re milder than regular onions and are eaten both raw and cooked worldwide.'),
('Butter','Used since the Bronze Age; clarifying butter removes water and milk solids, making it ideal for high-heat cooking.'),
('Mushrooms','Fungi were considered delicacies in ancient Rome; they are rich in umami flavor and vitamin D when exposed to sunlight.'),
('Onion','Onions have been cultivated for over 5000 years; chopping them releases sulfur compounds that make your eyes water.'),
('Lime juice','Limes were used by British sailors to prevent scurvy; their acidity brightens flavors in cooking.'),
('Chili powder','A blend of ground chili peppers and spices, often including cumin; it was popularized in the US in the 19th century.'),
('Cornstarch','Derived from corn kernels, it''s a common thickener for sauces and soups, and can also be used to get a crispy coating on proteins.'),
('Maple syrup','Made from the sap of sugar maple trees, it takes roughly 40 gallons of sap to make 1 gallon of syrup.'),
('Peanut butter','Invented in the late 19th century; a tablespoon contains roughly 8 grams of protein.'),
('Sriracha','Named after the Thai city Si Racha; it''s a fermented chili sauce with a balance of heat and sweetness.'),
('Mixed herbs','Typically include thyme, rosemary, oregano, and basil; they add complex flavor without needing extra salt.');

INSERT INTO recipes (name, protein_type, instructions) VALUES
('Lemon Garlic Chicken', 'Chicken', 'Marinate chicken in lemon juice, garlic, and olive oil, then bake at 400F (200C) for 20-25 mins.'),
('Honey Mustard Chicken', 'Chicken', 'Coat chicken with honey and Dijon mustard, season, and bake or pan-fry until golden and cooked through.'),
('Spicy Paprika Chicken', 'Chicken', 'Rub chicken with paprika, chili flakes, and oil; roast or grill until fully cooked.'),
('Soy Ginger Chicken', 'Chicken', 'Marinate chicken in soy sauce and ginger, then pan-sear or stir-fry until cooked and caramelized.'),
('Crispy Soy Tofu', 'Tofu', 'Press tofu to absorb excess moisture. Toss tofu in cornstarch, pan-fry in oil until crispy, then drizzle with soy sauce.'),
('Maple Glazed Tofu', 'Tofu', 'Press tofu to absorb excess moisture. Pan-fry tofu cubes until golden, then toss in maple syrup, soy sauce, and garlic.'),
('Spicy Peanut Tofu', 'Tofu', 'Stir-fry tofu and coat with peanut butter, sriracha, and soy sauce until heated through.'),
('Lemon Herb Tofu', 'Tofu', 'Marinate tofu in lemon juice and herbs, then bake or pan-fry until slightly golden.'),
('Garlic Butter Steak Bites', 'Beef', 'Sear beef cubes in butter and garlic on high heat until browned and cooked to preference.'),
('Teriyaki Beef', 'Beef', 'Cook beef slices in soy sauce, honey, and ginger until sauce thickens and beef is tender.'),
('Beef & Mushroom Skillet', 'Beef', 'Sauté ground beef, mushrooms, and onion until beef is browned and veggies are soft.'),
('Chili Lime Beef', 'Beef', 'Toss beef strips with lime juice, chili powder, and oil; cook quickly in a hot skillet.');

INSERT IGNORE INTO recipe_ingredients (recipe_id, ingredient_id) VALUES
(1,1),(1,2),(1,3),
(2,4),(2,5),(2,6),(2,7),
(3,8),(3,9),(3,3),
(4,10),(4,11),(4,12),
(5,18),(5,3),(5,10),
(6,20),(6,10),(6,2),(6,3),
(7,21),(7,22),(7,10),
(8,1),(8,23),(8,3),
(9,13),(9,2),
(10,10),(10,4),(10,11),
(11,14),(11,15),
(12,16),(12,17),(12,3);