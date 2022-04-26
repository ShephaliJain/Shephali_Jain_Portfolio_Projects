CREATE TABLE CUSTOMER
(
  Customer_ID INT NOT NULL,
  PRIMARY KEY (Customer_ID)
);

CREATE TABLE ORDER
(
  Order_ID INT NOT NULL,
  OrderDate INT NOT NULL,
  ShipDate INT NOT NULL,
  DeliveryDate INT NOT NULL,
  Customer_ID INT NOT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

CREATE TABLE PRODUCT
(
  Product_ID INT NOT NULL,
  PRIMARY KEY (Product_ID)
);

CREATE TABLE Contain
(
  Order_ID INT NOT NULL,
  Product_ID INT NOT NULL,
  PRIMARY KEY (Order_ID, Product_ID),
  FOREIGN KEY (Order_ID) REFERENCES ORDER(Order_ID),
  FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)
);