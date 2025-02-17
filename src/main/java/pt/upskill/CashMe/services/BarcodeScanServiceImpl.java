package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.Optional;

@Service
public class BarcodeScanServiceImpl implements BarcodeScanService {

    @Autowired
    private ItemRepository itemRepository;


    @Override
    public boolean processBarcode(String barcode) {
        //Falta lógica para processar o código de barras?
        //Quando for implementado, vai verificar se o código corresponde a um produto no repositório

        if (barcode == null || barcode.isEmpty()) {
            System.out.println("Código de barras inválido.");
            return false;
        }

        // Simulação
        if ("123456".equals(barcode)){
            System.out.println("Código de barras processado com sucesso: " + barcode);
            //Associar produto real quando tiver repositório
            return true;
        } else {
            System.out.println("Produto não encontrado para o código: " + barcode);
            return false;
        }
    }

    @Override
    public String getItemNameByBarcode(String barcode) {
        Item item = itemRepository.findByBarcode(barcode); // Busca o produto no repositório
        if (item != null) {
            return item.getName(); // Retorna o nome do produto
        } else {
            return "Produto não encontrado"; // Caso o produto não seja encontrado
        }
    }
}