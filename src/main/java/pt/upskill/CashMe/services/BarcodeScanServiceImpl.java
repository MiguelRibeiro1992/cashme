package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.repositories.ItemRepository;

@Service
public class BarcodeScanServiceImpl implements BarcodeScanService {

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private CartService cartService;

    @Override
    public boolean processBarcode(String barcode) {
        if (barcode == null || barcode.isEmpty()) {
            return false;
        }

        Item item = itemRepository.findByBarcode(barcode);

        if (item != null) {
            cartService.addItemToCart(barcode);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String getItemNameByBarcode(String barcode) {
        Item item = itemRepository.findByBarcode(barcode);
        return (item != null) ? item.getName() : "Produto não encontrado";
    }
}