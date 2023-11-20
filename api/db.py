from datetime import datetime
import sqlite3
import os

def _CreateDB():
    os.system("rm -rf baza1.db")
    sql = sqlite3.connect("baza1.db")
    db = sql.cursor()
    db.execute("CREATE TABLE IF NOT EXISTS apk (title TEXT, subtitle TEXT, link TEXT)")
    sql.commit()
    sql.close()


def _AddDataToDB(title, subtitle, link):
    sql = sqlite3.connect("baza1.db")
    cursor = sql.cursor()
    todo = f"INSERT INTO apk VALUES ('{title}', '{subtitle}', '{link}')"
    cursor.execute(todo)
    sql.commit()
    sql.close()
    print(todo)

def _getApk():
    import sqlite3
    rows = []
    sql = sqlite3.connect('baza1.db')
    db = sql.cursor()
    db.execute("SELECT rowid, * FROM apk")
    result = db.fetchall()
    for row in result:
        rows.append(row)
    sql.close()
    return rows

def _deleteApkById(rowid):
    import sqlite3
    sql = sqlite3.connect('baza1.db')
    db = sql.cursor()
    db.execute(f"DELETE FROM apk WHERE rowid = {rowid}")
    sql.commit()
    sql.close()