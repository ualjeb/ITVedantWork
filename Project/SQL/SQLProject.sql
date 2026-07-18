use julysql2026;
-- 1. Create parent table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    JobTitle VARCHAR(50),
    Department VARCHAR(50)
);

-- 2. Create child table with Foreign Keys
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    CustomerID INT,
    EmployeeID INT,
    TotalAmount DECIMAL(10,2),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 3. Create the Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

-- 4. Create the OrderDetails Bridge Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Details_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_Details_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 5. Insert all Products (IDs 301–310)
-- INSERT INTO Products (ProductID, ProductName, Price) VALUES
--  (301, 'Wireless Mouse', 25.00),
--  (302, 'Mechanical Keyboard', 85.00),
--  (303, '27-inch Monitor', 250.00),
--  (304, 'USB-C Hub', 45.00),
--  (305, 'Noise Cancelling Headphones', 180.00),
--  (306, 'Ergonomic Office Chair', 350.00),
--  (307, 'HD Webcam', 65.00),
--  (308, 'External 1TB SSD', 120.00),
--  (309, 'Bluetooth Speaker', 55.00),
--  (310, 'Laptop Stand', 40.00);

-- 6. Insert Order Details (Breaking down the items inside your orders)
-- INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
--  (1001, 501, 303, 3, 250.00),
--  (1002, 501, 306, 1, 350.00),
--  (1003, 501, 304, 3, 45.00),
--  (1004, 502, 303, 1, 250.00),
--  (1005, 502, 302, 2, 85.00),
--  (1006, 502, 301, 1, 25.00),
--  (1007, 503, 310, 2, 40.00),
--  (1008, 504, 306, 5, 350.00),
--  (1009, 504, 303, 2, 250.00),
--  (1010, 504, 308, 2, 120.00),
--  (1011, 505, 301, 1, 25.00),
--  (1012, 506, 303, 2, 250.00),
--  (1013, 506, 304, 2, 45.00),
--  (1014, 506, 301, 1, 25.00),
--  (1015, 507, 308, 1, 120.00),
--  (1016, 508, 302, 3, 85.00),
--  (1017, 508, 310, 2, 40.00),
--  (1018, 509, 305, 4, 180.00),
--  (1019, 509, 307, 2, 65.00),
--  (1020, 509, 303, 1, 250.00),
--  (1021, 510, 304, 1, 45.50);

-- 7. Insert mock data
-- INSERT INTO Customers VALUES 
-- (101, 'Arjun Sharma', 'arjun@email.com', 'Delhi'),
-- (102, 'Priya Patel', 'priya@email.com', 'Mumbai'),
-- (103, 'Amit Verma', 'amit@email.com', 'Bangalore'),
-- (104, 'Sneha Reddy', 'sneha@email.com', 'Hyderabad'),
-- (105, 'Rohan Das', 'rohan@email.com', 'Kolkata');

-- INSERT INTO Employees VALUES 
-- (501, 'Rajesh Kumar', 'Sales Associate', 'Retail'),
-- (502, 'Anjali Singh', 'Account Manager', 'Corporate Sales'),
-- (503, 'Vikram Malhotra', 'Customer Success', 'Support');

-- INSERT INTO Orders VALUES 
-- (1001, '2026-07-01', 101, 501, 15000.00),
-- (1002, '2026-07-02', 102, 501, 23500.00),
-- (1003, '2026-07-03', 101, 502, 8500.00),
-- (1004, '2026-07-05', 103, 503, 42000.00),
-- (1005, '2026-07-06', 104, 501, 1200.00),
-- (1006, '2026-07-07', 102, 502, 31000.00),
-- (1007, '2026-07-10', 105, 503, 950.00),
-- (1008, '2026-07-12', 103, 502, 18500.00);

-- INSERT INTO Customers (CustomerID, CustomerName, Email, City) VALUES 
--  (101, 'Seka Shere', 's.shere@sciencedirect.com', 'Cartagena'),
--  (102, 'Mirilla Nyssen', 'mirilla.nyssen@flickr.com', 'Trzebnica'),
--  (103, 'Wyndham Gepheart', 'wgepheart@discuz.net', 'Banjar Timbrah'),
--  (104, 'John Domenic', 'jdomenic@techhub.es', 'Ḑawrān ad Daydah'),
--  (105, 'Marti Swatheridge', 'mswatheridge@mayoclinic.org', 'Bradford'),
--  (106, 'Jack Firmager', 'j.firmager@adobe.com', 'Cerquilho'),
--  (107, 'Osborne Heinert', 'oheinert@netlog.com', 'Bor'),
--  (108, 'Wyatt Culp', 'wculp@a8.net', 'Aurillac'),
--  (109, 'Odele Frunks', 'ofrunks@bbc.co.uk', 'Rozsypne'),
--  (110, 'Emelda Lysons', 'elysons@constantcontact.com', 'Ballyhaunis'),
--  (111, 'Rivy Renowden', 'rrenowden@webnode.com', 'Sancha'),
--  (112, 'Corrine Rochester', 'crochester@domainmarket.com', 'Xinghai'),
--  (113, 'Yvonne Breheny', 'ybreheny@oracle.com', 'Binangun'),
--  (114, 'Lilah Sherman', 'lsherman@cam.ac.uk', 'Sungsang'),
--  (115, 'Greg Vasilchikov', 'gvasil@nexus.com', 'Kyjov'),
--  (116, 'Rubi Loudwell', 'rloudwell@nydailynews.com', 'Chaguaní'),
--  (117, 'Bethina Valett', 'bvalett@elpais.com', 'Jessore'),
--  (118, 'Robina Lamar', 'rlamar@elpais.com', 'Campo de la Cruz'),
--  (119, 'Guenna Espinola', 'gespinola@sakura.ne.jp', 'Dougang'),
--  (120, 'Wilton MacGorley', 'wmacgorley@elpais.com', 'Niushou'),
--  (121, 'Harrison Brodeur', 'hbrodeur@census.gov', 'Miragaia'),
--  (122, 'Trevor Cuttler', 'tcuttler@discovery.com', 'Sabang'),
--  (123, 'Pippy Seaton', 'pseaton@chronoengine.com', 'Grzęska'),
--  (124, 'Domenico Guice', 'dguice@xrea.com', 'Providence'),
--  (125, 'Prent Meegin', 'pmeegin@addthis.com', 'Windsor'),
--  (126, 'Hali Critchley', 'hcritchley@artisteer.com', 'Achadinha'),
--  (127, 'Munroe Dumbell', 'mdumbell@shareasale.com', 'Villa Ojo de Agua'),
--  (128, 'Isa Tinwell', 'itinwell@unc.edu', 'Ibiá'),
--  (129, 'Raynard Billborough', 'rbillborough@apache.org', 'Ngudu'),
--  (130, 'Merilyn Samper', 'msamper@mail.ru', 'Laoliangcang'),
--  (131, 'Max Gaskoin', 'mgaskoin@netlog.com', 'Sahavato'),
--  (132, 'Dante Goligher', 'dgoligher@epa.gov', 'Zacatecoluca'),
--  (133, 'Luis Ogilvy', 'logilvy@devpress.com', 'Shimanovsk'),
--  (134, 'Freddie Capelen', 'fcapelen@biblegateway.com', 'Concepción del Bermejo'),
--  (135, 'Susana McClinton', 'smcclinton@economist.com', 'Muzi'),
--  (136, 'Roshelle Stevings', 'rstevings@php.net', 'Al Bawīţī'),
--  (137, 'Micki Mehew', 'mmehew@mail.ru', 'Palma De Mallorca'),
--  (138, 'Ida Buey', 'ibuey@npr.org', 'Barreira'),
--  (139, 'Sasha Danielsky', 'sdanielsky@ca.gov', 'Oakland'),
--  (140, 'Roxy Dundon', 'rdundon@unblog.fr', 'Itabuna'),
--  (141, 'David Yannoni', 'dyannoni@storify.com', 'Roberval'),
--  (142, 'Wylie Brownsworth', 'wbrownsworth@prnewswire.com', 'Dujuuma'),
--  (143, 'Donnie Bortolotti', 'dbortolotti@google.com.ru', 'Ituverava'),
--  (144, 'Cordelia McAnelly', 'cmcanelly@sohu.com', 'Sa Bot'),
--  (145, 'Gunilla Reeders', 'greeders@smugmug.com', 'Bombu'),
--  (146, 'Anette Teese', 'ateese@baidu.com', 'Insrom'),
--  (147, 'Tom MacPhee', 'tmacphee@myspace.com', 'Jianli'),
--  (148, 'Stanfield Rosenblum', 'srosenblum@opera.com', 'Rio Covo'),
--  (149, 'Renault Beckwith', 'rbeckwith@php.net', 'Manique de Baixo'),
--  (150, 'Jarad Hodgon', 'jhodgon@bing.com', 'Sumbersih'),
--  (151, 'Steffie Bemrose', 'sbemrose@engadget.com', 'Sayang Lauq'),
--  (152, 'Freeman Budgett', 'fbudgett@shoppro.jp', 'La Labor'),
--  (153, 'Arie Dunstall', 'adunstall@fda.gov', 'Changning'),
--  (154, 'Keslie Haseldine', 'khaseldine@theatlantic.com', 'Nowy Korczyn'),
--  (155, 'Maudie Buist', 'mbuist@edublogs.org', 'Huangling'),
--  (156, 'Eolanda Mouan', 'emouan@noaa.gov', 'Jermuk'),
--  (157, 'Francisca Paullin', 'fpaullin@shareasale.com', 'Aisai'),
--  (158, 'Jeremie Stiddard', 'jstiddard@mashable.com', 'Krivodanovka'),
--  (159, 'Rickie Sehorsch', 'rsehorsch@bloglines.com', 'Al ‘Azīzīyah'),
--  (160, 'Misha Kindred', 'mkindred@etsy.com', 'Bunigeulis'),
--  (161, 'Rosamund Pabelik', 'rpabelik@barnesandnoble.com', 'Baishan'),
--  (162, 'Letizia Dumphrey', 'ldumphrey@bloomberg.com', 'Ninh Hòa'),
--  (163, 'Philly Heugle', 'pheugle@fotki.com', 'Nyköping'),
--  (164, 'Ewen Kilban', 'ekilban@seesaa.net', 'Itaguaçu'),
--  (165, 'Olympia Rouzet', 'orouzet@opensource.org', 'Selmes'),
--  (166, 'Abigail Vinten', 'avinten@accuweather.com', 'Chattanooga'),
--  (167, 'Malinda Westmancoat', 'mwestmancoat@cbsnews.com', 'Lengor'),
--  (168, 'Ambrosi Wheal', 'awheal@technorati.com', 'Lívingston'),
--  (169, 'Josh Grossier', 'jgrossier@themeforest.net', 'Shuangqiao'),
--  (170, 'Laurent Vanezis', 'lvanezis@newyorker.com', 'Aseri'),
--  (171, 'Benyamin Kenewell', 'bkenewell@hao123.com', 'Xubao'),
--  (172, 'Mollie Pandean', 'mpandean@bigcartel.com', 'Pandean'),
--  (173, 'Jerrine Basilotta', 'jbasilotta@chron.com', 'Linglu'),
--  (174, 'Vivien Keyte', 'vkeyte@loc.gov', 'Grujugan'),
--  (175, 'Nanon Ambrozewicz', 'nambrozewicz@seesaa.net', 'Glencoe'),
--  (176, 'Yance Isgar', 'yisgar@tinyurl.com', 'Tianxin'),
--  (177, 'Caren Donet', 'cdonet@mail.ru', 'Pameče'),
--  (178, 'Emery Piesing', 'epiesing@goodreads.com', 'Soledad'),
--  (179, 'Tomaso Woolmington', 'twoolmington@behance.net', 'Stalís'),
--  (180, 'Laverna Stirtle', 'lstirtle@tumblr.com', 'Xianghua'),
--  (181, 'Benedicta Parke', 'bparke@oracle-java.com', 'Hendaye'),
--  (182, 'Frankie Deaves', 'fdeaves@myspace.com', 'Jilili'),
--  (183, 'Tonnie Curtiss', 'tcurtiss@google.co.jp', 'Is'),
--  (184, 'Mady Fibbit', 'mfibbit@techcrunch.com', 'Pryamitsyno'),
--  (185, 'Harland Babber', 'hbabber@163.com', 'Gložan'),
--  (186, 'Danna Wadley', 'dwadley@usatoday.com', 'Emiliano Zapata'),
--  (187, 'Kiersten Wabb', 'kwabb@wisc.edu', 'Anxiang'),
--  (188, 'Elfie Slegg', 'eslegg@alexa.com', 'Hermosa'),
--  (189, 'Giles Wraight', 'gwraight@wix.com', 'Manalad'),
--  (190, 'Lauretta Tomasian', 'ltomasian@usatoday.com', 'Sakule'),
--  (191, 'Janelle Sango', 'jsango@seattletimes.com', 'Glasnevin'),
--  (192, 'Gary McAree', 'gmcaree@slashdot.org', 'Pak Phli'),
--  (193, 'Theresa Ecles', 'tecles@yellowpages.com', 'Suci Kaler'),
--  (194, 'Herrick Deverick', 'hdeverick@merriam-webster.com', 'Hanlin'),
--  (195, 'Brietta Winham', 'bwinham@techin.fr', 'Bełżec'),
--  (196, 'Germayne Newrick', 'gnewrick@ebay.co.uk', 'Korisós'),
--  (197, 'Chris Simakov', 'csimakov@rediff.com', 'Vân Đình'),
--  (198, 'Freeland Dulling', 'fdulling@loc.gov', 'Chartres'),
--  (199, 'Nomi Bounds', 'nbounds@over-blog.com', 'Ferme-Neuve'),
--  (200, 'Wheeler Skipsey', 'wskipsey@media-hub.com', 'Brok');

-- INSERT INTO Employees (EmployeeID, EmployeeName, JobTitle, Department) VALUES
--  (1, 'Arjun Sharma', 'Senior Software Engineer', 'Engineering'),
--  (2, 'Priya Patel', 'Data Analyst', 'Analytics'),
--  (3, 'Amit Verma', 'Product Manager', 'Product'),
--  (4, 'Sarah Jenkins', 'UX Designer', 'Design'),
--  (5, 'Carlos Mendez', 'DevOps Specialist', 'Infrastructure'),
--  (6, 'Rohan Das', 'QA Automation Engineer', 'Engineering'),
--  (7, 'Emily Wong', 'HR Specialist', 'Human Resources'),
--  (8, 'Michael Chang', 'Sales Director', 'Sales'),
--  (9, 'Aaliyah Jackson', 'Customer Success Manager', 'Support'),
--  (10, 'David Miller', 'Database Administrator', 'Infrastructure'),
--  (11, 'Elena Rostova', 'Frontend Developer', 'Engineering'),
--  (12, 'Kwame Osei', 'Security Analyst', 'Infrastructure'),
--  (13, 'Chao Li', 'Marketing Manager', 'Marketing'),
--  (14, 'Fatima Al-Sayed', 'Financial Controller', 'Finance'),
--  (15, 'Marcus Vance', 'IT Support Technician', 'Support'),
--  (16, 'Deepika Rao', 'Technical Writer', 'Product'),
--  (17, 'Oliver Hansen', 'Account Executive', 'Sales'),
--  (18, 'Sofia Rossi', 'Content Strategist', 'Marketing'),
--  (19, 'Liam Gallagher', 'Systems Engineer', 'Infrastructure'),
--  (20, 'Ananya Nair', 'AI Research Scientist', 'Analytics');
--  
--  INSERT INTO Orders (OrderID, OrderDate, CustomerID, EmployeeID, TotalAmount) VALUES
--  (501, '2026-01-10', 105, 8, 1250.50),
--  (502, '2026-01-12', 142, 17, 450.00),
--  (503, '2026-01-15', 112, 8, 89.99),
--  (504, '2026-01-18', 188, 3, 2300.00),
--  (505, '2026-01-22', 101, 17, 15.75),
--  (506, '2026-02-01', 165, 8, 620.40),
--  (507, '2026-02-03', 130, 9, 120.00),
--  (508, '2026-02-07', 199, 15, 345.25),
--  (509, '2026-02-14', 124, 17, 999.99),
--  (510, '2026-02-18', 155, 3, 45.50),
--  (511, '2026-02-25', 102, 8, 1500.00),
--  (512, '2026-03-01', 176, 9, 210.10),
--  (513, '2026-03-04', 119, 15, 85.00),
--  (514, '2026-03-10', 143, 17, 1350.00),
--  (515, '2026-03-12', 189, 8, 320.00),
--  (516, '2026-03-19', 106, 3, 75.25),
--  (517, '2026-03-24', 152, 9, 640.80),
--  (518, '2026-03-28', 137, 17, 115.00),
--  (519, '2026-04-02', 181, 8, 2450.00),
--  (520, '2026-04-05', 122, 15, 55.00),
--  (521, '2026-04-12', 109, 3, 890.00),
--  (522, '2026-04-15', 170, 9, 12.50),
--  (523, '2026-04-20', 114, 17, 410.60),
--  (524, '2026-04-26', 195, 8, 180.00),
--  (525, '2026-05-01', 133, 15, 725.00),
--  (526, '2026-05-03', 158, 3, 95.40),
--  (527, '2026-05-09', 104, 9, 1100.00),
--  (528, '2026-05-14', 173, 17, 230.25),
--  (529, '2026-05-18', 127, 8, 65.00),
--  (530, '2026-05-22', 190, 15, 1420.00),
--  (531, '2026-06-01', 111, 3, 310.00),
--  (532, '2026-06-04', 147, 9, 88.50),
--  (533, '2026-06-09', 185, 17, 1950.00),
--  (534, '2026-06-15', 103, 8, 420.15),
--  (535, '2026-06-21', 162, 15, 75.00),
--  (536, '2026-06-25', 139, 3, 530.00),
--  (537, '2026-07-01', 177, 9, 1640.50),
--  (538, '2026-07-03', 120, 17, 28.00),
--  (539, '2026-07-06', 192, 8, 95.00),
--  (540, '2026-07-10', 150, 15, 810.30),
--  (541, '2026-07-11', 116, 3, 135.00),
--  (542, '2026-07-12', 168, 9, 2200.00),
--  (543, '2026-07-13', 108, 17, 415.00),
--  (544, '2026-07-14', 154, 8, 62.50),
--  (545, '2026-07-14', 182, 15, 1050.00),
--  (546, '2026-07-15', 125, 3, 190.00),
--  (547, '2026-07-15', 161, 9, 340.40),
--  (548, '2026-07-16', 113, 17, 72.00),
--  (549, '2026-07-16', 145, 8, 1280.00),
--  (550, '2026-07-17', 200, 15, 510.00);

 ALTER TABLE Orders DROP COLUMN TotalAmount;
 
--  DELIMITER $$
-- CREATE PROCEDURE GetCustomerSalesDashboard()
-- BEGIN
--     SELECT 
--         c.CustomerID,
--         c.CustomerName,
--         c.City,
--         COUNT(DISTINCT o.OrderID) AS Total_Orders_Placed,
--         sum(coalesce(od.Quantity,0)) AS Total_Items_Bought,
--         sum(coalesce(od.Quantity,0) * coalesce(od.UnitPrice,0.00)) AS Lifetime_Value
--     FROM Customers c
--     -- LEFT JOIN ensures customers with 0 orders still show up as $0.00
--     LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
--     LEFT JOIN OrderDetails od ON o.OrderID = od.OrderID
--     GROUP BY c.CustomerID, c.CustomerName, c.City
--     ORDER BY Lifetime_Value DESC;
-- END$$
-- DELIMITER ;