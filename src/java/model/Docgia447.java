package model;

import java.util.Date;

public class Docgia447 extends Nguoidung447 {
    private String madocgia;
    private int tblNguoidung447Id;  // Khóa ngoại từ bảng Nguoidung447

    public Docgia447(int id, String tendangnhap, String matkhau, String hoten, Date ngaysinh, boolean gioitinh, String email, String sodienthoai, String diachi, String vaitro, int tblNguoidung447Id) {
        super(id, tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro);
        this.tblNguoidung447Id = tblNguoidung447Id;
        this.madocgia = String.format("DG%02d", id);
    }

    public String getMadocgia() {
        return madocgia;
    }

    public void setMadocgia(String madocgia) {
        this.madocgia = madocgia;
    }

    public int getTblNguoidung447Id() {
        return tblNguoidung447Id;
    }

    public void setTblNguoidung447Id(int tblNguoidung447Id) {
        this.tblNguoidung447Id = tblNguoidung447Id;
    }
}
