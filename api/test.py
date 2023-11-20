import requests
import json

url = 'http://127.0.0.1:5000/api/v1/bobur/add-apk'


data = {'title': "title", "subtitle": "subtitle", "link": "link"}


headers = {'Content-Type': 'application/json'}

response = requests.post(url, data=json.dumps(data), headers=headers)

print(response.json)
print(response.text)
