/* Use Table Import Wizard to load 2021, 2022, 2023 beverage csvs and create tables in beverages database */

/* Alter Beverage 2021 table to include caffeine field*/
ALTER TABLE bev2021
ADD caffeine INT
/* Alter Beverage 2021, 2022, and 2023 table to include year field. Run each command separately*/
/*2021*/
ALTER TABLE bev2021
ADD year INT
/*2022*/
ALTER TABLE bev2022
ADD year INT
/*2023*/
ALTER TABLE bev2023
ADD year INT

/*Determine distinct products from bev2021 and copy result to clipboard*/

SELECT DISTINCT product FROM bev2021 ORDER BY product

/*Insert the year 2021 into bev2021 table, paste copied product names into WHERE clause*/
/* If error occurs run the following: SET SQL_SAFE_UPDATES = 0*/

UPDATE bev2021
SET year = 2021
WHERE product IN (
'Berry Blush',
'Blissful Bubbles',
'Celestial Crush',
'Citrus Sizzle',
'Cosmic Coolant',
'Dreamy Droplets',
'Electric Elixir',
'Enchanted Euphoria',
'Frosty Fizz',
'Health Potion',
'Luminous Liquid',
'Maple Mash UP',
'Moonbeam Brew',
'Oceanic Oasis',
'Rainbow Rush',
'Sapped',
'Secret Synergy',
'Sparkle Splash',
'Twilight Tonic',
'Velvet Vortex')

/*Determine distinct products from bev2022 and copy result to clipboard*/

SELECT DISTINCT product FROM bev2022 ORDER BY product

/*Insert the year 2022 into bev2021 table, paste copied product names into WHERE clause*/
/* If error occurs run the following: SET SQL_SAFE_UPDATES = 0*/
UPDATE bev2022
SET year = 2022
WHERE product IN (
'Berry Blush',
'Blissful Bubbles',
'Celestial Crush',
'Citrus Sizzle',
'Cosmic Coolant',
'Dreamy Droplets',
'Eggs Benedict Expresso',
'Electric Elixir',
'Enchanted Euphoria',
'Frosted Flare',
'Frosty Fizz',
'Health Potion',
'Luminous Liquid',
'Moonbeam Brew',
'Mystic Mist',
'Oceanic Oasis',
'Pancake Flip Frappe',
'Pecan Pie Latte',
'Rainbow Rush',
'Secret Synergy',
'Sparkle Splash',
'Twilight Tonic',
'Velvet Vortex')

/*Determine distinct products from bev2023 and copy result to clipboard*/

SELECT DISTINCT product FROM bev2023 ORDER BY product

/*Insert the year 2023 into bev2021 table, paste copied product names into WHERE clause*/
/* If error occurs run the following: SET SQL_SAFE_UPDATES = 0*/
UPDATE bev2023
SET year = 2023
WHERE product IN (
'Berry Blush',
'Blissful Bubbles',
'Celestial Crush',
'Citrus Sizzle',
'Cosmic Coolant',
'Dreamy Droplets',
'Electric Elixir',
'Enchanted Euphoria',
'Frosted Flare',
'Frosty Fizz',
'Health Potion',
'Luminous Liquid',
'Moonbeam Brew',
'Mystic Mist',
'Oceanic Oasis',
'Rainbow Rush',
'Secret Synergy',
'Sparkle Splash',
'Twilight Tonic',
'Velvet Vortex')


/*Create Consolidated Table with beverage 2021 data*/

/*Select required columns. Compute volume_quantity, weight_quantity, and revenue_quantity*/
SELECT bev21.product, bev21.weight, bev21.volume, bev21.caffeine, bev21.per_unit_price, bev21.quantity, 
(bev21.quantity * bev21.volume) as Volume_Quantity, (bev21.weight * bev21.quantity) as Weight_Quantity, 
(bev21.per_unit_price * bev21.quantity) as Revenue_Quantity,  bev21.region, bev21.state, bev21.country,
c.category_name,  org.first_name, org.last_name, bev21.year 
FROM org_chart_table org
/*Left join to include all data from org_chart_table*/
LEFT JOIN category c on c.category_name = org.category_name
LEFT JOIN bev2021 bev21 on c.product_name = bev21.product
/*Filter by last name to select Bodhi Perry, Remi Olson, and Buford Jackson. Filter by first name to select Rowan Walsh as there is another entry with the same name */
WHERE last_name in ('Perry', 'Olson', 'Jackson') OR first_name = 'Rowan'
/*Group by selected columns*/
GROUP BY org.id, org.last_name, org.category_name, c.product_name, bev21.weight, bev21.volume, bev21.caffeine, bev21.year,
bev21.per_unit_price, bev21.quantity, bev21.region, bev21.state, bev21.country, Volume_Quantity, Weight_Quantity, Revenue_Quantity
/*Order by last name ascending, category, and product*/
ORDER BY org.last_name, category_name, product

/*Export Data through the Table Export Wizard as a CSV labeled consolidated_bev21*/

/*Select required columns. Compute volume_quantity, weight_quantity, and revenue_quantity*/
SELECT bev22.product, bev22.weight, bev22.volume, bev22.caffeine, bev22.per_unit_price, bev22.quantity, 
(bev22.quantity * bev22.volume) as Volume_Quantity, (bev22.weight * bev22.quantity) as Weight_Quantity, 
(bev22.per_unit_price * bev22.quantity) as Revenue_Quantity,  bev22.region, bev22.state, bev22.country,
c.category_name,  org.first_name, org.last_name, bev22.year 
FROM org_chart_table org
/*Left join to include all data from org_chart_table*/
LEFT JOIN category c on c.category_name = org.category_name
LEFT JOIN bev2022 bev22 on c.product_name = bev22.product
/*Filter by last name to select Bodhi Perry, Remi Olson, and Buford Jackson. Filter by first name to select Rowan Walsh as there is another entry with the same name */
WHERE last_name in ('Perry', 'Olson', 'Jackson') OR first_name = 'Rowan'
/*Group by selected columns*/
GROUP BY org.id, org.last_name, org.category_name, c.product_name, bev22.weight, bev22.volume, bev22.caffeine, bev22.year,
bev22.per_unit_price, bev22.quantity, bev22.region, bev22.state, bev22.country, Volume_Quantity, Weight_Quantity, Revenue_Quantity
/*Order by last name ascending, category, and product*/
ORDER BY org.last_name, category_name, product

/*Export Data through the Table Export Wizard as a CSV labeled consolidated_bev22*/

/*Select required columns. Compute volume_quantity, weight_quantity, and revenue_quantity*/
SELECT bev23.product, bev23.weight, bev23.volume, bev23.caffeine, bev23.per_unit_price, bev23.quantity, 
(bev23.quantity * bev23.volume) as Volume_Quantity, (bev23.weight * bev23.quantity) as Weight_Quantity, 
(bev23.per_unit_price * bev23.quantity) as Revenue_Quantity,  bev23.region, bev23.state, bev23.country,
c.category_name,  org.first_name, org.last_name, bev23.year 
FROM org_chart_table org
/*Left join to include all data from org_chart_table*/
LEFT JOIN category c on c.category_name = org.category_name
LEFT JOIN bev2023 bev23 on c.product_name = bev23.product
/*Filter by last name to select Bodhi Perry, Remi Olson, and Buford Jackson. Filter by first name to select Rowan Walsh as there is another entry with the same name */
WHERE last_name in ('Perry', 'Olson', 'Jackson') OR first_name = 'Rowan'
/*Group by selected columns*/
GROUP BY org.id, org.last_name, org.category_name, c.product_name, bev23.weight, bev23.volume, bev23.caffeine, bev23.year,
bev23.per_unit_price, bev23.quantity, bev23.region, bev23.state, bev23.country, Volume_Quantity, Weight_Quantity, Revenue_Quantity
/*Order by last name ascending, category, and product*/
ORDER BY org.last_name, category_name, product

/*Export Data through the Table Export Wizard as a CSV labeled consolidated_bev23*/

/*Import consolidated 2021, 2022, and 2023 csv files via the Table Import Wizard to the beverages database*/

/*Combine consolidated tables into one, ensure all columns are in correct order */

SELECT Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity, Volume_Quantity, Weight_Quantity, Revenue_Quantity,  Year, Region, State,
Country, Category_Name AS Category, First_name, Last_name
FROM consolidated_bev21
Union ALL
SELECT Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity, Volume_Quantity, Weight_Quantity, Revenue_Quantity,  Year, Region, State,
Country, Category_Name AS Category, first_name, last_name
FROM consolidated_bev22
Union ALL
SELECT Product, Weight, Volume, Caffeine, Per_Unit_Price, Quantity, Volume_Quantity, Weight_Quantity, Revenue_Quantity,  Year, Region, State,
Country, Category_Name AS Category, first_name, last_name
FROM consolidated_bev23

/*Export table through the Table Export Wizard as a CSV labeled G5_Consolidated_Beverage_Data*/

/*Import consolidated table csv through the Table Import Wizard to the beverages database*/

/*Select the required columns for the final output table. Calculate total quantity and total revenue quantity*/
SELECT Last_Name, First_Name, Year, Category, Product, Country, Region, State, Weight, Volume, Caffeine, Per_Unit_Price,
SUM(Quantity) AS Total_Quantity, SUM(Revenue_Quantity) AS Total_Revenue_Quantity
FROM g5_consolidated_beverage_data
GROUP BY last_name, first_name, year, category, product, country, region, state, weight ,volume, caffeine, per_unit_price
ORDER BY last_name, first_name, year, category, product, country, region, Total_Revenue_Quantity DESC

/*Export table through the Table Export Wizard as a CSV labeled G5_Output_Final*/