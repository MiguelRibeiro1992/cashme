package pt.upskill.CashMe.services;

public class BarcodeScanServiceImpl implements BarcodeScanService {

    @Override
    public String processBarcode(String barcodeData) {
        if (barcodeData == null || barcodeData.isEmpty()) {
            return "Código de barras inválido!";
        }

        return "Produto identificado com código: " + barcodeData;
    }
}
