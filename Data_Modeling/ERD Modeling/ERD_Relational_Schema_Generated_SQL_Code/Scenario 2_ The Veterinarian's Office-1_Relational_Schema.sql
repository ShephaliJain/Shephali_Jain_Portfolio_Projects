CREATE TABLE OWNER
(
  OwnerFName INT NOT NULL,
  OwnerLName INT NOT NULL,
  OwnerID INT NOT NULL,
  Address_Line_1 INT NOT NULL,
  Address_Line_2 INT NOT NULL,
  ZipCode INT NOT NULL,
  Landmark INT NOT NULL,
  OwnerSSN INT NOT NULL,
  BillAmt INT NOT NULL,
  PaymentMode INT NOT NULL,
  PRIMARY KEY (OwnerID),
  UNIQUE (OwnerSSN)
);

CREATE TABLE VET
(
  VetID INT NOT NULL,
  VetFName INT NOT NULL,
  VLName INT NOT NULL,
  Specialization INT NOT NULL,
  PRIMARY KEY (VetID)
);

CREATE TABLE OWNER_Owner_Phone
(
  Owner_Phone INT NOT NULL,
  OwnerID INT NOT NULL,
  PRIMARY KEY (Owner_Phone, OwnerID),
  FOREIGN KEY (OwnerID) REFERENCES OWNER(OwnerID)
);

CREATE TABLE VET_Vet.ContactNo
(
  Vet.ContactNo INT NOT NULL,
  VetID INT NOT NULL,
  PRIMARY KEY (Vet.ContactNo, VetID),
  FOREIGN KEY (VetID) REFERENCES VET(VetID)
);

CREATE TABLE PATIENT
(
  PateintName INT NOT NULL,
  PatientBreed INT NOT NULL,
  PatientDoB INT NOT NULL,
  PatientType INT NOT NULL,
  PatientID INT NOT NULL,
  InsuranceID INT NOT NULL,
  Allergies INT,
  VetID INT NOT NULL,
  OwnerID INT NOT NULL,
  PRIMARY KEY (PatientID),
  FOREIGN KEY (VetID) REFERENCES VET(VetID),
  FOREIGN KEY (OwnerID) REFERENCES OWNER(OwnerID)
);