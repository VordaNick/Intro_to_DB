import mysql.connector
from mysql.connector import Error

def describe_books_table():
    try:
        # Connect to the 'Toshiba' database
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='G0ldst0ne.',
        )

        if connection.is_connected():
            print("Connected to MySQL server and 'Toshiba' database")

            
            cursor = connection.cursor()
            cursor.execute("USE alx_book_store;")

            query = """
                SELECT 
                    COLUMN_NAME, 
                    COLUMN_TYPE, 
                    IS_NULLABLE, 
                    COLUMN_KEY, 
                    COLUMN_DEFAULT, 
                    EXTRA 
                FROM 
                    INFORMATION_SCHEMA.COLUMNS 
                WHERE 
                    TABLE_SCHEMA = 'Toshiba' 
                    AND TABLE_NAME = 'books';
            """
            cursor.execute(query)
            columns = cursor.fetchall()

            print(f"\n{'Column Name':<20} {'Type':<15} {'Nullable':<10} {'Key':<10} {'Default':<15} {'Extra':<10}")
            print("-" * 80)
            for column in columns:
                column_name, column_type, is_nullable, column_key, column_default, extra = column
                print(f"{column_name:<20} {column_type:<15} {is_nullable:<10} {column_key:<10} {str(column_default):<15} {extra:<10}")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

describe_books_table()