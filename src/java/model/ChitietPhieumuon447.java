package model;

import java.util.Date;

public class ChitietPhieumuon447 {
    private int id;
    private int tblTailieu447id;
    private int tblPhieumuon447id;
    private Date ngaymuon;
    private Date ngaytradukien;
    private Date ngaytra;

    public ChitietPhieumuon447(int id, int tblTailieu447Id, int tblPhieumuon447Id, Date ngaymuon, Date ngaytradukien, Date ngaytra) {
        this.id = id;
        this.tblTailieu447id = tblTailieu447Id;
        this.tblPhieumuon447id = tblPhieumuon447Id;
        this.ngaymuon = ngaymuon;
        this.ngaytradukien = ngaytradukien;
        this.ngaytra = ngaytra;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTblTailieu447id() {
        return tblTailieu447id;
    }

    public void setTblTailieu447id(int tblTailieu447id) {
        this.tblTailieu447id = tblTailieu447id;
    }

    public int getTblPhieumuon447id() {
        return tblPhieumuon447id;
    }

    public void setTblPhieumuon447id(int tblPhieumuon447id) {
        this.tblPhieumuon447id = tblPhieumuon447id;
    }

    public Date getNgaymuon() {
        return ngaymuon;
    }

    public void setNgaymuon(Date ngaymuon) {
        this.ngaymuon = ngaymuon;
    }

    public Date getNgaytradukien() {
        return ngaytradukien;
    }

    public void setNgaytradukien(Date ngaytradukien) {
        this.ngaytradukien = ngaytradukien;
    }

    public Date getNgaytra() {
        return ngaytra;
    }

    public void setNgaytra(Date ngaytra) {
        this.ngaytra = ngaytra;
    }
}
