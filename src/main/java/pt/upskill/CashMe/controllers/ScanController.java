package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.services.BarcodeScanServiceImpl;
import pt.upskill.CashMe.services.NFCScanServiceImpl;

import java.util.Optional;

@Controller
public class ScanController {

    @Autowired
    private BarcodeScanServiceImpl barcodeScanService;

    @Autowired
    private NFCScanServiceImpl nfcScanService;

    //View para Código de Barras
    @GetMapping("/scanViaBarcode")
    public String showBarcodeScanner() {
        return "scanViaBarcode";
    }

    //Processar o código de barras
    @GetMapping("/processBarcode")
    public ModelAndView processBarcode(@RequestParam("barcode") String barcode) {
        ModelAndView mav = new ModelAndView("scanViaBarcode"); // Define a view

        // Como se vai processar o código de barras? Chamar um serviço para validar ou procurar o produto?
        boolean success = barcodeScanService.processBarcode(barcode);

        if (!success) {
            mav.addObject("error", "Produto não encontrado!");
        } else {
            mav.addObject("barcode", barcode);

            String productName = barcodeScanService.getItemNameByBarcode(barcode);
             if (productName == null) {
                 productName = "Produto não encontrado";
            }
             mav.addObject("productName", productName);

            //substituir "Produto Exemplo" pelo nome do produto quando houver um repositório
            mav.addObject("productName", "Produto Exemplo");
        }

        return mav;
    }

    //View para NFC
    @GetMapping("/scanViaNFC")
    public String showNFCScanner() {
        return "scanViaNFC";
    }

    //Processar o NFC
    public ModelAndView processNFC(@RequestParam("nfc") String nfc) {
        ModelAndView mav = new ModelAndView("scanViaNFC");

        boolean sucess = nfcScanService.processNFC(nfc);

        if (!sucess) {
            mav.addObject("error", "Produto NFC não encontrado!");
        } else {
            mav.addObject("nfc", nfc);
            mav.addObject("productName", "Produto NFC Exemplo");
        }

        return mav;
    }

}
