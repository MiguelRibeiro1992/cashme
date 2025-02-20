package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.services.BarcodeScanServiceImpl;
import pt.upskill.CashMe.services.CartServiceImpl;
import pt.upskill.CashMe.services.NFCScanServiceImpl;


@Controller
public class ScanController {

    @Autowired
    private BarcodeScanServiceImpl barcodeScanService;

    @Autowired
    private NFCScanServiceImpl nfcScanService;

    @Autowired
    private CartServiceImpl cartService;

    //View para Código de Barras
    @GetMapping("/scanViaBarcode")
    public String showBarcodeScanner() {
        return "scanViaBarcode";
    }

    //Processar o código de barras
    @GetMapping("/processBarcode")
    public ModelAndView processBarcode(@RequestParam("barcode") String barcode) {
        boolean success = barcodeScanService.processBarcode(barcode);

        if (!success) {
            ModelAndView mav = new ModelAndView("scanViaBarcode");
            mav.addObject("error", "Produto não encontrado!");
            return mav;
        }

        cartService.addItemToCart(barcode);

        return new ModelAndView("redirect:/cart");
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
