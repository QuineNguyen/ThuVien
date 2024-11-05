package model;


public class Tailieu447 {
    private int id;
    private String maTL;
    private String ten;
    private int namXuatBan;
    private int soTrang;
    private String ngonNgu;
    private String theloai;
    private int tblNhaxuatban447id;

    // Constructor không tham số
    public Tailieu447() {
        // Mặc định không làm gì, có thể sử dụng khi cần tạo đối tượng trống
    }

    // Constructor đầy đủ tham số, tự động khởi tạo maTL
    public Tailieu447(int id, String ten, int namXuatBan, int soTrang, String ngonNgu, String theloai, int tblNhaxuatban447id) {
        this.id = id;
        this.maTL = String.format("TL%02d", id); // Khởi tạo maTL với định dạng "TL%02d"
        this.ten = ten;
        this.namXuatBan = namXuatBan;
        this.soTrang = soTrang;
        this.ngonNgu = ngonNgu;
        this.theloai = theloai;
        this.tblNhaxuatban447id = tblNhaxuatban447id;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
        this.maTL = String.format("TL%02d", id); // Cập nhật maTL mỗi khi id thay đổi
    }

    public String getMaTL() {
        return maTL;
    }

    // Không cần setter cho maTL vì nó sẽ được tự động khởi tạo từ id
    // public void setMaTL(String maTL) {}

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public int getNamXuatBan() {
        return namXuatBan;
    }

    public void setNamXuatBan(int namXuatBan) {
        this.namXuatBan = namXuatBan;
    }

    public int getSoTrang() {
        return soTrang;
    }

    public void setSoTrang(int soTrang) {
        this.soTrang = soTrang;
    }

    public String getNgonNgu() {
        return ngonNgu;
    }

    public void setNgonNgu(String ngonNgu) {
        this.ngonNgu = ngonNgu;
    }

    public String getTheloai() {
        return theloai;
    }

    public void setTheloai(String theloai) {
        this.theloai = theloai;
    }

    public int getTblNhaxuatban447id() {
        return tblNhaxuatban447id;
    }

    public void setTblNhaxuatban447id(int tblNhaxuatban447id) {
        this.tblNhaxuatban447id = tblNhaxuatban447id;
    }
}
