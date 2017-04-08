import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

#connect to postgres
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")

# error if no arguement is given
if len(sys.argv) != 2:
    print "Argument is missing"
    exit(1)

# one command line argument given
if len(sys.argv) == 2:

    word = sys.argv[1]
    k1,k2 = word.split(",")

    cur = conn.cursor()
    cur.execute("SELECT word, count from tweetwordcount where count > %s and count < %s order by count desc", (k1,k2))
    records = cur.fetchall()
    for rec in records:
       print "(" + rec[0] + ",", str(rec[1]) +")"
    conn.commit()
    conn.close()
    exit(1)

