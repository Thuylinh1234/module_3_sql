--  a. Những học sinh có giới tính là Nam. --
 SELECT * FROM hoc_sinh  WHERE gioi_tinh = 'Nam';

--   b. Những học sinh chưa có tên của phụ huynh. --
SELECT * FROM hoc_sinh WHERE ho_ten_ph IS NULL;

-- c. Những lớp chưa có giáo viên chủ nhiệm. --
SELECT * FROM lop WHERE ma_gvcn IS NULL;

-- d. Những học sinh chưa được phân lớp. -- 
SELECT * FROM lop WHERE ma_lop is NULL;

--  e. Những học sinh nữ có địa chỉ ở Thanh Khê. --
SELECT * FROM hoc_sinh WHERE  gioi_tinh = 'Nữ' AND dia_chi LIKE '%Thanh Khê%';

--   f. Những học sinh nam có địa chỉ ở Hải Châu hoặc những học sinh nữ có địa chỉ ở Thanh Khê. -- 
SELECT * FROM hoc_sinh WHERE  (gioi_tinh = 'Nữ' AND dia_chi LIKE '%Thanh Khê%') OR (gioi_tinh = 'Nam' AND dia_chi LIKE '%Hải Châu%') ;

-- g. Những học sinh nam chưa có tên phụ huynh và những học sinh nữ chưa được phân lớp. --
SELECT * FROM hoc_sinh WHERE (gioi_tinh = 'Nam' AND ho_ten_ph IS NULL) OR (gioi_tinh = 'Nữ' AND ma_lop IS NULL);
--   h. Những học sinh nam chưa được phân lớp và những học sinh nam chưa có tên phụ huynh. --
SELECT * FROM hoc_sinh WHERE gioi_tinh = 'Nam' AND (ma_lop IS NULL OR ho_ten_ph IS NULL);
--  i. Mã môn học của những môn học được dạy trong học kỳ 2. -- 
SELECT * FROM phu_trach_bo_mon  WHERE hoc_ky = 'Học kỳ 2';
