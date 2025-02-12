package pt.upskill.CashMe.services;

import org.springframework.stereotype.Service;

@Service
public class BarcodeScanServiceImpl implements BarcodeScanService {

    //Confirmar o nome do repositorio quando existir
    //@Autowired
    //private ProductRepository productRepository;


    @Override
    public boolean processBarcode(String barcode) {
        //Falta lógica para processar o código de barras?
        //Quando for implementado, vai verificar se o código corresponde a um produto no repositório

        // Simulação
        if (barcode == null || barcode.isEmpty()) {
            System.out.println("Código de barras inválido.");
            return false;
        }

        if ("123456".equals(barcode)){
            System.out.println("Código de barras processado com sucesso: " + barcode);
            //Associar produto real quando tiver repositório
            return true;
        } else {
            System.out.println("Produto não encontrado para o código: " + barcode);
            return false;
        }

        //Para quando houver repositório
        //Optional<Product> product = productRepository.findByBarcode(barcode);
        //if (product.isPresent()) {
        //System.out.println("Produto encontrado: " + product.get().getName());
        //return true;
        //} else {
        // System.out.println("Produto não encontrado para o código: " + barcode);
        // return false;
        // }


    }
}