-- a. Lấy danh sách các học sinh có kết quả thi môn Toán học trong học kỳ 1 
SELECT ho_ten_hs
FROM hoc_sinh
WHERE EXISTS (
    SELECT 1
    FROM ket_qua_hoc_tap
    WHERE hoc_sinh.ma_hs = ket_qua_hoc_tap.ma_hs
      AND ket_qua_hoc_tap.ma_mh = 'MH001'
      AND ket_qua_hoc_tap.hoc_ky = 'Học kỳ 1'
);
-- b. Lấy danh sách các giáo viên chủ nhiệm có ít nhất một lớp học 
SELECT ho_ten_gv
FROM giao_vien
WHERE EXISTS (
    SELECT 1
    FROM lop
    WHERE giao_vien.ma_gv = lop.ma_gvcn
);
-- c. Lấy thông tin các học sinh thuộc lớp 1A hoặc lớp 1B 
SELECT ho_ten_hs
FROM hoc_sinh
WHERE ma_lop IN ('L0001', 'L0003');
-- d. Lấy thông tin các học sinh có điểm thi môn Toán học trong học kỳ 1 nằm trong danh sách (8.0, 8.5, 9.0)
SELECT ho_ten_hs
FROM hoc_sinh
WHERE ma_hs IN (
    SELECT ma_hs
    FROM ket_qua_hoc_tap
    WHERE ma_mh = 'MH001'
      AND hoc_ky = 'Học kỳ 1'
      AND diem_thi_cuoi_ky IN (8.0, 8.5, 9.0)
);