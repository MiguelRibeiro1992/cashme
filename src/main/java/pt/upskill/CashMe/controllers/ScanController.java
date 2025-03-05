package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.CashMe.services.BarcodeScanServiceImpl;
import pt.upskill.CashMe.services.CartServiceImpl;
import pt.upskill.CashMe.services.NFCScanServiceImpl;


@Controller
@RequestMapping("/scan")
public class ScanController {

    @Autowired
    private BarcodeScanServiceImpl barcodeScanService;

    @Autowired
    private NFCScanServiceImpl nfcScanService;

    @Autowired
    private CartServiceImpl cartService;

    @GetMapping("/viaBarcode")
    public String showBarcodeScanner() {
        return "scanViaBarcode";
    }

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

    @GetMapping("/viaNFC")
    public String showNFCScanner() {
        return "scanViaNFC";
    }

    @GetMapping("/processNFC")
    public ModelAndView processNFC(@RequestParam("nfc") String nfc) {
        boolean success = nfcScanService.processNFC(nfc);
        if (!success) {
            ModelAndView mav = new ModelAndView("scanViaNFC");
            mav.addObject("error", "Produto NFC não encontrado!");
            return mav;
        }
        cartService.addItemToCart(nfc);
        return new ModelAndView("redirect:/cart");
    }
}
