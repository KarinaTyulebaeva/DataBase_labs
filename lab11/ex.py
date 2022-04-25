from pymongo import MongoClient
from dateutil.parser import parse

client = MongoClient("mongodb://localhost")
db = client['someDB']
collection = db.get_collection('restaurants')

def output(arr):
    for el in arr:
        print(el)

def ex1_1():
    ans = collection.find({'cuisine': 'Indian'})
    output(ans)

def ex1_2():
    ans = collection.find({"$or": [{'cuisine': "Indian"}, {'cuisine': "Thai"}]})
    output(ans)

def ex1_3():
    for el in collection.find():
        addr = el['addr']
        if addr['building'] == "1115" and addr['street'] == "Rogers Avenue" and addr["zipcode"] == "11226":
            print(el)
def ex2():
    restaurant = {
        "address": {
            "building": "1480",
            "coord": [
                -73.9557413,
                40.7720266
            ],
            "street": "2 Avenue",
            "zipcode": "10075"
        },
        "borough": "Manhattan",
        "cuisine": "Italian",
        "grades": [
            {
                "date": {
                    "$date": parse("2014-10-01T00:00:00Z")
                },
                "grade": "A",
                "score": 11
            }
        ],
        "name": "Vella",
        "restaurant_id": "41704620"
    }
    collection.insert_one(restaurant)


def ex3_1():
    collection.delete_one({'borough' : 'Manhattan'})

def ex3_2():
    collection.delete_many({'cuisine' : 'Thai'})


def ex4():
    for el in collection.find():
        if el['address']['street'] == "Rogers Avenue":
            for grade in el['grades']:
                if grade['grade'] == 'C':
                    collection.delete_one(el)
                    break
                else:
                    el_grades = el['grades']
                    el_grades.append(
                        {
                            "date": {
                                "$date": parse("2022-04-25T00:00:00Z")
                            },
                            "grade": "C",
                            "score": 0
                        }
                    )
                    collection.update_one({'_id' : el['_id']}, {'$set' : {'grades' :  el_grades}})

