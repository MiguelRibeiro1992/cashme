package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pt.upskill.CashMe.services.BarcodeScanServiceImpl;

@Controller
public class ScanController {

    @Autowired
    private BarcodeScanServiceImpl barcodeScanService;

    @GetMapping("/barcode")
    public String showBarcodeScanner (){
        return "scanViaBarcode"; // JSP com o HTML para scan
    }

    @GetMapping("/processBarcode")
    public String processBarcode (@RequestParam("barcode") String barcode) {
        //processar o código de barras lido e associar ao produto
        barcodeScanService.processBarcode(barcode);
        return "redirect:/cart"; // Redireciona para a página do carrinho
    }


}
