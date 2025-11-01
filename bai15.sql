-- a. ma_lop, ten_lop, ma_gvcn, ho_ten_gv (chủ nhiệm) của tất cả các lớp trong trường. (Gợi ý: tất cả các lớp nghĩa là kể cả những lớp chưa được phân công GVCN).
SELECT l.ma_lop, l.ten_lop, l.ma_gvcn, gv.ho_ten_gv AS ho_ten_gvcn
FROM lop l
LEFT JOIN giao_vien gv ON l.ma_gvcn = gv.ma_gv;

-- b. ma_hs, ho_ten_hs, hoc_ky, ma_mh, ten_mh, diem_thi_giua_ky, diem_thi_cuoi_ky của tất cả học sinh trong trường.
SELECT hs.ma_hs, hs.ho_ten_hs, kq.hoc_ky, mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
FROM hoc_sinh hs
LEFT JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
LEFT JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh;

-- c. ma_hs, ho_ten_hs, ma_lop, ten_lop, ma_gvcn, ho_ten_gv (Chủ nhiệm) của tất cả học sinh trong trường. (Chú ý những trường hợp: học sinh chưa được phân lớp và lớp chưa được phân GVCN).
SELECT hs.ma_hs, hs.ho_ten_hs, l.ma_lop, l.ten_lop, l.ma_gvcn, gv.ho_ten_gv AS ho_ten_gvcn
FROM hoc_sinh hs
LEFT JOIN lop l ON hs.ma_lop = l.ma_lop
LEFT JOIN giao_vien gv ON l.ma_gvcn = gv.ma_gv;

-- d. ma_gv, ho_ten_gv, ma_lop, ten_lop, ma_mh, hoc_ky, ten_mh của tất cả giáo viên trong trường.
SELECT gv.ma_gv, gv.ho_ten_gv, l.ma_lop, l.ten_lop,mh.ma_mh, NULL AS hoc_ky, mh.ten_mh
FROM giao_vien gv
LEFT JOIN lop l ON gv.ma_gv = l.ma_gvcn
LEFT JOIN mon_hoc mh ON 1=1  
LIMIT 0, 1000;

