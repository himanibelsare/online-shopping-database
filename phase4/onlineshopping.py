import subprocess as sp
import pymysql
import pymysql.cursors
import time
from prettytable import PrettyTable

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

def placeAnOrder():
    try:
        # Takes emplyee details as input
        orderID = int((input("orderID: ")))
        orderStatus= input("orderStatus: ")
        orderCost= int(input("orderCost: "))
        orderDate = input("orderDate as (YYYY-MM-DD): ")
        estimatedArrival = input("estimatedArrival as (YYYY-MM-DD): ")
        userWhoOrdered = input("userWhoOrdered: ")
        couponCode = input("coupon code, enter NA if not used:");

        if couponCode == "NA":
            query = (f"INSERT INTO orders(orderID, orderStatus, orderCost, orderDate, estimatedArrival, userWhoOrdered) VALUES ({orderID}, '{orderStatus}', {orderCost}, '{orderDate}', '{estimatedArrival}', '{userWhoOrdered}')")
        else:
            query = (f"INSERT INTO orders(orderID, orderStatus, orderCost, orderDate, estimatedArrival, userWhoOrdered, couponUsed) VALUES ({orderID}, '{orderStatus}', {orderCost}, '{orderDate}', '{estimatedArrival}', '{userWhoOrdered}', '{couponCode}')")

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

def newSeller():
    try:
        # Takes emplyee details as input
        sellerID = int((input("sellerID: ")))
        sellerName= input("sellerName: ")
        gstnumber= int(input("gstnumber: "))

        query = (f"INSERT INTO seller(sellerID, sellerName, GSTNO) VALUES ({sellerID}, '{sellerName}', {gstnumber})")

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

def newProducts():
    try:
        # Takes emplyee details as input
        productID = int((input("productID: ")))
        productName= input("productName: ")
        productStock= int(input("productStock: "))
        productCost= int(input("productCost: "))
        productRating= float(input("productRating: "))
        comboPackID= input("comboPackID: ")

        if comboPackID == "NA":
            query = (f"INSERT INTO product(productID, productName, productStock, productCost, productRating) VALUES ({productID}, '{productName}', {productStock}, {productCost}, {productRating})")
        else:
            query = (f"INSERT INTO product(productID, productName, productStock, productCost, productRating, comboPackID) VALUES ({productID}, '{productName}', {productStock}, {productCost}, {productRating}, '{comboPackID}')")

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

def writeReview():
    try:
        # Takes emplyee details as input
        newemail = (input("email: "))
        productID= int(input("productID: "))
        ratings= float(input("ratings: "))
       
        query = (f"INSERT INTO review(emailAddress, productID, ratings) VALUES ('{newemail}', {productID}, {ratings})")

        print(query)
        cur.execute(query)
        con.commit()

        # change total product review after this too

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to insert into database :(")
        print("Error:", e)
    return

def askReturn():
    try:
        # Takes emplyee details as input
        orderID = int(input("orderID: "))
        productsReturned= (input("productsReturned: "))
        returnStatus= (input("returnStatus: "))
        address= (input("address (city): "))
        returnDate= (input("returnDate: "))
       
        query = (f"INSERT INTO returns(orderID, productsReturned, returnStatus, address, returnDate) VALUES ({orderID}, '{productsReturned}', '{returnStatus}', '{address}', '{returnDate}')")

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
    
def updatePersonalInformation():
    try:
        # Takes emplyee details as input
        username = input("username: ")
        phoneNumber = int(input("phoneNumber: "))
       
        query = (f"UPDATE user SET phoneNumber = {phoneNumber} WHERE username = '{username}'")

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to update database :(")
        print("Error:", e)

    return

def updateProductStock():
    try:
        # Takes emplyee details as input
        productID = input("productID: ")
        newStock = int(input("newStock: "))
       
        query = (f"UPDATE product SET productStock = {newStock} WHERE productID = {productID}")

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to update database :(")
        print("Error:", e)

    return

def updateWarehouseInfo():
    try:
        # Takes emplyee details as input
        warehouseID = int(input("warehouseID: "))
        securityGuard = (input("securityGuard: "))
       
        query = (f"UPDATE warehouse SET securityGuard = '{securityGuard}' WHERE warehouseID = {warehouseID}")

        print(query)
        cur.execute(query)
        con.commit()

        print("Updated Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to update database :(")
        print("Error:", e)

    return

def deleteAccount():
    try:
        username = (input("username: "))
       
        query = (f"DELETE FROM user WHERE username = '{username}'")
        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to delete from database :(")
        print("Error:", e)

    return

def deleteReview():
    try:
        emailAddress = (input("emailAddress: "))
       
        query = (f"DELETE FROM review WHERE emailAddress = '{emailAddress}'")
        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to delete from database :(")
        print("Error:", e)
    return

def deleteOrder():
    try:
        orderID = (input("orderID: "))
       
        query = (f"DELETE FROM orders WHERE orderID = {orderID}")
        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to delete from database :(")
        print("Error:", e)
    return


def deleteCouponCode():
    try:
        cur.execute("select CURDATE()")
        result = cur.fetchall()

        for row in result:
            for col in row:
                currdate = row[col]

        query = (f"DELETE FROM coupon_code WHERE expiryDate <= '{currdate}'")
        print(query)
        cur.execute(query)
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print()
        print("Failed to delete from database :(")
        print("Error:", e)

    return

def orderDelivery():
    try:
        no = int(input("orderId: "))
        q = (f"select * from orders where orderID = {no}")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['orderID', 'orderStatus', 'orderCost', 'orderDate', 'estimatedArrival', 'userWhoOrdered', 'couponUsed'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
        print(t)
    except Exception as e:
        print("> ",e)


def warehouseLocation():
    try:
        loc = input("location: ")
        q = (f"select * from warehouse where location = '{loc}'")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['warehouse0ID', 'securityGuard', 'location'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)
    except Exception as e:
        print("> ",e)

def productCostMoreThanX():
    try:
        cost = int(input("cost: "))
        q = (f"select * from product where productCost > {cost}")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['productID', 'productName', 'productStock', 'productCost', 'productRating', 'comboPackID'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)
    except Exception as e:
        print("> ",e)    

def userNoPaymentMethod():
    try:
        q = (f"select user.* from user, payment_method where user.username = payment_method.username and isDefaultMethod is NULL")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['emailAddress', 'username', 'phoneNumber', 'address'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def productCostWithinARange():
    try:
        low = int(input("lower range: "))
        high = int(input("higher range: "))
        q = (f"select productName from product where productCost <= {high} and productCost >= {low}")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['productName'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def userWithAPaymentMethod():
    try:
        pay = input("payment method: ")
        q = (f"select username, isDefaultMethod from payment_method where isDefaultMethod = '{pay}'")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['username','paymentMethod'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def productWith5star():
    try:
        q = (f"select productName from product where productRating = 5")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['productName'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def productWithACategory():
    try:
        category = input("category: ")
        q = (f"select productName from product, product_category where product.productID = product_category.productID and productCategory = '{category}'")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['productName'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def productRatingslike2():
    try:
        q = (f"select productID, productRating from product where productRating like '2%'")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['productID', 'productRating'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  


def sellerNameLikeX():
    try:
        ch = input("Enter character: ")
        q = (f"select sellerName from seller where sellerName like 'r%'")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['sellerName'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def ordersFromAParticularCity():
    try:
        city = input("City: ")
        q = (f"select orderID, Address from orders, user where userWhoOrdered = username and Address = '{city}'")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['orderID', 'City'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def orderCostofADay():
    try:
        date = input("Date: ")
        q = (f"select SUM(orderCost) as TotalCost from orders where orderDate = '{date}'")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['Total Cost'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def productWithMaxRating():
    try:
    
        q = (f"select productName from product where productRating in (select MAX(productRating) from product)")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['Product'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def couponCodesAboveAvg():
    try:
        q = (f"select orderID, name, discountPercent from orders, coupon_code where couponUsed = name and discountPercent > ALL (select AVG(discountPercent) from coupon_code)")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['orderID', 'Coupon Name', 'Discount Percent'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  


def citiesWithMaxOrders():
    try:
        date = input("Date: ")
        q = (f"""select Address, count(orderID), orderDate from user, orders where username = userWhoOrdered and orderDate = '{date}' group by Address having count(orderID) >= ALL(select count(orderID) from user,orders where 
        orderDate = '{date}' and username = userWhoOrdered group by Address)""")
        cur.execute(q)  
        result = cur.fetchall()
        t = PrettyTable(['Address', 'Total', 'Date'])

        for row in result:
            value = []
            for col in row:
                value.append(row[col])
            t.add_row(value)
            
        print(t)

    except Exception as e:
        print('> ', e)  

def databaseInformation():
    # Here taking example of Employee Mini-world
    print("1. List all details of your order")  # add an entry to the user table
    print("2. List all details of warehouses at a particular location")  # add an entry to the order table
    print("3. List all details of products with cost greater than X rupees")  # add an entry to the order table
    print("4. List all details of users with no saved payment Method")  # add an entry to the order table
    print("5. List all productNames with cost within a certain range")  # add an entry to the order table
    print("6. List all userIDs with a particular payment method")  # add an entry to the return table
    print("7. List all productNames with 5 star ratings")  # add an entry to the order table
    print("8. List all productNames belonging to a particular category") 
    print("9. List all productIDs with ratings starting from 2") 
    print("10. List all sellers whose names begin with a particular character")  # add an entry to the order table
    print("11. List all orders from a particular city") 
    print("12. Return the total amount of orderCost placed on a particular day") 
    print("13. Return the product with the maximum rating") 
    print("14. Return all orders using couponCodes with above average discount amounts")  # add an entry to the order table
    print("15. Return all cities having maximum number of orders placed on a particular day")
    ch = int(input("Enter choice: "))
    dispatchInfo(ch)
    tmp = input("Press enter to continue:")

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """
    if(ch == 1):
        SignUp()
    elif(ch == 2):
        placeAnOrder()
    elif(ch == 3):
        newSeller()
    elif(ch == 4):
        newProducts()
    elif(ch == 5):
        writeReview()
    elif(ch == 6):
        askReturn()
    elif(ch == 7):
        updatePersonalInformation()
    elif(ch == 8):
        updateProductStock()
    elif(ch == 9):
        updateWarehouseInfo()
    elif(ch == 10):
        deleteAccount()
    elif(ch == 11):
        deleteReview()
    elif(ch == 12):
        deleteOrder()
    elif(ch == 13):
        deleteCouponCode()
    elif(ch == 14):
        databaseInformation()
    else:
        print("Invalid Option, Choose Again:")
        time.sleep(1)
    

def dispatchInfo(ch):
    """
    Function that maps helper functions to option entered
    """
    if(ch == 1):
        orderDelivery()
    elif(ch == 2):
        warehouseLocation()
    elif(ch == 3):
        productCostMoreThanX()
    elif(ch == 4):
        userNoPaymentMethod()
    elif(ch == 5):
        productCostWithinARange()
    elif(ch == 6):
        userWithAPaymentMethod()
    elif(ch == 7):
        productWith5star()
    elif(ch == 8):
        productWithACategory()
    elif(ch == 9):
        productRatingslike2()
    elif(ch == 10):
        sellerNameLikeX()
    elif(ch == 11):
        ordersFromAParticularCity()
    elif(ch == 12):
        orderCostofADay()
    elif(ch == 13):
        productWithMaxRating()
    elif(ch == 14):
        couponCodesAboveAvg()
    elif(ch == 15):
        citiesWithMaxOrders()
    else:
        print("Invalid Option, Choose Again:")
        time.sleep(1)

# Global
# username = input("Username: ")
# password = input("Password: ")
while(1):
    tmp = sp.call('clear', shell=True)
    
    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 

        con = pymysql.connect(host='localhost',
                                port=30306,
                                user="root",
                                password="roop2003",
                                db='ONLINE_SHOPPING',
                                cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Press enter to Continue")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Add an Account")  # add an entry to the user table
                print("2. Place an Order")  # add an entry to the order table
                print("3. Apply as a seller")  # add an entry to the order table
                print("4. Add Products")  # add an entry to the order table
                print("5. Write a Review")  # add an entry to the order table
                print("6. Ask for a Return")  # add an entry to the return table
                print("7. Update Phone Number")  # add an entry to the order table
                print("8. Update Product Stock") 
                print("9. Update Warehouse Information") 
                print("10. Delete an Account")  # add an entry to the order table
                print("11. Delete Review") 
                print("12. Delete Orders") 
                print("13. Delete all expired CouponCodes") 
                print("14. Check Database Information")  # add an entry to the order table
                print("15. Exit")
                ch = int(input("Enter choice: "))
                tmp = sp.call('clear', shell=True)
                if ch == 15:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Press enter to Continue")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Press enter to Continue")
