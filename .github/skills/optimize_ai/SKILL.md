---
name: flutter-pagination
description: Tạo pagination tối ưu cho Flutter + Cubit
---

# Mục tiêu

Tạo pagination:

- tránh duplicate request
- giữ dữ liệu cũ
- giảm rebuild
- hỗ trợ refresh

---

# Quy trình

## 1. Kiểm tra pattern hiện có

- Tìm feature gần giống
- Reuse Cubit pattern hiện tại
- Reuse API model hiện có

---

## 2. State rules

State cần tách:

- initialLoading
- loadingMore
- refreshLoading
- error

Không replace list cũ khi loadMore.

---

## 3. UI rules

Ưu tiên:

- BlocSelector
- ListView.builder
- extracted item widget

Tránh:

- rebuild toàn màn hình
- nested ListView
- emit loading liên tục
