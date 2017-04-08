import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

#connect to postgres
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

# one command line argument given
if len(sys.argv) == 2:

    word = sys.argv[1]
    
    cur = conn.cursor()
    cur.execute("SELECT word, count from tweetwordcount where word = %s", (word,))
    records = cur.fetchall()
    for rec in records:
       print "Total number of occurrences of \"" + rec[0] + "\":", rec[1]
    conn.commit()
    conn.close()
    exit(1)
    
# no command line argument given
if len(sys.argv) == 1:
    cur = conn.cursor()

    cur.execute("SELECT word, count from tweetwordcount")
    records = cur.fetchall()
    for rec in records:
       print "(" + rec[0] + ",", str(rec[1]) +")"
    conn.commit()
    conn.close()
    exit(1)
