package pt.upskill.CashMe.services;

public interface BarcodeScanService {

    public boolean processBarcode (String barcode);

    String getItemNameByBarcode(String barcode);
}
