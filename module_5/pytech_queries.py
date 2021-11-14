from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.aigyk.mongodb.net/pytech?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
students = db.get_collection("students")

foundstudents = students.find({})
print("-- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")
for student in foundstudents :
    print(f"Student ID: {student['student_id']}")
    print(f"First Name: {student['first_name']}")
    print(f"Last Name: {student['last_name']}")
    print("")

print("-- DISPLAYING STUDENT DOCUMENT FROM find_one() QUERY --")
foundstudent = students.find_one({"student_id": "1007"})
print(f"Student ID: {foundstudent['student_id']}")
print(f"First Name: {foundstudent['first_name']}")
print(f"Last Name: {foundstudent['last_name']}")
