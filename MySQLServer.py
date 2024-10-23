import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='G0ldst0ne.'
        )
        
        if connection.is_connected():
            print("Connected to MySQL server")

            cursor = connection.cursor()

            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created or already exists")

    except Error as e:
        print(f"Error connecting to MySQL: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

create_database()