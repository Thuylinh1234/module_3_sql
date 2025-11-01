-- a. Liệt kê ho_ten_hs, gioi_tinh, dia_chi của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh. Thử suy nghĩ về nguyê nhân lỗi nếu có lỗi xảy ra (*)
select hs.ho_ten_hs, hs.gioi_tinh, hs.dia_chi
from hoc_sinh hs
group by hs.ho_ten_hs, hs.gioi_tinh;

-- b. Đếm số lượng học sinh là nam.
select count(*) as SOLUONGHOCSINHNAM
from hoc_sinh
where gioi_tinh = 'Nam'; 

-- c. Đếm số lượng học sinh trong lớp có tên là Lớp 1A và lớp đó nằm trong năm học 2022-2023. 
select count(*) SOLUONGHSLOP1A
from hoc_sinh hs
JOIN lop ON  hs.ma_lop = lop.ma_lop
where lop.ten_lop = 'Lớp 1A' AND lop.nam_hoc = '2022 - 2023';

--  d. Đếm số lớp đã phụ trách (có thể là 1 hoặc nhiều môn nào đó) của từng giáo viên.
