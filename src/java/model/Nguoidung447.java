package model;

import java.util.Date;

public class Nguoidung447 {
    private int id;
    private String tendangnhap;
    private String matkhau;
    private String hoten;
    private Date ngaysinh;
    private boolean gioitinh;
    private String email;
    private String sodienthoai;
    private String diachi;
    private String vaitro;
    
    public Nguoidung447(String tendangnhap, String matkhau) {
        this.tendangnhap = tendangnhap;
        this.matkhau = matkhau;
    }
    
    public Nguoidung447(int id, String hoten, Date ngaysinh, boolean gioitinh, String email, String sodienthoai, String diachi) {
        this.id = id;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.email = email;
        this.sodienthoai = sodienthoai;
        this.diachi = diachi;
    }

    public Nguoidung447(int id, String tendangnhap, String matkhau, String hoten, Date ngaysinh, boolean gioitinh, String email, String sodienthoai, String diachi, String vaitro) {
        this.id = id;
        this.tendangnhap = tendangnhap;
        this.matkhau = matkhau;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gioitinh = gioitinh;
        this.email = email;
        this.sodienthoai = sodienthoai;
        this.diachi = diachi;
        this.vaitro = vaitro;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTendangnhap() {
        return tendangnhap;
    }

    public void setTendangnhap(String tendangnhap) {
        this.tendangnhap = tendangnhap;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public boolean isGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(boolean gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSodienthoai() {
        return sodienthoai;
    }

    public void setSodienthoai(String sodienthoai) {
        this.sodienthoai = sodienthoai;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getVaitro() {
        return vaitro;
    }

    public void setVaitro(String vaitro) {
        this.vaitro = vaitro;
    }
    
    
}
