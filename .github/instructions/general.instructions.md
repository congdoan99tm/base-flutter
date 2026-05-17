# Mục tiêu chính

Sinh code chính xác với lượng token thấp nhất.

Ưu tiên:

1. Correctness
2. Architecture consistency
3. Minimal code diff
4. Token efficiency

---

# Quy tắc context

- Không đọc toàn bộ project
- Chỉ đọc file liên quan trực tiếp
- Ưu tiên reuse code hiện có
- Không scan các feature không liên quan

---

# Quy tắc chỉnh sửa

- Chỉ sửa code cần thiết
- Không refactor ngoài scope
- Không rename không cần thiết
- Không reformat toàn file

---

# Quy tắc Flutter

Ưu tiên:

- const widget
- BlocSelector
- immutable state
- extracted widget

Tránh:

- rebuild không cần thiết
- business logic trong UI
- widget tree quá lớn
- duplicated widget
