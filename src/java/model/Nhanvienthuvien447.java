package model;

import java.util.Date;

public class Nhanvienthuvien447 extends Nhanvien447 {
    private int id;
    private int tblThuvien447id;  // Khóa ngoại từ bảng Thuvien447
    private int tblNhanvien447id; // Khóa ngoại từ bảng Nhanvien447

    public Nhanvienthuvien447(int id, String tendangnhap, String matkhau, String hoten, Date ngaysinh, boolean gioitinh, String email, String sodienthoai, String diachi, String vaitro, String vitri, int tblNguoidung447Id, int tblThuvien447id, int tblNhanvien447id) {
        super(id, tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro, vitri, tblNguoidung447Id);
        this.id = id;
        this.tblThuvien447id = tblThuvien447id;
        this.tblNhanvien447id = tblNhanvien447id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTblThuvien447id() {
        return tblThuvien447id;
    }

    public void setTblThuvien447id(int tblThuvien447id) {
        this.tblThuvien447id = tblThuvien447id;
    }

    public int getTblNhanvien447id() {
        return tblNhanvien447id;
    }

    public void setTblNhanvien447id(int tblNhanvien447id) {
        this.tblNhanvien447id = tblNhanvien447id;
    }
}