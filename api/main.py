from flask import Flask, request, jsonify

from db import _CreateDB, _AddDataToDB, _getApk, _deleteApkById

app = Flask(__name__)


###########################################################################################################################################


@app.route('/', methods=['GET'])
def index():
    list = [
        'get',
        'create-db',
        'add-apk',
        'delete-apk-with-row-id',
    ]
    return list

@app.route('/api/v1/bobur/get', methods=['GET'])
def main():
    return jsonify(_getApk())

@app.route('/api/v1/bobur/create-db', methods=['GET'])
def create_db_api():
    try:
        _CreateDB()
        return "True"
    except:
        pass

@app.route('/api/v1/bobur/add-apk', methods=['POST'])
def add_apk_api():
    if request.method == 'POST':
        data = request.get_json()
        title = data.get('title')
        subtitle = data.get('subtitle')
        link = data.get('link')
        try:
            _AddDataToDB(title, subtitle, link)
            return jsonify({'message': f'Title muvafaqiyatli saqlandi: {title}'})
        except:
            pass


@app.route('/api/v1/bobur/delete-apk-with-row-id', methods=['POST'])
def updatetask():
    if request.method == 'POST':
        data = request.get_json()
        rId = data.get('rId')
        try:
            _deleteApkById(rId)
            return jsonify({'message': f'Title muvfaqiyatli saqlandi: {rId}'})
        except: pass
    
###########################################################################################################################################
            
if __name__ == '__main__':
    app.run(debug=True)
