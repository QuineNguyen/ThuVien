package model;

import java.util.Date;

public class Nhanvien447 extends Nguoidung447 {
    private String maNV;
    private String vitri;
    private int tblNguoidung447Id;  // Khóa ngoại từ bảng Nguoidung447

    public Nhanvien447(int id, String tendangnhap, String matkhau, String hoten, Date ngaysinh, boolean gioitinh, String email, String sodienthoai, String diachi, String vaitro, String vitri, int tblNguoidung447Id) {
        super(id, tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro);
        this.tblNguoidung447Id = tblNguoidung447Id;
        this.maNV = "NV" + String.format("%02d", tblNguoidung447Id);
        this.vitri = vitri;
    }

    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getVitri() {
        return vitri;
    }

    public void setVitri(String vitri) {
        this.vitri = vitri;
    }

    public int getTblNguoidung447Id() {
        return tblNguoidung447Id;
    }

    public void setTblNguoidung447Id(int tblNguoidung447Id) {
        this.tblNguoidung447Id = tblNguoidung447Id;
    }
}
