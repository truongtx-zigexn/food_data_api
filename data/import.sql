-- ============================ Meal ============================
INSERT INTO
    meals (name)
VALUES
    ('Garlic Butter Shrimp'),
    ('Chicken Fried Rice'),
    ('Vegetable Stir Fry'),
    ('Beef and Broccoli Stir Fry'),
    ('Spaghetti with Meat Sauce'),
    ('Cheesy Baked Potatoes'),
    ('Tilapia with Lemon Butter'),
    ('Vegetarian Chickpea Stew'),
    ('Green Vegetable Medley'),
    ('Creamy Cashew Chicken'),
    ('Spicy Sesame Noodles'),
    ('Tuna and Zucchini Bake'),
    ('Turmeric Infused Lentils'),
    ('Coconut Cream Curry'),
    ('Honey Glazed Pork Belly'),
    ('Chocolate Almond Delight'),
    ('Garlic Butter Tilapia'),
    ('Beef Bok Choy Stir Fry'),
    ('Creamy Chicken and Potato Bake'),
    ('Sweet and Sour Pork with Rice'),
    ('Spaghetti with Tomato and Mushroom'),
    ('Vegetarian Cabbage Wraps'),
    ('Avocado Tuna Salad'),
    ('Coconut Oat Pancakes'),
    ('Baked Eggplant Parmesan'),
    ('Walnut and Grape Salad'),
    ('Honey Garlic Pork Chops'),
    ('Asian Sesame Chicken Salad'),
    ('Shrimp and Avocado Tacos'),
    ('Eggplant and Chickpea Curry'),
    ('Bok Choy and Mushroom Stir Fry'),
    ('Cabbage and Walnut Slaw'),
    ('Sweet Potato and Lentil Stew'),
    ('Creamy Tuna Pasta Salad'),
    ('Avocado and Crab Toast'),
    ('Tomato Basil Mozzarella Salad'),
    ('Grilled Beef Steak with Vegetables'),
    ('Honey Glazed Chicken Thighs'),
    ('Pork Belly Banh Mi'),
    ('Shrimp Pad Thai'),
    ('Beef Ribs with Barbecue Sauce'),
    ('Chicken and Mushroom Stroganoff'),
    ('Sweet and Sour Catfish'),
    ('Tilapia Fish Tacos'),
    ('Spicy Pork Stir Fry'),
    ('Crab and Avocado Rolls');

-- ============================ Meal Ingredient ============================
INSERT INTO
    meal_ingredients (meal_id, fdb_id, ingredient_qty)
VALUES
    -- Garlic Butter Shrimp
    (1, 1104647, 27.5), -- Garlic, 27.5g
    (1, 2684443, 200.0), -- Shrimp, 200g
    (1, 2262074, 50.0), -- Butter, 50g
    (1, 748481, 9.0), -- Olive oil, 9g
    (1, 746777, 16.8), -- Soy sauce, 16.8g
    -- Chicken Fried Rice
    (2, 2646170, 150.0), -- Chicken breast, 150g
    (2, 1104812, 200.0), -- Rice, 200g
    (2, 747997, 100.0), -- Egg, 100g
    (2, 790577, 50.0), -- Onion, 50g
    (2, 748366, 9.21), -- Vegetable oil, 9.21g
    -- Vegetable Stir Fry
    (3, 747447, 100.0), -- Broccoli, 100g
    (3, 2346400, 80.0), -- Green beans, 80g
    (3, 2346406, 50.0), -- Cucumber, 50g
    (3, 2685658, 50.0), -- Bok choy, 50g
    (3, 748366, 9.21), -- Vegetable oil, 10ml
    -- Beef and Broccoli Stir Fry
    (4, 2646174, 150.0), -- Beef, 150g
    (4, 747447, 100.0), -- Broccoli, 100g
    (4, 746777, 22.4), -- Soy sauce, 22.4g
    (4, 2262074, 20), -- Butter, 20g
    (4, 748481, 9.0), -- Olive oil, 9g
    -- Spaghetti with Meat Sauce
    (5, 168928, 200.0), -- Pasta, 200g
    (5, 2646174, 100.0), -- Beef, 100g
    (5, 2685796, 150.0), -- Tomatoes, crushed, 150g
    (5, 790577, 50.0), -- Onion, 50g
    (5, 748481, 9.0), -- Olive oil, 9g
    -- Cheesy Baked Potatoes
    (6, 2346402, 300.0), -- Potatoes, 300g
    (6, 173414, 50.0), -- Cheese, cheddar, 50g
    (6, 746782, 100.0), -- Milk, 100g
    (6, 2262074, 30.0), -- Butter, 30g
    (6, 746784, 5.0), -- Sugar, 5g
    -- Tilapia with Lemon Butter
    (7, 333374, 200.0), -- Tilapia, 200g
    (7, 2262074, 30.0), -- Butter, 30g
    (7, 2710824, 9.72), -- Lemon juice, 9.72g
    (7, 1104647, 16.5), -- Garlic, 16.5g
    (7, 748481, 9.0), -- Olive oil, 9g
    -- Vegetarian Chickpea Stew
    (8, 2644316, 150.0), -- Chickpeas, 150g
    (8, 2685796, 200.0), -- Tomatoes, crushed, 200g
    (8, 2346407, 100.0), -- Cabbage, green, 100g
    (8, 2685722, 50.0), -- Beets, 50g
    (8, 748366, 13.8), -- Vegetable oil, 15ml
    -- Green Vegetable Medley
    (9, 2258588, 200.0), -- Bell peppers, 200g
    (9, 2003601, 150.0), -- Mushrooms, 150g
    (9, 1999633, 100.0), -- Spinach, 100g
    (9, 323505, 100.0), -- Kale, 100g
    -- Creamy Cashew Chicken
    (10, 170859, 101.0), -- Cream, 101g
    (10, 170162, 50.0), -- Cashew nuts, 50g
    (10, 171515, 200.0), -- Chicken breast tenders, 200g
    -- Spicy Sesame Noodles
    (11, 171319, 5.0), -- Chili powder, 5g
    (11, 170150, 10.0), -- Sesame seeds, 10g
    (11, 168914, 150.0), -- Rice noodles, 150g
    -- Tuna and Zucchini Bake
    (12, 334194, 200.0), -- Tuna, 200g
    (12, 2685568, 150.0), -- Zucchini, 150g
    (12, 174928, 50.0), -- Bread crumbs, 50g
    -- Turmeric Infused Lentils
    (13, 172231, 5.0), -- Turmeric, 5g
    (13, 171184, 250.0), -- Vietnamese carrot lemongrass soup, 250g
    -- Coconut Cream Curry
    (14, 170580, 440.0), -- Coconut cream, 440g
    (14, 169736, 150.0), -- Pasta, 150g
    (14, 172231, 5.0), -- Turmeric, 5g
    -- Honey Glazed Pork Belly
    (15, 169640, 50.0), -- Honey, 50g
    (15, 167812, 300.0), -- Pork belly, 300g
    (15, 171861, 100.0), -- Gluten-free rolls, 100g
    -- Chocolate Almond Delight
    (16, 168754, 50.0), -- Milk chocolate with almonds, 50g
    (16, 168104, 104.0), -- Frozen yogurt, 104g
    -- Garlic Butter Tilapia
    (17, 1104647, 27.5), -- Garlic, 27.5g
    (17, 333374, 200.0), -- Tilapia, 200g
    (17, 2262074, 50.0), -- Butter, 50g
    (17, 748481, 9.0), -- Olive oil, 9
    -- Beef Bok Choy Stir Fry
    (18, 2646174, 250.0), -- Beef, chuck, 250g
    (18, 2685658, 150.0), -- Bok choy, 150g
    (18, 1104647, 27.5), -- Garlic, 27.5g
    (18, 746777, 16.8), -- Soy sauce, 16.8g
    -- Creamy Chicken and Potato Bake
    (19, 2646170, 200.0), -- Chicken breast, 200g
    (19, 2346402, 150.0), -- Red potatoes, 150g
    (19, 746782, 100.0), -- Milk, 100g
    (19, 2262074, 30.0), -- Butter, 30g
    -- Sweet and Sour Pork with Rice
    (20, 2514745, 200.0), -- Pork loin, 200g
    (20, 1104812, 150.0), -- Rice, 150g
    (20, 748366, 13.8), -- Vegetable oil, 13.8g
    -- Spaghetti with Tomato and Mushroom
    (21, 168928, 200.0), -- Pasta, 200g
    (21, 2685796, 150.0), -- Tomatoes, 150g
    (21, 2003678, 100.0), -- Mushrooms, 100g
    (21, 748481, 9), -- Olive oil, 9g
    -- Vegetarian Cabbage Wraps
    (22, 2346407, 200.0), -- Green cabbage, 200g
    (22, 2644316, 150.0), -- Chickpeas, 150g
    (22, 2258586, 100.0), -- Carrot, 100g
    (22, 748366, 13.8), -- Vegetable oil, 13.8g
    -- Avocado Tuna Salad
    (23, 2710824, 150.0), -- Avocado, 150g
    (23, 333911, 100.0), -- Tuna, canned, 100g
    (23, 2346388, 50.0), -- Lettuce, 50g
    (23, 2346406, 30.0), -- Cucumber, 30g
    -- Coconut Oat Pancakes
    (24, 2346628, 100.0), -- Oats, 100g
    (24, 330426, 20.0), -- Coconut oil, 20g
    (24, 746782, 150.0), -- Milk, 150g
    (24, 747997, 50.0), -- Egg, 50g
    -- Baked Eggplant Parmesan
    (25, 2685738, 150.0), -- Eggplant, 150g
    (25, 173414, 50.0), -- Cheese, cheddar, 50g
    (25, 789890, 30.0), -- Flour, 30g
    (25, 748481, 13.5), -- Olive oil, 13.5g
    -- Walnut and Grape Salad
    (26, 2346394, 50.0), -- Walnuts, 50g
    (26, 2346413, 100.0), -- Grapes, 100g
    (26, 2346388, 50.0), -- Lettuce, 50g
    (26, 748481, 9.0), -- Olive oil, 9g
    -- Honey Garlic Pork Chops
    (27, 169640, 30.0), -- Honey, 30g
    (27, 2514745, 200.0), -- Pork loin, 200g
    (27, 1104647, 27.5), -- Garlic, 27.5g
    (27, 748366, 13.8), -- Vegetable oil, 13.8g
    -- Asian Sesame Chicken Salad
    (28, 2646170, 200.0), -- Chicken breast, 200g
    (28, 170150, 10.0), -- Sesame seeds, 10g
    (28, 2346388, 100.0), -- Lettuce, 100g
    (28, 2346406, 50.0), -- Cucumber, 50g
    (28, 746777, 16.8), -- Soy sauce, 16.8g
    -- Shrimp and Avocado Tacos
    (29, 2684443, 150.0), -- Shrimp, 150g
    (29, 2710824, 100.0), -- Avocado, 100g
    (29, 748481, 9.0), -- Olive oil, 9g
    (29, 2346405, 50.0), -- Celery, 50g
    -- Eggplant and Chickpea Curry
    (30, 2685738, 150.0), -- Eggplant, 150g
    (30, 2644316, 100.0), -- Chickpeas, 100g
    (30, 172231, 5.0), -- Turmeric, 5g
    (30, 748481, 13.5), -- Olive oil, 13.5g
    -- Bok Choy and Mushroom Stir Fry
    (31, 2685658, 200.0), -- Bok choy, 200g
    (31, 2003678, 150.0), -- Mushrooms, 150g
    (31, 746777, 16.8), -- Soy sauce, 16.8g
    (31, 1104647, 27.5), -- Garlic, 27.5g
    -- Cabbage and Walnut Slaw
    (32, 2346407, 200.0), -- Green cabbage, 200g
    (32, 2346394, 50.0), -- Walnuts, 50g
    (32, 748481, 9.0), -- Olive oil, 9g
    (32, 2258586, 50.0), -- Carrot, 50g
    -- Sweet Potato and Lentil Stew
    (33, 2346403, 150.0), -- Sweet potato, 150g
    (33, 2644316, 100.0), -- Chickpeas, 100g
    (33, 2685796, 100.0), -- Tomatoes, 100g
    (33, 748481, 13.5), -- Olive oil, 13.5g
    -- Creamy Tuna Pasta Salad
    (34, 333911, 100.0), -- Tuna, canned, 100g
    (34, 168928, 150.0), -- Pasta, 150g
    (34, 746782, 100.0), -- Milk, 100g
    (34, 173414, 50.0), -- Cheese, cheddar, 50g
    -- Avocado and Crab Toast
    (35, 2710824, 100.0), -- Avocado, 100g
    (35, 2684446, 100.0), -- Crab, 100g
    (35, 2346405, 30.0), -- Celery, 30g
    (35, 171861, 50.0), -- Gluten-free rolls, 50g
    -- Tomato Basil Mozzarella Salad
    (36, 2685796, 150.0), -- Tomatoes, 150g
    (36, 171708, 50.0), -- Basil, 50g
    (36, 173414, 100.0), -- Cheese, mozzarella, 100g
    (36, 748481, 9.0), -- Olive oil, 9g
    -- Grilled Beef Steak with Vegetables
    (37, 2646174, 250.0), -- Beef steak, 250g
    (37, 2346405, 100.0), -- Celery, 100g
    (37, 747447, 150.0), -- Broccoli, 150g
    (37, 748481, 13.5), -- Olive oil, 13.5g
    -- Honey Glazed Chicken Thighs
    (38, 2646170, 200.0), -- Chicken thighs, 200g
    (38, 169640, 30.0), -- Honey, 30g
    (38, 1104647, 27.5), -- Garlic, 27.5g
    (38, 748366, 13.5), -- Vegetable oil, 13.5g
    -- Pork Belly Banh Mi
    (39, 167812, 200.0), -- Pork belly, 200g
    (39, 2346405, 50.0), -- Celery, 50g
    (39, 2258586, 50.0), -- Carrot, 50g
    (39, 171861, 100.0), -- Gluten-free rolls, 100g
    -- Shrimp Pad Thai
    (40, 2684443, 150.0), -- Shrimp, 150g
    (40, 168914, 200.0), -- Rice noodles, 200g
    (40, 746777, 16.8), -- Soy sauce, 16.8g
    (40, 1104647, 27.5), -- Garlic, 27.5g
    -- Beef Ribs with Barbecue Sauce
    (41, 170221, 300.0), -- Beef ribs, 300g
    (41, 334285, 24.0), -- Barbecue sauce, 24g
    (41, 748366, 13.8), -- Vegetable oil, 13.8g
    (41, 2346406, 100.0), -- Cucumber, 100g
    -- Chicken and Mushroom Stroganoff
    (42, 2646170, 200.0), -- Chicken breast, 200g
    (42, 2003678, 150.0), -- Mushrooms, 150g
    (42, 789890, 30.0), -- Flour, 30g
    (42, 746782, 100.0), -- Milk, 100g
    -- Sweet and Sour Catfish
    (43, 2684536, 200.0), -- Catfish, 200g
    (43, 1104647, 27.5), -- Garlic, 27.5g
    (43, 748366, 13.8), -- Vegetable oil, 13.8g
    -- Tilapia Fish Tacos
    (44, 333374, 150.0), -- Tilapia, 150g
    (44, 2346405, 50.0), -- Celery, 50g
    (44, 2710824, 100.0), -- Avocado, 100g
    (44, 171861, 100.0), -- Gluten-free rolls, 100g
    -- Spicy Pork Stir Fry
    (45, 2514745, 200.0), -- Pork loin, 200g
    (45, 171319, 10.0), -- Chili powder, 10g
    (45, 2685658, 150.0), -- Bok choy, 150g
    (45, 746777, 16.8), -- Soy sauce, 16.8g
    -- Crab and Avocado Rolls
    (46, 2684446, 150.0), -- Crab, 150g
    (46, 2710824, 100.0), -- Avocado, 100g
    (46, 171861, 100.0), -- Gluten-free rolls, 100g
    (46, 748481, 9.0);

-- Olive oil, 9g;