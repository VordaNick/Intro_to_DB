import mysql.connector
from mysql.connector import Error

def list_tables_in_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root', 
            password='G0ldst0ne.',
            database='alx_book_store'
        )
        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("SHOW TABLES;")

            print("Tables in the 'bookstore' database:")
            for table in cursor.fetchall():
                print(table[0])

    except Error as e:
        print(f"Error: {e}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed.")

if __name__ == "__main__":
    list_tables_in_database()