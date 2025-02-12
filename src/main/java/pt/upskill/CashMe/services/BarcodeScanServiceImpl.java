package pt.upskill.CashMe.services;

import org.springframework.stereotype.Service;

@Service
public class BarcodeScanServiceImpl implements BarcodeScanService {

    @Override
    public void processBarcode (String barcode) {
        //adicionar o processamento necessário
        //exemplo: associar codigo de barras a um produto do repositorio
        System.out.println("Código de barras processado: " + barcode);
    }

}
