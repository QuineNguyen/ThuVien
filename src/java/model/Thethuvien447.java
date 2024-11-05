package model;

import java.util.Date;

public class Thethuvien447 extends Docgia447 {
    private String anhthe;
    private Date ngaydangky;
    private int tblDocgia447id;

    public Thethuvien447(int id, String tendangnhap, String matkhau, String hoten, Date ngaysinh, boolean gioitinh, String email, String sodienthoai, String diachi, String vaitro, int tblNguoidung447id, String anhthe, Date ngaydangky, int tblDocgia447id) {
        super(id, tendangnhap, matkhau, hoten, ngaysinh, gioitinh, email, sodienthoai, diachi, vaitro, tblNguoidung447id);
        this.anhthe = anhthe;
        this.ngaydangky = ngaydangky;
        this.tblDocgia447id = tblDocgia447id;
    }

    public String getAnhthe() {
        return anhthe;
    }

    public void setAnhthe(String anhthe) {
        this.anhthe = anhthe;
    }

    public Date getNgaydangky() {
        return ngaydangky;
    }

    public void setNgaydangky(Date ngaydangky) {
        this.ngaydangky = ngaydangky;
    }

    public int getTblDocgia447id() {
        return tblDocgia447id;
    }

    public void setTblDocgia447id(int tblDocgia447id) {
        this.tblDocgia447id = tblDocgia447id;
    }
}
