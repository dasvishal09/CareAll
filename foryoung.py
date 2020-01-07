#!/usr/bin/env python
# coding: utf-8

from sqlalchemy import *

#Class for Young User
class oldstatus:
    global engine
    engine = create_engine("mysql+mysqlconnector://root:@localhost/careall")
    
    def choice(self,userchoice):
        try:
            if userchoice > 0 and userchoice < 4:
                #Display All Available Elders
                if userchoice == 1:
                    old.available()
                #Send request to elder person
                if userchoice == 2:
                    eid1 = input('Enter ID of Elder Person')
                    old.sendreq(eid1)
                #View Review
                if userchoice == 3:
                    old.reviews()
            else:
                print('Invalid Choice')

        except Exception as e:
            print('Entered value is invalid')
    
    #Get young user data 
    def yuser(self,uemail):
        global yid, yname
        sqlq = "SELECT * FROM youngs WHERE y_email = %s"
        users = engine.execute(sqlq, uemail).fetchall()
        for user in users:
            yid = user.y_id
            yname = user.y_name

    #Views all available Elders
    def available(self):
        status = engine.execute("SELECT * FROM oldstatus").fetchall()
        print('{}\t|{}\t\t\t|{}\t|{}\t|{}'.format('ID', 'Name', 'Available', 'Funds', 'Email'))
        for result in status:
            print('{}\t|{}\t\t|{}\t\t|{}\t|{}'.format(result.e_id, result.e_name, result.available, result.e_funds,result.e_email))
 
    #Add requests to allotment 
    def sendreq(self,eid1):
        global eid, ename, funds, y_name, astatus
        reqs = engine.execute("SELECT * FROM oldstatus where e_id = {}".format(eid1)).fetchall()
        for x in reqs:
            eid = x.e_id
            ename = x.e_name
            funds = x.e_funds
        
        #Check allotment if exits where id given and status Accept
        st = "SELECT * FROM allotment where e_id = %s and a_status = %s"
        va = 'Accept'
        sqlc = engine.execute(st,eid1,va).fetchall()
        for x in sqlc: 
            y_name = x.y_name
            astatus = x.a_status
        if sqlc != '':
            sqli = "INSERT INTO allotment (y_id, y_name, e_id, e_name, a_funds) VALUES (%s,%s,%s,%s,%s)"
            val = (yid, yname, eid, ename, funds)
            reqs = engine.execute(sqli, val)
            print('Allocated {} to {} for Value of Rs.{}/-'.format(eid,ename,funds))
            engine.execute("UPDATE elders SET available = 'No' WHERE e_id = {}".format(eid))
        else:
            print('{} : {} already Alloted to {}'.format(eid,ename,y_name))
            pass

    def reviews(self):
        sqlv = "SELECT * FROM reviews WHERE review_to = %s"
        review = engine.execute(sqlv,yname)
        for x in review:
            print('Date: {}\nName: {}\nRating: {}\nContent: {}\n\n'.format(x.r_date,x.review_from,x.rating,x.content))
        
old = oldstatus()

#Choice 
uemail = str(input('Enter your Email:'))
old.yuser(uemail)
print('Welcome {}'.format(yname))
choices = ['1. Available Users','2. Request Users','3. Reviews']
for x in choices: print(x)
userchoice = int(input('Enter Choice No: '))
old.choice(userchoice)

