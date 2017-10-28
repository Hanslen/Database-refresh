import sys
import pandas as pd

# Read input from command
try:
    command = sys.argv[1]
    command = command.split(" ")
    select = 0
    insert = 0
    for x in xrange(0, len(command)):
        if command[x].upper() == "SELECT":
            select = 1
            attr = command[x + 1]
        elif command[x].upper() == "INSERT":
            insert = 1
            attr = command[x + 1]
        elif command[x].upper() == "FROM":
            source = command[x + 1]
        elif command[x].upper() == "INTO":
            source = command[x + 1]
            insertInfo = command[(x + 2):]
        elif command[x].upper() == "WHERE":
            match = [i for i in command[(x + 1)::] if i != 'AND']
    # Loading files
    if source == 'orders':
        result = pd.read_csv('orders.csv', delimiter=',', dtype=object)
    elif source == 'customers':
        result = pd.read_csv('customers.csv', delimiter=',', dtype=object)
    else:
        print "ERROR: FILE %s.csv DOES NOT EXIST" %(source)
        quit()

    # SELECT QUERY
    if select == 1:
        try:
            for m in match:
                m = m.split('=')
                m[1] = m[1].replace('_',' ')
                result = result[result[m[0]] == m[1]]
        except NameError:
            # match is not defined
            match = ""
        except:
            print "ERROR: The SELECT Command you type is not valid, check space and comma carefully!"
            print "If your input String has space, use '-' instead. :-)"
            quit()
        if attr == '*':
            print result
            quit()
        else:
            attr = attr.split(',')
            try:
                print result[attr]
            except:
                print "ERROR: Check the Column you want to select, and check space and comma carefully! "
    # INSERT QUERY
    elif insert == 1:
        insertInfo = ' '.join(insertInfo)
        insertInfo = insertInfo.split('(')[1].split(')')[0].split(',')
        try:
            result.loc[len(result)] = insertInfo
        except ValueError:
            print "ERROR: The INSERT Command you type is not valid, check the number of column and comma carefully!"
            quit()
        if source == 'orders':
            result.to_csv('orders.csv', index=False)
        elif source == 'customers':
            result.to_csv('customers.csv', index=False)
        print "Implementing INSERT Query successfully!"
except IndexError:
    print "Please input your VALID SELECT OR INSERT command as an argument"
    print "SELECT EXAMPLE: SELECT * FROM orders WHERE EmployeeID=5"
    print "Example: \"INSERT INTO orders (10000,Hanslen,1,2017/9/5 0:00,2017/10/5 0:00,2017/9/6 0:00,1,100,Jiahe Package,Columbia University,NYC,NY,10026,USA)\" "
    quit()