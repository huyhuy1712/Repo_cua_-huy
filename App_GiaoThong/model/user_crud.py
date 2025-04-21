#Phải import cái này máy t(nam) chạy mới được
#Dòng này thêm thư mục cha (Python_BienBao) vào sys.path, giúp Python nhận diện package model khi chạy file .py trực tiếp.
import re
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from model.db_connection import get_connection, close_connection

# CREATE - Thêm user mới
def create_user(username, password, avatar):
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        sql = "INSERT INTO user (username, password, avatar) VALUES (%s, %s, %s)"
        values = (username, password, avatar)
        cursor.execute(sql, values)
        conn.commit()
        close_connection(conn, cursor)
        print("✅ User created successfully!")

# READ - Lấy danh sách user
def read_users():
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM user")
        users = cursor.fetchall()
        close_connection(conn, cursor)
        return users

# UPDATE - Cập nhật thông tin user
def update_user(user_id, new_username, new_avatar):
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        sql = "UPDATE user SET username = %s, avatar = %s WHERE id_user = %s"
        values = (new_username, new_avatar, user_id)
        cursor.execute(sql, values)
        conn.commit()
        close_connection(conn, cursor)
        print("✅ User updated successfully!")

# DELETE - Xóa user
def delete_user(user_id):
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        sql = "DELETE FROM user WHERE id_user = %s"
        cursor.execute(sql, (user_id,))
        conn.commit()
        close_connection(conn, cursor)
        print("✅ User deleted successfully!")


def get_user_id_from_username(username):
    conn = get_connection()  # Kết nối đến cơ sở dữ liệu
    if conn:
        try:
            cursor = conn.cursor()
            # Truy vấn lấy id_user từ username
            sql = "SELECT id_user FROM user WHERE username = %s"
            cursor.execute(sql, (username,))
            
            result = cursor.fetchone()  # Lấy một dòng kết quả
            if result:
                # Trả về id_user nếu tìm thấy
                return result[0]
            else:
                # Trả về None nếu không tìm thấy username
                return None
        except Exception as e:
            print(f"Error: {e}")
            return None  # Nếu có lỗi xảy ra
        finally:
            close_connection(conn, cursor)  # Đảm bảo đóng kết nối và con trỏ
    else:
        return None  # Nếu không kết nối được đến CSDL

def get_avatar_by_id(user_id):
    """ Lấy avatar của người dùng từ cơ sở dữ liệu dựa trên id_user """
    conn = get_connection()  # Lấy kết nối đến cơ sở dữ liệu
    if conn:
        try:
            cursor = conn.cursor()
            # Truy vấn để lấy avatar của người dùng theo id_user
            sql = "SELECT avatar FROM user WHERE id_user = %s"
            cursor.execute(sql, (user_id,))
            
            result = cursor.fetchone()  # Lấy một kết quả (dòng) từ truy vấn
            if result:
                # Trả về đường dẫn của avatar
                return result[0]  # result[0] chứa đường dẫn avatar
            else:
                return None  # Nếu không tìm thấy người dùng với id_user
        except Exception as e:
            print(f"Error: {e}")
            return None  # Nếu có lỗi xảy ra
        finally:
            # Đảm bảo đóng kết nối và con trỏ
            close_connection(conn, cursor)
    else:
        return None  # Nếu không kết nối được đến cơ sở dữ liệu   

def get_user_by_id(user_id):
    conn = get_connection()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)  # Dùng dict để truy cập theo tên cột
            sql = "SELECT * FROM user WHERE id_user = %s"
            cursor.execute(sql, (user_id,))
            user = cursor.fetchone()
            return user  # Trả về dict hoặc None nếu không có
        except Exception as e:
            print("Lỗi khi truy vấn user:", e)
        finally:
            cursor.close()
            conn.close()
    return None


def save_user_id(user_id):
    with open("curr_user.txt","w") as file:
        file.write(user_id)

def load_user_id():
    try:
        with open("curr_user.txt", "r") as file:
            id_user = file.read().strip()
            return id_user
    except FileNotFoundError:
        print("File curr_user.txt không tồn tại.")
        return None

def is_avatar_exist(avatar_name, folder="image/"):
    """Kiểm tra xem ảnh có tồn tại trong thư mục hay không."""
    if not avatar_name:  # Nếu avatar_name rỗng hoặc None, trả về False
        return False

    avatar_path = os.path.join(folder, avatar_name.strip())  # Tạo đường dẫn đầy đủ
    return os.path.isfile(avatar_path)  # Trả về True nếu file tồn tại, ngược lại False

def is_username_exist(username):
    conn = get_connection()  # Kết nối đến cơ sở dữ liệu
    if conn:
        try:
            cursor = conn.cursor()
            # Truy vấn để kiểm tra xem username có tồn tại trong cơ sở dữ liệu không
            sql = "SELECT COUNT(*) FROM user WHERE username = %s"
            cursor.execute(sql, (username,))
            
            result = cursor.fetchone()  # Lấy kết quả của câu truy vấn
            if result and result[0] > 0:
                return True  # Nếu username tồn tại
            else:
                return False  # Nếu username không tồn tại
        except Exception as e:
            print(f"Error: {e}")
            return False  # Nếu có lỗi xảy ra
        finally:
            # Đảm bảo đóng kết nối và con trỏ
            close_connection(conn, cursor)
    else:
        return False  # Nếu không kết nối được đến CSDL
    
    # UPDATE - Cập nhật thông tin user
def update_user(user_id, new_password, new_avatar):
    conn = get_connection()
    if conn:
        cursor = conn.cursor()
        sql = "UPDATE user SET password = %s, avatar = %s WHERE id_user = %s"
        values = (new_password, new_avatar, user_id)
        cursor.execute(sql, values)
        conn.commit()
        close_connection(conn, cursor)
        print("User updated successfully!")
