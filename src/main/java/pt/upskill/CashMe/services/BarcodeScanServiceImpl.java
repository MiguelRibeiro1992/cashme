package pt.upskill.CashMe.services;

import org.springframework.stereotype.Service;

@Service
public class BarcodeScanServiceImpl implements BarcodeScanService {

    @Override
    public boolean processBarcode(String barcode) {
        // Lógica para processar o código de barras
        // Quando for impletentado, pode-se consultar o repositorio para obter o produto

        // Falta lógica para false
        System.out.println("Código de barras processado: " + barcode);
        return true; // Sucesso
    }
}
