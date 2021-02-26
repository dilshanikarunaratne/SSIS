CREATE DATABASE SOURCE_DATABASE
GO

USE SOURCE_DATABASE
GO

CREATE TABLE Order_header
(
Header_id				VARCHAR(5) PRIMARY KEY,
Order_id				VARCHAR(5),
Order_date				DATETIME,
Customer_id				VARCHAR(5),
Store_id				VARCHAR(5),
Delivery_date			DATETIME
)


INSERT INTO [dbo].Order_header (
	[Header_id], [Order_id], [Order_date], [Customer_id], [Store_id], [Delivery_date])
VALUES ('H01', 'O01', '2020-11-20', 'C01', '1', '2020-11-25'),
('H31', 'O31', '2020-11-20', 'C06', '1' , '2020-11-25'),
('H02', 'O02', '2020-10-20', 'C02', '1' , '2020-10-25'),
('H03', 'O03', '2020-10-20', 'C03', '2' , '2020-10-25'),
('H04', 'O04', '2020-10-20', 'C04', '6' , '2020-10-25'),
('H05', 'O05', '2020-10-20', 'C05', '6' , '2020-10-25'),
('H06', 'O06', '2020-10-20', 'C06', '2' , '2020-10-25'),
('H07', 'O07', '2020-10-20', 'C02', '4' , '2020-10-25'),
('H08', 'O08', '2020-10-20', 'C07', '6' , '2020-10-25'),
('H09', 'O09', '2020-10-20', 'C08', '5' , '2020-10-25'),
('H10', 'O10', '2020-10-20', 'C01', '7' , '2020-10-25'),
('H11', 'O11', '2020-11-01', 'C05', '2' , '2020-11-06'),
('H12', 'O12', '2020-11-02', 'C06', '5' , '2020-11-07'),
('H13', 'O13', '2020-11-03', 'C09', '6' , '2020-11-08'),
('H14', 'O14', '2020-11-03', 'C02', '1' , '2020-11-08'),
('H15', 'O15', '2020-11-04', 'C03', '7' , '2020-11-09')


CREATE TABLE Order_details
(
order_id				VARCHAR(5) PRIMARY KEY,
Prod_id					VARCHAR(5),
Qty						INT,
Unit_price				INT
)


INSERT INTO [dbo].Order_details (
	[order_id], [Prod_id], [Qty], [Unit_price])
VALUES ('O01', 'P01', 5, 400),
('O31', 'P01', 5, 400),
('O02', 'P02', 2, 900),
('O03', 'P03', 9, 400),
('O04', 'P01', 7, 400),
('O05', 'P03', 4, 400),
('O06', 'P02', 6, 900),
('O07', 'P02', 2, 900),
('O08', 'P01', 5, 400),
('O09', 'P01', 5, 400),
('O10', 'P02', 6, 900),
('O11', 'P03', 3, 400),
('O12', 'P01', 7, 400),
('O13', 'P03', 2, 900),
('O14', 'P02', 6, 900),
('O15', 'P01', 4, 400)

CREATE TABLE Product
(
Prod_id					VARCHAR(5) PRIMARY KEY,
Description				VARCHAR(50),
Measure_unit			VARCHAR(10),
Qty_in_hand				INT,
Prod_type				VARCHAR(10) 
)


INSERT INTO [dbo].Product (
	[Prod_id], [Description], [Measure_unit], [Qty_in_hand], [Prod_type])
VALUES ('P01', 'Barbie Dolls', 'Pieces', 139, 'PT01'),
('P02', 'Teddy Bear', 'Pieces', 104, 'PT02'),
('P03', 'Pooh Bear', 'Pieces', 60, 'PT02'),
('P04', 'Express Train', 'Pieces', 55, 'PT03'),
('P05', 'TOYOTA Prado Model SUV', 'Pieces', 19, 'PT03'),
('P06', 'Superman', 'Pieces', 30, 'PT08')


CREATE TABLE Product_type
(
Prod_type				VARCHAR(5),
Type_description		VARCHAR(50),
Prod_cat				VARCHAR(5),
CONSTRAINT PK_Product_type PRIMARY KEY (Prod_type,Prod_cat)
)


INSERT INTO [dbo].Product_type (
	[Prod_type], [Type_description], [Prod_cat])
VALUES ('PT01', 'Dolls', 'PC01'),
('PT02', 'Bears', 'PC03'),
('PT03', 'Vehicles','PC02'),
('PT04', 'Building Blocks', 'PC03'),
('PT05', 'Musical','PC03'),
('PT06', 'Weapon & Armor','PC02'),
('PT07', 'Board Games','PC03'),
('PT08', 'Action Figures','PC04'),
('PT09', 'Kitchen Set','PC01')

CREATE TABLE Product_category
(
Prod_cat				VARCHAR(5) PRIMARY KEY,
Category_description	VARCHAR(30) 
)


INSERT INTO [dbo].Product_category (
	[Prod_cat], [Category_description])
VALUES ('PC01', 'Kids - Girls'),
('PC02', 'Kids - Boys ' ),
('PC03', 'Kids - Girls & Boys' ),
('PC04', 'Men')



CREATE TABLE Customer
(
Customer_id				VARCHAR(5) PRIMARY KEY,
Cust_name				VARCHAR(70),
Cust_address			VARCHAR(70),
State					VARCHAR(30),
City					VARCHAR(30),
Country					VARCHAR(20),
Seg_id					VARCHAR(5)
)

INSERT INTO [dbo].Customer (
	[Customer_id], [Cust_name], [Cust_address], [State], [City], [Country], [Seg_id])
VALUES ('C01', 'Micheal Perera', '42/B, Egoda Road, Kiribathgoda', 'Western', 'Gampaha', 'Sri Lanka', 'S01'),
('C02', 'Sunil Pieris', '21, Temple Street, Maharagama', 'Western', 'Colombo', 'Sri Lanka', 'S02'),
('C03', 'Dihely Amaratunga', '3/D, 3rd Lane, Kottawa', 'Western', 'Colombo', 'Sri Lanka', 'S01'),
('C04', 'Kasun Subasinghe', '160/2, Poorwarama Mawatha, Kirulapone ', 'Western', 'Colombo', 'Sri Lanka', 'S03'),
('C05', 'Vishal Kariyawasam', '2/B, Salmal Lane, Ja-ela', 'Western', 'Gampaha', 'Sri Lanka', 'S03'),
('C06', 'Ameli Perera', '87/1, Janatha Mawatha, Panadura', 'Western', 'Kalutara', 'Sri Lanka', 'S01'),
('C07', 'Heshal Silva', '34, Pagoda Road, Nawala', 'Western', 'Colombo', 'Sri Lanka', 'S02'),
('C08', 'Roshel Wikcremasinghe', '45/3, Horana Road, Horana', 'Western', 'Kalutara', 'Sri Lanka', 'S02')


CREATE TABLE Customer_segment
(
Seg_id					VARCHAR(5) PRIMARY KEY,
Seg_name				VARCHAR(30) 
)

INSERT INTO [dbo].Customer_segment (
	[Seg_id], [Seg_name])
VALUES ('S01', 'Kids under 12 - Boys'),
('S02', 'Kids under 12 - Girls'),
('S03', 'Age Above 12 - Male'),
('S04', 'Age Above 12 - Female')




CREATE DATABASE TARGET_DATABASE
GO

USE TARGET_DATABASE
GO

CREATE TABLE Order_Details_Fact
(
Order_id				VARCHAR(5),
Prod_id					VARCHAR(5),
Customer_id				VARCHAR(5),
Store_id				INT,
Date_key				DATETIME,
Amount_sold				INT,
Qty						INT,
Unit_price				INT
)


CREATE TABLE Dim_product
(
Prod_id					VARCHAR(5),
Description				VARCHAR(50),
Measure_unit			VARCHAR(10),
Qty_in_hand				INT,
Prod_type				VARCHAR(5),
Type_description		VARCHAR(50),
Prod_cat				VARCHAR(10),
Category_description	VARCHAR(30) 
)


CREATE TABLE Dim_customer
(
Customer_id				VARCHAR(5),
Cust_name				VARCHAR(50),
Cust_address			VARCHAR(70),
State					VARCHAR(30),
City					VARCHAR(30),
Country					VARCHAR(20),
Seg_id					VARCHAR(5),
Seg_name				VARCHAR(30),
StartDate				DATE,
EndDate					DATE,
PreviousName			VARCHAR(50)
)


CREATE TABLE Dim_date
(
Date_key				DATETIME,
Year					INT,
Month					VARCHAR(15),
MonthNum				INT,
Day						VARCHAR(15),
Time					TIME
)


CREATE TABLE Dim_location
(
Store_id				VARCHAR(5),
Location				VARCHAR(20)
)


CREATE TABLE Monthly_summary_Fact
(
Store_id				INT,
Prod_id					VARCHAR(5),
MonthNum				INT,
Month					VARCHAR(15),
Qty_sold				INT,
Amount_sold				INT
)


CREATE TABLE Basket
(
date_key				DATETIME,
product_id1				VARCHAR(5),
product_id2				VARCHAR(5),
Store_id				INT,
product1_qty			INT,
product2_qty			INT,
product1_amount			INT,
product2_amount			INT
)


CREATE TABLE Basket1
(
date_key				DATETIME,
product_id1				VARCHAR(5),
Store_id				INT,
product1_qty			INT,
product1_amount			INT,
)


CREATE TABLE Basket2
(
date_key				DATETIME,
product_id2				VARCHAR(5),
Store_id				INT,
product2_qty			INT,
product2_amount			INT
)



CREATE TABLE Sales
(
prod_id					VARCHAR(5),
Amount_sold				INT
)


--To check SCD2--

USE SOURCE_DATABASE
UPDATE [dbo].[customer]
    SET [Cust_name] = 'Kisal Pieris'
    WHERE [Customer_id] = 'C02'

USE TARGET_DATABASE
SELECT Customer_id, Cust_name, StartDate, EndDate, PreviousName FROM Dim_customer



--To check SCD3--

USE SOURCE_DATABASE
SELECT customer_id, Cust_name FROM customer

UPDATE [dbo].[customer]
    SET [Cust_name] = 'Andrea Aponsu'
    WHERE [Customer_id] = 'C06'

UPDATE [dbo].[customer]
    SET [Cust_name] = 'Micheal Perera'
    WHERE [Cust_name] = 'Andrea Aponsu'


UPDATE [dbo].[customer]
    SET [Cust_name] = 'Andrea Aponsu'
    WHERE [Cust_name] = 'Micheal Perera'


USE TARGET_DATABASE
SELECT Customer_id, Cust_name, StartDate, EndDate, PreviousName FROM Dim_customer
