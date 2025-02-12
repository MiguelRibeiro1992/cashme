package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pt.upskill.CashMe.services.BarcodeScanServiceImpl;

@Controller
public class ScanController {

    @Autowired
    BarcodeScanServiceImpl barcodeScanService;

    @GetMapping("/barcode")
    public String showBarcodeScanner (){
        return "scanViaBarcode";
    }

    @PostMapping("/barcode")
    public ResponseEntity<String> scanBarcode(@RequestParam String barcodeData){
        String result = barcodeScanService.processBarcode(barcodeData);
        return ResponseEntity.ok(result);
    }

}
