import psycopg2
from geopy.geocoders import Nominatim

geolocator = Nominatim(user_agent="lab9_ex1")

con = psycopg2.connect(database="dvdrental", user="postgres",
                       password="pass21", host="localhost", port="5432")

print("Database opened successfully")

cur = con.cursor()


loc = cur.callproc('address_retriever', ())
rows = cur.fetchall()

for row in rows:
    print(row[1], ") ", row[0])
    try:
        location = geolocator.geocode(row[0])
        print(location.latitude, " ", location.longitude)
    except:
        print("0, 0")

print("Function created successfully")

cur.close()
con.commit()
con.close()
