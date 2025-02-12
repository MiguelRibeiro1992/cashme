package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.services.BarcodeScanServiceImpl;

@Controller
public class ScanController {

    @Autowired
    private BarcodeScanServiceImpl barcodeScanService;

    @GetMapping("/scanViaBarcode")
    public String showBarcodeScanner (){
        return "scanViaBarcode";
    }

    //Processar o código de barras lido
    @GetMapping("/processBarcode")
    public ModelAndView  processBarcode (@RequestParam("barcode") String barcode) {
        ModelAndView mav = new ModelAndView("scanViaBarcode"); // Define a view

        // Como se vai processar o código de barras? Chamar um serviço para validar ou procurar o produto?
        boolean success = barcodeScanService.processBarcode(barcode);

        if (!success) {
            mav.addObject("error", "Produto não encontrado!");
        } else {
            mav.addObject("barcode", barcode);
            //substituir "Produto Exemplo" pelo nome do produto quando houver um repositório
            mav.addObject("productName", "Produto Exemplo");
        }

        return mav;
    }

}
