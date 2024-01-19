import sqlite3
class SQLhelper:
    def __init__(self, database):
        self.connection = sqlite3.connect(database)
        self.cursor = self.connection.cursor()
    
    def get_user(self):
        with self.connection:
            self.cursor.execute("""SELECT rowid, * FROM user""")
            row = self.cursor.fetchall()
            return row

    def update_user(self, name, surname, img, motto):
        with self.connection:
            self.connection.execute("""UPDATE user SET name = ?, surname = ?, img = ?, motto = ? WHERE rowid = 1""", [name, surname, img, motto])
       
    def add_user(self, name, surname, img, motto):
        with self.connection:
            self.connection.execute("""INSERT INTO user (name, surname, img, motto) VALUES
            (?,?,?,?)""", [name, surname, img, motto])    


    def get_projects(self):
        with self.connection:
            self.cursor.execute("""SELECT rowid, * FROM project""")
            row = self.cursor.fetchall()
            return row

    def update_project(self, pId, title, subtitle, skills, links: list):
        with self.connection:
            self.connection.execute("""UPDATE project SET title = ?, subtitle = ?, skills = ?, links = ? WHERE rowid = ?""", [title, subtitle, skills, f"{links}", pId])
       
    def add_project(self, title, subtitle, skills, links: list):
        with self.connection:
            self.connection.execute("""INSERT INTO project (title, subtitle, skills, links) VALUES
            (?,?,?,?)""", [title, subtitle, skills, f"{links}"])

    
    def get_skills(self):
        with self.connection:
            self.cursor.execute("""SELECT rowid, * FROM skills""")
            row = self.cursor.fetchall()
            return row

    def update_skills(self, sId, name, num):
        with self.connection:
            self.connection.execute("""UPDATE skills SET name = ?, num = ? WHERE rowid = ?""", [name, num, sId])
       
    def add_skill(self, name, num):
        with self.connection:
            self.connection.execute("""INSERT INTO skills (name, num) VALUES
            (?,?)""", [name, num])
    
    def get_sim_skills(self):
        with self.connection:
            self.cursor.execute("""SELECT rowid, * FROM simple""")
            row = self.cursor.fetchall()
            return row

    def update_sim_skills(self, sId, name, link):
        with self.connection:
            self.connection.execute("""UPDATE simple SET name = ?, link = ? WHERE rowid = ?""", [name, link, sId])
       
    def add_sim_skill(self, name, link):
        with self.connection:
            self.connection.execute("""INSERT INTO simple (name, link) VALUES
            (?,?)""", [name, link])
    
    def get_contact(self):
        with self.connection:
            self.cursor.execute("""SELECT rowid, * FROM contact""")
            row = self.cursor.fetchall()
            return row

    def update_contact(self, cId, img, link):
        with self.connection:
            self.connection.execute("""UPDATE contact SET img = ?, link = ? WHERE rowid = ?""", [img, link, cId])
       
    def add_contact(self, img, link):
        with self.connection:
            self.connection.execute("""INSERT INTO contact (img, link) VALUES
            (?,?)""", [img, link])
    