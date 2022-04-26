# **Entity Relationship Diagram, Relational Schema Development for Dimensional Modeling**

We use an Entity Relationship Diagram to represent the informational needs of a system. 
When we are convinced it is satisfactory, we map the Entity Relationship Diagram (ERD) to a relational database and implement it as a physical database. 
In general, relations are used to hold entity sets and to hold relationship sets.
![image](https://user-images.githubusercontent.com/76183189/165194867-70a771d8-1197-4b60-b157-f32d5bdb2d2c.png)

### **Mapping Rules**

To complete the mapping from an Entity Relationship Diagram (ERD) to relations, we must consider the entity types, relationship types, and attributes that are specified for the model.

#### **Entity Types**
There are 2 types of entities: 
- Strong entities: Strong, or regular, entity types are mapped to their own relation. The primary key (PK) is chosen from the set of keys available.
-  Weak Entities: Each regular entity must have at least one unique attribute. 
   A weak entity is a construct in an ER diagram used to depict entities that do not have a unique attribute of their own.
   A weak entity is represented by a double line depicting a frame of its rectangle.
   Within an ER diagram, each weak entity must be associated with its owner entity via an identifying relationship.
   This type of relationship is represented as a double-framed diamond.

- Relationship between two entities is shown as below:
![image](https://user-images.githubusercontent.com/76183189/165197475-93458d21-75e6-4307-8294-ad5497facd72.png)


### **Relationship Types**

The implementation of relationships involves foreign keys.
If the relationship is identifying, then the primary key of an entity type must be propagated to the relation for a weak entity type.
We must consider both the degree and the cardinality of the relationship. 
- One to one
- One to many
- Many to Many
- n-ary, n>2

![image](https://user-images.githubusercontent.com/76183189/165197126-04749c46-d8ca-45e5-a6ef-c4de898be2bc.png)
 
### **Cardinality**

Each cardinality constraint symbol is composed of two parts:

• Maximum cardinality—the part of the cardinality constraint symbol closer to the entity rectangle;

• Minimum cardinality (participation)—the part of the cardinality constraint symbol farther away from the entity
rectangle.

###  **Attribute types**
Except for derived and composite attributes, all attributes must appear in relations.
We choose to include derived attributes if their presence will improve the performance of the model.
Following image depicts the symbol used to represents different type of attributes:
- Simple, atomic attributes: These are simply used for many-to-many or n-ary relationships.
-  Multi-values attribute: Each multi-valued attribute is implemented using a new relation.
   This relation will include the primary key of the original entity type.
-   Derived/Composite Attribute: These are composed based on the existing attributes, such as Full_name comprises of first_name + last_name.
-   Optional (dashed circled): Most of the attributes in an entity will have a value for each entity instance, but some of the attributes may be allowed to not have a value.
-   Such an attribute is called an optional attribute. These are optional information added in the model such as secondary address for an employee is an optional field.
![image](https://user-images.githubusercontent.com/76183189/165195754-ced8d5a4-6002-4c69-a11d-971e2eff1bf9.png)
