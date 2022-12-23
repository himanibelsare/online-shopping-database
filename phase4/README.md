# DnA Final Project #
## Step 1: Prerequisites

**Connecting to a Docker**

- We followed the instructions mentioned in the notion document and installed a docker. Commands used:

```
docker pull ubuntu/mysql
```

- Then started a container to mysql.

```
docker run --name=<container_name> -p 30306:3306 -e MYSQL_ROOT_PASSWORD=<password> --restart on-failure -d ubuntu/mysql
```

- Then we connected our database in our python code via:

```
pymysql.connect()
```


## Step 2: Creating and Populating Tables

- We created all the tables mentioned our phase3.pdf via mysql installed via docker.
- We also made sure to keep track of all the foreign key, primary key, and unique key constrains among other significant details.
- sample code:

```
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);
```

- then we populated the tables using the insert command:
 ```
 INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
 ```

## Step 3: Making a __ for the python file
- We made a main structure for our python code which takes input from the user for the operations that they wish to perform
- options are like: 

```
while(1):
        tmp = sp.call('clear', shell=True)
        # Here taking example of Employee Mini-world
        print("1. Add an Account")  # add an entry to the user table
        print("2. Place an Order")  # add an entry to the order table
        .
        .
        .
        print("14. Check Database Information")  # add an entry to the order table
        print("15. Exit")
        ch = int(input("Enter choice: "))
        tmp = sp.call('clear', shell=True)
        if ch == 15:
            exit()
        else:
            dispatch(ch)
            tmp = input("Press enter to Continue")
```

- there are more options for other select queries



## Step 4: Defining all the respective functions

- In this step we defined all the functions that carried out the above queries. There are 29 total such functions.

- Few function calls:
```
def dispatchInfo(ch):
    """
    Function that maps helper functions to option entered
    """
    if(ch == 1):
        orderDelivery()
    elif(ch == 2):
        warehouseLocation()
    .
    .
    .
    elif(ch == 14):
        couponCodesAboveAvg()
    elif(ch == 15):
        citiesWithMaxOrders()
    else:
        print("Invalid Option, Choose Again:")
        time.sleep(1)
```

- An example of a function definition is:
```

def SignUp():
    #address = city only
    try:
        # Takes emplyee details as input
        row = {}
        row["email"] = (input("email: "))
        row["username"] = input("username: ")
        row["phonenumber"] = int(input("phonenumber: "))
        row["city"] = input("city: ")

        query = "INSERT INTO user(emailAddress, username, phoneNumber, address) VALUES('%s', '%s', '%d', '%s')" % (
            row["email"], row["username"], row["phonenumber"], row["city"])

        print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to insert into database :(")
        print("Error:", e)
    return
```

- similar structure was implemented for functions requiring update, delete, and select queires


## Step 5: Finally, everything was working!

- Or atleast when we tried running it ourselves :P
-   Here is the link to the video:

``` 
https://iiitaphyd-my.sharepoint.com/:v:/g/personal/shashwat_dash_students_iiit_ac_in/EdW0StLkB-VDrsAdBXEh2usBfCp8EE04S6fJvzxnolq6yA?e=mhL0wf
```