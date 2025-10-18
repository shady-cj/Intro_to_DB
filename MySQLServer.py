# pylint: disable=missing-function-docstring
# -*- coding: utf-8 -*-
"""
Created on Sat Oct 18 15:09:43 2025

@author: SICKBOY
"""

import mysql.connector

def connect_to_mysql():
    try:
        db_conn = mysql.connector.connect(
                host="localhost",
                user="test",
                password="password"
            )
    except mysql.connector.Error as e:
        print(str(e))
        return None
    return db_conn

def create_to_db(db_conn):
    try:
        cursor = db_conn.cursor()
        cursor.execute("CREATE DATABASE alx_book_store")
    except mysql.connector.Error as e:
        print(e)
        return None
    return cursor.fetchone()

if __name__ == "__main__":
    conn = connect_to_mysql()
    if conn:
        print(create_to_db(conn))
