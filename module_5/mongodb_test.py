from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.aigyk.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
print("-- Pytech Collection List --")
print(db.list_collection_names())

