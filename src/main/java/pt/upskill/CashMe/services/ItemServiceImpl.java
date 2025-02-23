package pt.upskill.CashMe.services;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.ItemModel;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private UserServiceImpl userService;

    @Override
    public Item getItemById(long id) {
        return itemRepository.findById(id)
                .orElse(null); // Retorna null se não encontrar (ou lançar exceção se preferir)
    }

//    public void addItem(ItemModel itemModel) {
//        Item item = new Item();
//        item.setBarcode(itemModel.getBarcode());
//        item.setName(itemModel.getName());
//        item.setDescription(itemModel.getDescription());
//        item.setImageUrl(itemModel.getImageUrl());
//        item.setBrand(itemModel.getBrand());
//        item.setPrice(itemModel.getPrice());
//        item.setDiscount(itemModel.getDiscount());
//        item.setQuantity(itemModel.getQuantity());
//        itemRepository.save(item);
//    }

    @Override
    //@Transactional
    public void save(Item item) {
        Item itemToSave = itemRepository.findByBarcode(item.getBarcode());
        if (itemToSave == null) {
            itemRepository.save(item);
        } else {
            itemToSave.setQuantity(itemToSave.getQuantity() + item.getQuantity());
            itemRepository.save(itemToSave);
        }
    }

    @Override
    public List<Item> findAll() {
        return itemRepository.findAll();
    }

    @Override
    public void deleteItem(Long itemId) {
        User currentUser = userService.getCurrentUser();

        // Apenas administradores podem remover categorias
        if (!currentUser.isAdmin()) {
            throw new SecurityException("Apenas administradores podem remover items.");
        }

        // Verifica se o item existe
        Optional<Item> itemOpt = itemRepository.findById(itemId);
        if (itemOpt.isEmpty()) {
            throw new IllegalArgumentException("Item não encontrado.");
        }

        itemRepository.deleteById(itemId);
    }


    public boolean itemHasCategory(Long itemId, Long categoryId) {
        Optional<Item> itemOpt = itemRepository.findById(itemId);
        if (itemOpt.isPresent()) {
            Item item = itemOpt.get();
            return item.getCategory().stream()
                    .anyMatch(cat -> cat.getId().equals(categoryId));
        }
        return false;
    }


}
