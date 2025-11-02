-- a. Học sinh chưa từng thi môn nào
SELECT *
FROM hoc_sinh
WHERE ma_hs NOT IN (
    SELECT DISTINCT  ma_hs
    FROM ket_qua_hoc_tap
);

-- b. Giáo viên chưa từng phụ trách môn học nào
SELECT *
FROM giao_vien
WHERE ma_gv NOT IN (
    SELECT DISTINCT ma_gv
    FROM mon_hoc
    WHERE ma_gv IS NOT NULL
);

-- c. Giáo viên chưa từng chủ nhiệm lớp nào
SELECT *
FROM giao_vien
WHERE ma_gv NOT IN (
    SELECT DISTINCT ma_gvcn
    FROM lop
    WHERE ma_gvcn IS NOT NULL
);

-- d. Môn học chưa từng được tổ chức thi lần nào
SELECT *
FROM mon_hoc
WHERE ma_mh NOT IN (
    SELECT DISTINCT ma_mh
    FROM ket_qua_hoc_tap
    WHERE diem_thi_giua_ky IS NOT NULL 
       OR diem_thi_cuoi_ky IS NOT NULL
);

-- e. Đếm xem tương ứng với mỗi địa chỉ (của học sinh), số lượng học sinh đang ở mỗi địa chỉ là bao nhiêu em. 
-- Chỉ hiển thị kế tqua cho những địa chỉ có ít nhất 5 học sinh đang ở đó
SELECT dia_chi, COUNT(ma_hs) AS so_luong_hs
FROM hoc_sinh
GROUP BY dia_chi
HAVING COUNT(ma_hs) >= 5;

-- f. Liệt kê điểm thi trung bình của từng môn học (dựa vào điểm thi cuối kỳ mà các học sinh đã từng thi).
--  Chỉ liệt kê những môn có điểm trung bình từ 5 đến 10
SELECT mh.ma_mh, mh.ten_mh, AVG(kq.diem_thi_cuoi_ky) AS diem_tb
FROM mon_hoc mh
JOIN ket_qua_hoc_tap kq ON mh.ma_mh = kq.ma_mh
WHERE kq.diem_thi_cuoi_ky IS NOT NULL
GROUP BY mh.ma_mh, mh.ten_mh
HAVING AVG(kq.diem_thi_cuoi_ky) BETWEEN 5 AND 10;

-- g. Tính điểm thi trung bình của từng học sinh trong trường. Chỉ tính điểm trung bình cho những học sinh đã từng thi 
-- cuối kỳ cho ít nhất 1 môn. Dựa vào cột điểm thi cuối kỳ để tính. Chỉ hiển thị những học sinh có điểm trung bình trên 8
SELECT hs.ma_hs, hs.ho_ten_hs, AVG(kq.diem_thi_cuoi_ky) AS diem_tb
FROM hoc_sinh hs
JOIN ket_qua_hoc_tap kq ON hs.ma_hs = kq.ma_hs
WHERE kq.diem_thi_cuoi_ky IS NOT NULL
GROUP BY hs.ma_hs, hs.ho_ten_hs
HAVING AVG(kq.diem_thi_cuoi_ky) > 8;
