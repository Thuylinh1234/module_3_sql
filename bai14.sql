-- a. Học sinh nam ở Thanh Khê và học sinh nữ ở Hải Châu (theo 2 cách khác nhau)
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE gioi_tinh = 'Nam' AND dia_chi LIKE '%Thanh Khê%'
UNION
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE gioi_tinh = 'Nữ' AND dia_chi LIKE '%Hải Châu%';
---------------------------------------------------------------
SELECT ho_ten_hs, gioi_tinh, dia_chi
FROM hoc_sinh
WHERE (gioi_tinh = 'Nam' AND dia_chi LIKE '%Thanh Khê%')
   OR (gioi_tinh = 'Nữ' AND dia_chi LIKE '%Hải Châu%');

-- b. Họ tên của học sinh và giáo viên trong toàn trường
SELECT ho_ten_hs AS ho_ten, NULL AS nghiep_ngh, NULL AS ho_ten_gv
FROM hoc_sinh
UNION
SELECT NULL AS ho_ten, NULL AS nghiep_ngh, ho_ten_gv
FROM giao_vien;

-- c. Họ tên, nghề nghiệp của học sinh và giáo viên trong toàn trường. (Nghề nghiệp bao gồm: học sinh hoặc giáo viên)
SELECT ho_ten_hs AS ho_ten, 'Học sinh' AS nghe_nghiep
FROM hoc_sinh
UNION ALL
SELECT ho_ten_gv AS ho_ten, 'Giáo viên' AS nghe_nghiep
FROM giao_vien;

-- d. Những học sinh đang học ở năm học 2019-2020 và những học sinh chưa từng thi môn Toán và môn Tiếng Việt 
SELECT DISTINCT hs.ma_hs, hs.ho_ten_hs
FROM hoc_sinh hs
JOIN lop l ON hs.ma_lop = l.ma_lop
WHERE l.nam_hoc = '2019-2020'
  AND hs.ma_hs NOT IN (
      SELECT ma_hs
      FROM ket_qua_hoc_tap kq
      JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
      WHERE mh.ten_mh IN ('Toán', 'Tiếng Việt')
  );

-- e. Thống kê điểm thi trung bình (của tất cả học sinh và tất cả các môn) theo từng tháng (đầy đủ 12 tháng, từ tháng 1 đến tháng 12) trong năm 2019. 
-- Chỉ tính điểm trung bình dựa vào điểm thi cuối kỳ của các môn
-- dùng cột ngày: ngay_gio_thi_cuoi_ky (DATE/DATETIME)
SELECT
  t.thang,
  ROUND(AVG(kq.diem_thi_cuoi_ky),2) AS diem_tb_thang
FROM (
  SELECT 1 AS thang UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
  UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8
  UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12
) AS t
LEFT JOIN ket_qua_hoc_tap kq
  ON MONTH(kq.ngay_gio_thi_cuoi_ky) = t.thang
  AND YEAR(kq.ngay_gio_thi_cuoi_ky) = 2019
GROUP BY t.thang
ORDER BY t.thang;




