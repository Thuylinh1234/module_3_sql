-- a. ma_hs, ho_ten_hs, ma_lop, ten_lop của tất cả học sinh và tất cả các lớp trong trường.
--  (Gợi ý: lớp chưa có học sinh và học sinh chưa được phân lớp đều phải được trả về kết quả).
SELECT hoc_sinh.ma_hs, hoc_sinh.ho_ten_hs, hoc_sinh.ma_lop, lop.ten_lop
FROM hoc_sinh
LEFT JOIN lop ON hoc_sinh.ma_lop = lop.ma_lop
UNION
SELECT hoc_sinh.ma_hs, hoc_sinh.ho_ten_hs, lop.ma_lop, lop.ten_lop
FROM hoc_sinh
RIGHT JOIN lop ON hoc_sinh.ma_lop = lop.ma_lop;
-- b. ma_mh, ten_mh, ma_gv (phụ trách), ho_ten_gv (phụ trách) của tất cả những môn học và tất cả giáo viên trong trường.
-- Kết quả trả về cần loại bỏ bớt những dòng trùng lặp (những dòng nào trùng nhau thì chỉ hiển thị kết quả 1 lần).
SELECT mon_hoc.ma_mh, mon_hoc.ten_mh, phu_trach_bo_mon.ma_gvpt, giao_vien.ho_ten_gv
FROM mon_hoc
LEFT JOIN phu_trach_bo_mon ON mon_hoc.ma_mh = phu_trach_bo_mon.ma_mh
LEFT JOIN giao_vien ON phu_trach_bo_mon.ma_gvpt = giao_vien.ma_gv
UNION
SELECT mon_hoc.ma_mh, mon_hoc.ten_mh, phu_trach_bo_mon.ma_gvpt, giao_vien.ho_ten_gv
FROM mon_hoc
RIGHT JOIN phu_trach_bo_mon ON mon_hoc.ma_mh = phu_trach_bo_mon.ma_mh
RIGHT JOIN giao_vien ON phu_trach_bo_mon.ma_gvpt = giao_vien.ma_gv;