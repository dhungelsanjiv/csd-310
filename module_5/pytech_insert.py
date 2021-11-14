from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.aigyk.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
students = db.get_collection("students")


fred = {
   "student_id":"1007",
   "first_name":"Fred",
   "last_name":"Das"  
}

san={
   "student_id":"1008",
   "first_name":"San",
   "last_name":"Deo"
}

bin={
   "student_id":"1009",
   "first_name":"Bin",
   "last_name":"Deo"
}

fred_inserted_id = students.insert_one(fred).inserted_id
san_inserted_id = students.insert_one(san).inserted_id
bin_inserted_id = students.insert_one(bin).inserted_id