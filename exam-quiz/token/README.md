HƯỚNG DẪN CHẠY DỰ ÁN

I. YÊU CẦU MÔI TRƯỜNG - Maven - JDK 1.8 trở lên - IDE Eclipse - SQL Server
II. CÁCH CHẠY DỰ ÁN 
    BƯỚC 1: clone source code từ repository này về 
    BƯỚC 2: mở dự án bằng Eclipse hoặc Intellij, sau đó mở cửa sổ Terminal của dự án lên. File back end ở folder token 
    BƯỚC 3: click chuột phải vào file pom.xml >> Maven >> Update project 
    BƯỚC 4: vào thư mục src/main/webapp/WEB-INF/dispatcher-servlet.xml để cấu hình thông tin ứng dụng <property name="username" value=""/><property name="password" value=""> của bạn
    BƯỚC 5: Chạy dự án
    BƯỚC 6: mở file SQL data.sql (https://github.com/lethanhtam190198/Mock-Project/blob/main/data.sql) và chạy bằng SQL server để insert dữ liệu vào database

