-- a. Liệt kê những địa chỉ khác nhau trong bảng hoc_sinh (bằng 2 cách khác nhau) ()

SELECT DISTINCT dia_chi FROM hoc_sinh;

SELECT dia_chi FROM hoc_sinh GROUP BY dia_chi;

-- b. Liệt kê ho_ten_hs, gioi_tinh của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh.
SELECT ho_ten_hs, gioi_tinh FROM hoc_sinh GROUP BY ho_ten_hs, gioi_tinh;

-- c. Liệt kê ho_ten_hs của các nhóm được phân nhóm theo ho_ten_hs và gioi_tinh trong bảng hoc_sinh. Chú ý thử giải thích vì sao không liệt kê gioi_tinh mà vẫn không bị lỗi. ()
SELECT ho_ten_hs FROM hoc_sinh GROUP BY ho_ten_hs, gioi_tinh;

-- d. Liệt kê ma_mh, ten_mh, diem_thi_cuoi_ky của từng môn học chia theo từng mức điểm thi cuối kỳ. (Gợi ý: chỉ liệt kê những môn đã từng có học sinh thi cuối kỳ). ()
SELECT kq.ma_mh, mh.ten_mh, kq.diem_thi_cuoi_ky
FROM ket_qua_hoc_tap kq JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
WHERE kq.diem_thi_cuoi_ky IS NOT NULL
GROUP BY kq.ma_mh, kq.diem_thi_cuoi_ky;
-- e. Liệt kê ma_gv, ten_gv của những giáo viên đã từng được phân công phụ trách ít nhất 1 môn học. Nếu ma_gv, ten_gv trùng lặp nhiều lần thì chỉ hiển thị ra 1 lần trong kết quả trả về.
SELECT gv.ma_gv, gv.ho_ten_gv
FROM giao_vien gv
JOIN phu_trach_bo_mon pt ON gv.ma_gv = pt.ma_gvpt
GROUP BY gv.ma_gv, gv.ho_ten_gv;

-- f. Liệt kê tháng và năm của những tháng và năm đã có ít nhất 1 học sinh tham gia thi cuối kỳ (đã có diem_thi_cuoi_ky rồi). ()
SELECT MONTH(kq.ngay_gio_thi_cuoi_ky) AS thang, YEAR(kq.ngay_gio_thi_cuoi_ky) AS nam
FROM ket_qua_hoc_tap kq
WHERE kq.diem_thi_cuoi_ky IS NOT NULL
GROUP BY MONTH(kq.ngay_gio_thi_cuoi_ky), YEAR(kq.ngay_gio_thi_cuoi_ky);

-- g. Liệt kê họ tên của những học sinh có địa chỉ ở Hải Châu và từng thi (giữa kỳ hoặc cuối kỳ) ít nhất 1 lần.
-- Nếu họ tên trùng lặp thì chỉ hiển thị ra 1 lần trong kết quả trả về. Yêu cầu: Không được sử dụng từ khoá DISTINCT.
SELECT hs.ho_ten_hs
FROM hoc_sinh hs
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
WHERE hs.dia_chi LIKE '%Hải Châu%' AND (kq.diem_thi_cuoi_ky IS NOT NULL OR kq.diem_thi_giua_ky IS NOT NULL)
GROUP BY hs.ho_ten_hs;
