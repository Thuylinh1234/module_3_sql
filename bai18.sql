-- a. Lấy danh sách học sinh trong một lớp 1A, sắp xếp theo tên, bắt đầu từ kết quả thứ 11 và lấy 5 kết quả tiếp theo.
select ho_ten_hs
from hoc_sinh
where ma_lop = 'L001'
order by ho_ten_hs
limit 10,5;
-- b. Lấy thông tin giáo viên phụ trách bộ môn trong Lớp 5A, sắp xếp theo tên môn học và lấy tối đa 5 kết quả, bắt đầu từ kết quả thứ 6.
select giao_vien.ho_ten_gv, mon_hoc.ten_mh
from giao_vien
join phu_trach_bo_mon ON giao_vien.ma_gv = phu_trach_bo_mon.ma_gvpt
join mon_hoc ON phu_trach_bo_mon.ma_mh = mon_hoc.ma_mh
where phu_trach_bo_mon.ma_lop = 'L009'
order by  mon_hoc.ten_mh
limit 5,5;