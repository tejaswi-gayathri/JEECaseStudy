SQL> create table employeedts(employeeId varchar2(20),password varchar2(20) not null, constraints employeedts_pk primary key(employeeId));

Table created.

SQL> desc employeedts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEEID                                NOT NULL VARCHAR2(20)
 PASSWORD                                  NOT NULL VARCHAR2(20)

SQL> create table automobilecompanydts(carRegNumber varchar2(15),customerName varchar2(50) not null,phoneNumber number not null,emailId varchar2(40) not null,constraint automobiledts_pk primary key(carRegNumber));

Table created.

SQL> desc automobilecompanydts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                              NOT NULL VARCHAR2(15)
 CUSTOMERNAME                              NOT NULL VARCHAR2(50)
 PHONENUMBER                               NOT NULL NUMBER
 EMAILID                                   NOT NULL VARCHAR2(40)


SQL> create table addressdts(carRegNumber varchar2(15),addressLane1 varchar2(50)not null,addressLane2 varchar2(50),city varchar2(50) not null,pincode number not null,constraint addressdts_fk foreign key(carRegNumber) references automobilecompanydts(carRegNumber));

Table created.

SQL> desc addressdts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                                       VARCHAR2(15)
 ADDRESSLANE1                              NOT NULL VARCHAR2(50)
 ADDRESSLANE2                                       VARCHAR2(50)
 CITY                                      NOT NULL VARCHAR2(50)
 PINCODE                                   NOT NULL NUMBER

SQL> select constraint_name,constraint_type from user_constraints where table_name='ADDRESSDTS';

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
SYS_C0094827                   C                                                
SYS_C0094828                   C                                                
SYS_C0094829                   C                                                
ADDRESSDTS_FK                  R                                                

SQL> insert into employeedts (employeeId,password) values('chandler','chandler');

1 row created.

SQL> insert into employeedts (employeeId,password) values('sheldon','sheldon');

1 row created.

SQL> insert into employeedts (employeeId,password) values('ross','ross123');

1 row created.

SQL> insert into employeedts (employeeId,password) values('monica','monica');

1 row created.

SQL> select * from employeedts;

EMPLOYEEID           PASSWORD                                                   
-------------------- --------------------                                       
chandler             chandler                                                   
sheldon              sheldon                                                    
ross                 ross123                                                    
monica               monica                                                     

SQL> commit;

Commit complete.

SQL> select password from employeedts where employeeId='chandler';

PASSWORD                                                                        
--------------------                                                            
chandler                                                                        

SQL> select * from employeedts;

EMPLOYEEID           PASSWORD                                                   
-------------------- --------------------                                       
chandler             chandler                                                   
sheldon              sheldon                                                    
ross                 ross123                                                    
monica               monica                                                     
gayathri             gayathri                                                   

SQL> desc employeedts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 EMPLOYEEID                                NOT NULL VARCHAR2(20)
 PASSWORD                                  NOT NULL VARCHAR2(20)

SQL> select constraint_name,constraint_type from user_constraints where table_name='EMPLOYEEDTS';

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
SYS_C0094772                   C                                                
EMPLOYEEDTS_PK                 P                                                

SQL> create table cardts(carRegNumber varchar2(15),carName varchar2(30) not null,carModel varchar2(20) not null,insuranceId varchar2(20) not null,constraint cardts_fk foreign key(carRegNumber) references automobilecompanydts(carRegNumber));

Table created.

SQL> desc cardts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                                       VARCHAR2(15)
 CARNAME                                   NOT NULL VARCHAR2(30)
 CARMODEL                                  NOT NULL VARCHAR2(20)
 INSURANCEID                               NOT NULL VARCHAR2(20)

SQL> select constraint_name,constraint_type from user_constraints where table_name='CARDTS';

CONSTRAINT_NAME                C                                                
------------------------------ -                                                
SYS_C0094914                   C                                                
SYS_C0094915                   C                                                
SYS_C0094916                   C                                                
CARDTS_FK                      R                                                

SQL> spool out;

SQL> create table servicedts(carRegNumber varchar2(15),dateOfService varchar2(30),service varchar2(40),serviceAmount number(8,2));

Table created.

SQL> commit;

Commit complete.

SQL> select * from servicedts;

CARREGNUMBER    DATEOFSERVICE                                                   
--------------- ------------------------------                                  
SERVICE                                  SERVICEAMOUNT                          
---------------------------------------- -------------                          
KA156           27/18/2018                                                      
WheelBalancing                                    2000                          
                                                                                
KA156           27/18/2018                                                      
Polishing                                         2500                          
                                                                                
SQL> create table amountHistdts(carRegNumber varchar2(15),dateOfService varchar2(30),insuranceAmount number(8,2),grandTotal number(8,2));

Table created.

SQL> select * from servicedts;

CARREGNUMBER    DATEOFSERVICE                                                   
--------------- ------------------------------                                  
SERVICE                                  SERVICEAMOUNT                          
---------------------------------------- -------------                          
KA156           27/18/2018                                                      
WheelBalancing                                    2000                          
                                                                                
KA156           27/18/2018                                                      
Polishing                                         2500                          
                                                                                
KA156           18/10/2018                                                      
Polishing                                         2500                          
                                                                                

CARREGNUMBER    DATEOFSERVICE                                                   
--------------- ------------------------------                                  
SERVICE                                  SERVICEAMOUNT                          
---------------------------------------- -------------                          
KA156           18/10/2018                                                      
SuspensionSystems                                 3000                          
                                                                                

SQL> desc amountHistdts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                                       VARCHAR2(15)
 DATEOFSERVICE                                      VARCHAR2(30)
 INSURANCEAMOUNT                                    NUMBER(8,2)
 GRANDTOTAL                                         NUMBER(8,2)

SQL> select * from amountHistdts;

CARREGNUMBER    DATEOFSERVICE                  INSURANCEAMOUNT GRANDTOTAL       
--------------- ------------------------------ --------------- ----------       
KA156           18/10/2018                                3000       5500       

SQL> delete from amountHistdts where insuranceAmount=3000;

1 row deleted.

SQL> select * from amountHistdts;

no rows selected

SQL> commit;

Commit complete.

SQL> select * from amountHistdts;

CARREGNUMBER    DATEOFSERVICE                  INSURANCEAMOUNT GRANDTOTAL       
--------------- ------------------------------ --------------- ----------       
KA156           18/10/2018                                3000       1500       

SQL> select * from automobilecompanydts;

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
DL012345        prabhu                                                99876543  
prabhu@yahoo.com                                                                
                                                                                
AP051234        qwerty                                                  991234  
qwerty@gmail.com                                                                
                                                                                
KA156           Ramya                                               9448108464  
rammiu96@gmail.com                                                              
                                                                                

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
AP312345        gayathri                                              88912345  
dts@yahoo.com                                                                   
                                                                                
TS051234        sai                                                   86005123  
sai@gmail.com                                                                   


SQL> desc servicedts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                                       VARCHAR2(15)
 DATEOFSERVICE                                      VARCHAR2(30)
 SERVICE                                            VARCHAR2(40)
 SERVICEAMOUNT                                      NUMBER(8,2)

SQL> commit;

Commit complete.

SQL> select * from automobilecompanydts;

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
DL012345        prabhu                                                99876543  
prabhu@yahoo.com                                                                
                                                                                
AP051234        qwerty                                                  991234  
qwerty@gmail.com                                                                
                                                                                
KA156           ganesh                                                    7890  
rammiu96@gmail.com                                                              
                                                                                

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
AP312345        gayathri                                              88912345  
dts@yahoo.com                                                                   
                                                                                
TS051234        sai                                                   86005123  
sai@gmail.com                                                                   
                                                                                

SQL> select * from cardts;

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
DL012345        santafe                        suv                              
PD123                                                                           
                                                                                
AP051234        xuv                            suv                              
pd234                                                                           
                                                                                
KA156           Benz                           SUV                              
ACC111                                                                          
                                                                                

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
AP312345        benz                           sedan                            
aw123                                                                           
                                                                                
TS051234        nissan                         suv                              
as123                                                                           
                                                                                

SQL> select * from cardts;

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
DL012345        santafe                        suv                              
PD123                                                                           
                                                                                
AP051234        xuv                            suv                              
pd234                                                                           
                                                                                
KA156           Benz                           SUV                              
ACC111                                                                          
                                                                                

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
HR9876          hterhtr                        Sedan                            
faew1                                                                           
                                                                                
AP312345        benz                           sedan                            
aw123                                                                           
                                                                                
TS051234        nissan                         suv                              
as123                                                                           
                                                                                

6 rows selected.

SQL> desc servicedts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                                       VARCHAR2(15)
 DATEOFSERVICE                                      VARCHAR2(30)
 SERVICE                                            VARCHAR2(40)
 SERVICEAMOUNT                                      NUMBER(8,2)

SQL> spool out;

SQL> create table insurancedts(insuranceId varchar2(20),carRegNumber varchar2(15) not null,insuranceAmount number(8,2) not null,constraint insurancedts_pk primary key(insuranceId));

Table created.

SQL> desc insurancedts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 INSURANCEID                               NOT NULL VARCHAR2(20)
 CARREGNUMBER                              NOT NULL VARCHAR2(15)
 INSURANCEAMOUNT                           NOT NULL NUMBER(8,2)

SQL> insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values("IS123","DL012345",4000.0);
insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values("IS123","DL012345",4000.0)
                                                                                  *
ERROR at line 1:
ORA-00984: column not allowed here 


SQL> insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values('IS123','DL012345',4000.0);

1 row created.

SQL> insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values('IS213','AP012345',2000.0);

1 row created.

SQL> insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values('IS213','AP012345',2000.0);
insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values('IS213','AP012345',2000.0)
*
ERROR at line 1:
ORA-00001: unique constraint (TRAINING.INSURANCEDTS_PK) violated 


SQL> select * from insurancedts;

INSURANCEID          CARREGNUMBER    INSURANCEAMOUNT                            
-------------------- --------------- ---------------                            
IS123                DL012345                   4000                            
IS213                AP012345                   2000                            

SQL> select insuranceAmount from insurancedts where carRegNumber='DL012345';

INSURANCEAMOUNT                                                                 
---------------                                                                 
           4000                                                                 

SQL> commit;

Commit complete.

SQL> desc cardts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                                       VARCHAR2(15)
 CARNAME                                   NOT NULL VARCHAR2(30)
 CARMODEL                                  NOT NULL VARCHAR2(20)
 INSURANCEID                               NOT NULL VARCHAR2(20)

SQL> create table serviceCostdts(carModel varchar2(20),service varchar2(40),serviceAmount number(8,2));

Table created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('SUV','WheelBalancing',5000);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('SUV','Polishing',5500);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('SUV','SuspensionSystems'6000);
insert into serviceCostdts(carModel,service,serviceAmount) values('SUV','SuspensionSystems'6000)
                                                                                    *
ERROR at line 1:
ORA-00917: missing comma 


SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('SUV','SuspensionSystems',7000);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('SUV','Decor',5500);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('SUV','ACCompressorReplacement',7000);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('Sedan','ACCompressorReplacement',7500);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('Sedan','Decor',5700);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('Sedan','SuspensionSystems',6000);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('Sedan','Polishing',6000);

1 row created.

SQL> insert into serviceCostdts(carModel,service,serviceAmount) values('Sedan','WheelBalancing',5000);

1 row created.

SQL> select * from serviceCostdts;

CARMODEL             SERVICE                                  SERVICEAMOUNT     
-------------------- ---------------------------------------- -------------     
SUV                  WheelBalancing                                    5000     
SUV                  Polishing                                         5500     
SUV                  SuspensionSystems                                 7000     
SUV                  Decor                                             5500     
SUV                  ACCompressorReplacement                           7000     
Sedan                ACCompressorReplacement                           7500     
Sedan                Decor                                             5700     
Sedan                SuspensionSystems                                 6000     
Sedan                Polishing                                         6000     
Sedan                WheelBalancing                                    5000     

10 rows selected.

SQL> commit;

Commit complete.

SQL> select * from automobilecompanydts;

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
DL012345        prabhu                                                99876543  
prabhu@yahoo.com                                                                
                                                                                
AP051234        qwerty                                                  991234  
qwerty@gmail.com                                                                
                                                                                
KA156           Ramya                                               9448108464  
rammiu96@gmail.com                                                              
                                                                                

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
AP312345        gayathri                                              88912345  
dts@yahoo.com                                                                   
                                                                                
TS051234        sai                                                   86005123  
sai@gmail.com                                                                   
                                                                                

SQL> select * from cardts;

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
DL012345        santafe                        suv                              
PD123                                                                           
                                                                                
AP051234        xuv                            suv                              
pd234                                                                           
                                                                                
KA156           Benz                           SUV                              
ACC111                                                                          
                                                                                

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
AP312345        benz                           sedan                            
aw123                                                                           
                                                                                
TS051234        nissan                         suv                              
as123                                                                           
                                                                                

SQL> insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values('SI113','PN012345',3000.0);

1 row created.

SQL> select * from insurancedts;

INSURANCEID          CARREGNUMBER    INSURANCEAMOUNT                            
-------------------- --------------- ---------------                            
IS123                DL012345                   4000                            
IS213                AP012345                   2000                            
SI113                PN012345                   3000                            

SQL> commit;

Commit complete.

SQL> select * from automobilecompanydts;

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
DL012345        prabhu                                                99876543  
prabhu@yahoo.com                                                                
                                                                                
AP051234        qwerty                                                  991234  
qwerty@gmail.com                                                                
                                                                                
KA156           Ramya                                               9448108464  
rammiu96@gmail.com                                                              
                                                                                

CARREGNUMBER    CUSTOMERNAME                                       PHONENUMBER  
--------------- -------------------------------------------------- -----------  
EMAILID                                                                         
----------------------------------------                                        
AP312345        gayathri                                              88912345  
dts@yahoo.com                                                                   
                                                                                
TS051234        sai                                                   86005123  
sai@gmail.com                                                                   
                                                                                

SQL> commit;

Commit complete.

SQL> select * from cardts;

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
DL012345        santafe                        suv                              
PD123                                                                           
                                                                                
AP051234        xuv                            suv                              
pd234                                                                           
                                                                                
KA156           Benz                           SUV                              
ACC111                                                                          
                                                                                

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
AP312345        benz                           sedan                            
aw123                                                                           
                                                                                
TS051234        nissan                         suv                              
as123                                                                           
                                                                                

SQL> insert into insurancedts(insuranceId,carRegNumber,insuranceAmount) values('UTI113','KA156',3000.0);

1 row created.

SQL> commit;

Commit complete.

SQL> select * from insurancedts;

INSURANCEID          CARREGNUMBER    INSURANCEAMOUNT                            
-------------------- --------------- ---------------                            
IS123                DL012345                   4000                            
IS213                AP012345                   2000                            
SI113                PN012345                   3000                            
UTI113               KA156                      3000                            

SQL> select * from cardts;

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
DL012345        santafe                        suv                              
PD123                                                                           
                                                                                
AP051234        xuv                            suv                              
pd234                                                                           
                                                                                
KA156           Benz                           SUV                              
ACC111                                                                          
                                                                                

CARREGNUMBER    CARNAME                        CARMODEL                         
--------------- ------------------------------ --------------------             
INSURANCEID                                                                     
--------------------                                                            
AP312345        benz                           sedan                            
aw123                                                                           
                                                                                
TS051234        nissan                         suv                              
as123                                                                           
                                                                                

SQL> select * from serviceCostdts;

CARMODEL             SERVICE                                  SERVICEAMOUNT     
-------------------- ---------------------------------------- -------------     
SUV                  WheelBalancing                                    2000     
SUV                  Polishing                                         2500     
SUV                  SuspensionSystems                                 3000     
SUV                  Decor                                             2500     
SUV                  ACCompressorReplacement                           4000     
Sedan                ACCompressorReplacement                           4500     
Sedan                Decor                                             2700     
Sedan                SuspensionSystems                                 4000     
Sedan                Polishing                                         3000     
Sedan                WheelBalancing                                    2000     

10 rows selected.

SQL> desc servicedts;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CARREGNUMBER                              NOT NULL VARCHAR2(15)
 SERVICE                                   NOT NULL VARCHAR2(40)
 SERVICEAMOUNT                             NOT NULL NUMBER(8,2)
 INSURANCECLAIM                            NOT NULL NUMBER(8,2)
 NETAMOUNT                                 NOT NULL NUMBER(8,2)
 DATEOFSERVICE                             NOT NULL DATE

SQL> commit;

Commit complete.

SQL> spool out;

