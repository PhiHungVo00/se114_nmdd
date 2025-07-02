"""
CHƯƠNG TRÌNH QUẢN LÝ PHIM
- Quản lý danh sách phim
- Chức năng: Thêm/Xem/Tìm kiếm/Lưu file
"""

import json
import os

# =========================================
# KHAI BÁO HẰNG SỐ (TRÔNG CHUYÊN NGHIỆP)
# =========================================
FILE_DATA = "movie_data.json"
MENU_WIDTH = 40

# =========================================
# XỬ LÝ FILE (CÓ COMMENT RÕ RÀNG)
# =========================================
def load_data():
    """Tải dữ liệu từ file JSON. Tạo file mới nếu không tồn tại"""
    try:
        if not os.path.exists(FILE_DATA):
            with open(FILE_DATA, 'w') as f:
                json.dump([], f)
            return []
        
        with open(FILE_DATA, 'r') as f:
            return json.load(f)
    
    # Xử lý ngoại lệ cơ bản (tránh crash chương trình)
    except Exception as e:
        print(f"LỖI KHI ĐỌC FILE: {str(e)}")
        return []

def save_data(movies):
    """Lưu dữ liệu vào file JSON"""
    try:
        with open(FILE_DATA, 'w') as f:
            json.dump(movies, f, indent=4)
        return True
    except Exception as e:
        print(f"LỖI KHI LƯU FILE: {str(e)}")
        return False
    
def add_movie(movies):
    """Thêm phim mới vào danh sách"""
    # Nhập dữ liệu với validate cơ bản
    while True:
        name = input("Tên phim: ").strip()
        if name: break
        print("⚠️ Tên không được để trống!")

    # Các trường khác
    director = input("Đạo diễn: ").strip() or "Đang cập nhật"
    year = input("Năm sản xuất: ").strip() or "N/A"
    
    # Tạo dictionary lưu trữ
    new_movie = {
        "id": len(movies) + 1,  # ID tự tăng
        "name": name,
        "director": director,
        "year": year
    }
    
    movies.append(new_movie)
    save_data(movies)
    print(f"✅ Đã thêm phim: {name}")

def show_movies(movies):
    """Hiển thị danh sách phim dạng bảng"""
    if not movies:
        print("📭 Danh sách phim trống!")
        return
    

def print_menu():
    """In menu định dạng đẹp"""
    print("\n" + "=" * MENU_WIDTH)
    print(f"{'QUẢN LÝ PHIM':^{MENU_WIDTH}}")
    print("=" * MENU_WIDTH)
    print("1. Thêm phim mới")
    print("2. Xem danh sách phim")
    print("3. Tìm kiếm phim")
    print("4. Thoát chương trình")
    print("=" * MENU_WIDTH)
    print(f"{'ID':<5} {'Tên Phim':<20} {'Đạo Diễn':<15} {'Năm':<10}")   
def main():
    movies = load_data()
        
if __name__ == "__main__":
    main()