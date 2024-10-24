import mysql.connector
from mysql.connector import Error

def insert_multiple_customers():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='G0ldst0ne.',
        )

        if connection.is_connected():
            print("Connected to MySQL server and 'alx_book_store' database")
            cursor = connection.cursor()

            insert_query = """
                INSERT INTO customer (customer_id, customer_name, email, address)
                VALUES (%s, %s, %s, %s);
            """
            
            customers_data = [
                (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness Ave.'),
                (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness Ave.'),
                (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness Ave.')
            ]
            cursor.executemany(insert_query, customers_data)
            connection.commit()

            print(f"{cursor.rowcount} rows inserted successfully")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

insert_multiple_customers()