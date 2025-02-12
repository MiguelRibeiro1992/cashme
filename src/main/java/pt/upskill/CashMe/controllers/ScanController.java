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
        return "scanViaBarcode";
    }

    //Para abrir a camara
    @GetMapping("/scanCamera")
    public String openCameraPage(){
        return "scanCamera";
    }

    //Processar o código de barras lido
    @GetMapping("/processBarcode")
    public String processBarcode (@RequestParam("barcode") String barcode, Model model) {
        // Como se vai processar o código de barras? Chamar um serviço para validar ou procurar o produto?
        boolean success = barcodeScanService.processBarcode(barcode);

        if (!success) {
            model.addAttribute("error", "Produto não encontrado!");
        } else {
            model.addAttribute("barcode", barcode);
            //precisa de um return aqui?
        }

        // Pode manter-se no scanCamera ou precisa de outra view tipo sucessScan?
        return "scanCamera";
    }

//    //Para adicionar o produto ao carrinho??
//    @GetMapping("/addToCart")
//    public String addToCart(@RequestParam("barcode") String barcode) {
//        return "redirect:/cart";
//    }

//    // Para ir para a página do carrinho??
//    @GetMapping("/cart")
//    public String showCart() {
//        model.addAttribute("cart", cartService.getCart()); //mudar os nomes quando estiver criado
//        return "cart"; // Retorna a view do carrinho
//    }

}
