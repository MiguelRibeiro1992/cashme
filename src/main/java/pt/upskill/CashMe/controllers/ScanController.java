package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pt.upskill.CashMe.services.BarcodeScanServiceImpl;

@Controller
public class ScanController {

    @Autowired
    private BarcodeScanServiceImpl barcodeScanService;

    //View inicial
    @GetMapping("/scanViaBarcode")
    public String showBarcodeScanner (){
        return "scanViaBarcode"; // view de scanViaBarcode.jsp
    }

    //Rota para a view que abre a camara
    @GetMapping("/scanCamara")
    public String openCameraPage(){
        return "scanCamara"; // view de scanCamara.jsp
    }

    // Rota para processar o código de barras lido
    @GetMapping("/processBarcode")
    public String processBarcode (@RequestParam("barcode") String barcode, Model model) {
        // Lógica para processar o código de barras
        // Chamar um serviço para validar ou procurar o produto
        boolean success = barcodeScanService.processBarcode(barcode);

        // Adiciona o código de barras ao modelo para ser exibido na view
        model.addAttribute("barcode", barcode);

        // Redireciona para a página de sucesso com o produto lido
        return "successScan";
    }

//    // Rota para adicionar o produto ao carrinho
//    @GetMapping("/addToCart")
//    public String addToCart(@RequestParam("barcode") String barcode) {
//        // Lógica para adicionar o produto ao carrinho
//        return "redirect:/cart"; // Redireciona para a página de carrinho
//    }

//    // Rota para a página do carrinho
//    @GetMapping("/cart")
//    public String showCart() {
//        // model.addAttribute("cart", cartService.getCart());
//        return "cart"; // Retorna a view do carrinho
//    }

}
