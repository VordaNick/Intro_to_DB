import mysql.connector
from mysql.connector import Error

def insert_customer():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='G0ldst0ne.',
        )

        if connection.is_connected():
            print("Connected to MySQL server and 'alx_book_store' database")

            cursor = connection.cursor()
            cursor.execute("USE alx_book_store;")

            insert_query = """
                INSERT INTO customer (customer_id, customer_name, email, address)
                VALUES (%s, %s, %s, %s);
            """
            customer_data = (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave')
            cursor.execute(insert_query, customer_data)
            connection.commit()

            print(f"Row inserted successfully: {customer_data}")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")

insert_customer()