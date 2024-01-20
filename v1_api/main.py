from flask import Flask, request, jsonify
from db import SQLhelper
import json

app = Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    return {
        "STATUS": "ERROR No:1"
    }

@app.route("/v1/api/get-user", methods=['GET'])
def get_user():
    db = SQLhelper('baza.db')
    user = (db.get_user())[0]
    map = {
        "name": user[1],
        "surname": user[2],
        "img": user[3],
        "motto": user[4],
    }
    return map


@app.route("/v1/api/update-user", methods=['POST'])
def update_user():
    """
        {
            'code' : 'f1',
            'name' : 'Bobur'
            'surname' : 'Otaboyev'
            'img' : '1.png'
            'motto' : 'btw i use arch'
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            name = data.get('name')
            surname = data.get('surname')
            img = data.get('img')
            motto = data.get('motto')
            try:
                if name and surname and img and motto:
                    print(name, surname, img, motto)
                    db = SQLhelper('baza.db')
                    try:
                        db.update_user(name=name, surname=surname, img=img, motto=motto)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass


@app.route("/v1/api/get-project", methods=['GET'])
def get_project():
    db = SQLhelper('baza.db')
    user = db.get_projects()
    a = '[{"aaa":"bajs"}]'
    # a = user[0][4]
    b = json.loads(a)
    print(type(b))
    return user


@app.route("/v1/api/add-project", methods=['POST'])
def add_project():
    """
        {
            'code' : 'f1',
            'title' : 'title, subtitle, skills' 
            'subtitle' : 'Otaboyev'
            'skills' : '1.png'
            'links' : '[
                {
                    ...
                }
            ]'
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            title = data.get('title')
            subtitle = data.get('subtitle')
            skills = data.get('skills')
            links = data.get('links')
            try:
                if title and subtitle and skills and links:
                    print(title, subtitle, skills, links)
                    db = SQLhelper('baza.db')
                    try:
                        db.add_project(title, subtitle, skills, links)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass


@app.route("/v1/api/update-project", methods=['POST'])
def update_project():
    """
        {
            'code' : 'f1',
            'title' : 'title, subtitle, skills' 
            'subtitle' : 'Otaboyev'
            'skills' : '1.png'
            'links' : '[
                {
                    ...
                }
            ]'
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            pId = str(data.get('id'))
            title = data.get('title')
            subtitle = data.get('subtitle')
            skills = data.get('skills')
            links = data.get('links')
            try:
                if pId.isdigit() and title and subtitle and skills and links:
                    db = SQLhelper('baza.db')
                    try:
                        db.update_project(int(pId), title, subtitle, skills, links)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass


@app.route("/v1/api/get-skills", methods=['GET'])
def get_skills():
    db = SQLhelper('baza.db')
    skills = db.get_skills()
    return skills


@app.route("/v1/api/add-skills", methods=['POST'])
def add_skills():
    """
        {
            'code' : 'f1',
            'name' : 'flutter' 
            'num' : '70'
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            name = data.get('name')
            num = str(data.get('num'))
            try:
                if name and num.isdigit():
                    db = SQLhelper('baza.db')
                    try:
                        db.add_skill(name, num)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass


@app.route("/v1/api/update-skills", methods=['POST'])
def update_skills():
    """
        {
            'code' : 'f1',
            'id' : 'int' 
            'name' : 'aasdfds'
            'num' : 'int'
            
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            sId = str(data.get('id'))
            name = data.get('name')
            num = str(data.get('num'))
            try:
                if sId.isdigit() and name and num.isdigit():
                    db = SQLhelper('baza.db')
                    try:
                        db.update_skills(int(sId), name, num)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass


@app.route("/v1/api/get-simple-skills", methods=['GET'])
def get_sim_skills():
    db = SQLhelper('baza.db')
    skills = db.get_sim_skills()
    return skills


@app.route("/v1/api/add-simple-skills", methods=['POST'])
def add_sim_skills():
    """
        {
            'code' : 'f1',
            'name' : 'flutter' 
            'link' : 'str'
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            name = data.get('name')
            link = data.get('link')
            try:
                if name and link:
                    db = SQLhelper('baza.db')
                    try:
                        db.add_sim_skill(name, link)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass


@app.route("/v1/api/update-simple-skills", methods=['POST'])
def update_sim_skills():
    """
        {
            'code' : 'f1',
            'id' : 'int' 
            'name' : 'aasdfds'
            'link' : 'str'
            
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            sId = str(data.get('id'))
            name = data.get('name')
            link = data.get('link')
            try:
                if sId.isdigit() and name and link:
                    db = SQLhelper('baza.db')
                    try:
                        db.update_sim_skills(int(sId), name, link)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass

@app.route("/v1/api/get-contact", methods=['GET'])
def get_contact():
    db = SQLhelper('baza.db')
    skills = db.get_contact()
    return skills


@app.route("/v1/api/add-contact", methods=['POST'])
def add_contact():
    """
        {
            'code' : 'f1',
            'img' : 'flutter' 
            'link' : 'str'
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            name = data.get('img')
            link = data.get('link')
            try:
                if name and link:
                    db = SQLhelper('baza.db')
                    try:
                        db.add_contact(name, link)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass


@app.route("/v1/api/update-contact", methods=['POST'])
def update_contact():
    """
        {
            'code' : 'f1',
            'id' : 'int' 
            'name' : 'aasdfds'
            'link' : 'str'
            
        }
    """

    if request.method == 'POST':
        data = request.get_json()
        if data.get('code') == "f1":
            sId = str(data.get('id'))
            name = data.get('img')
            link = data.get('link')
            try:
                if sId.isdigit() and name and link:
                    db = SQLhelper('baza.db')
                    try:
                        db.update_contact(int(sId), name, link)
                        return jsonify({'message': 'successful'})
                    except:
                        return jsonify({'message': 'bad'})

            except:
                pass

@app.route("/v1/bobur/api/baza/create", methods=["GET"])
def create():
    try:
        import sqlite3
        sql = sqlite3.connect("baza.db")
        db = sql.cursor()
        db.execute("CREATE TABLE IF NOT EXISTS user (name TEXT, surname TEXT, img TEXT, motto TEXT, email TEXT)")
        db.execute("CREATE TABLE IF NOT EXISTS project (title TEXT, subtitle TEXT, skills TEXT, links TEXT)")
        db.execute("CREATE TABLE IF NOT EXISTS contact (img TEXT, link TEXT)")
        db.execute("CREATE TABLE IF NOT EXISTS simple (name TEXT, link TEXT)")
        db.execute("CREATE TABLE IF NOT EXISTS skills (name TEXT, num TEXT)")
        sql.commit()
        sql.close()
        return jsonify({'message': 'done'})
    except Exception as e:
        return jsonify({'message':f"{e}"})

if __name__ == '__main__':
    app.run(debug=True, port=5001)
