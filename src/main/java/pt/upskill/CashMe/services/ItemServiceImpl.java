package pt.upskill.CashMe.services;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.models.ItemModel;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    private ItemRepository itemRepository;

    @Override
    public ItemModel getItemById(long id) {
        Optional<Item> itemOptional = itemRepository.findById(id);
        if (itemOptional.isPresent()) {
            Item item = itemOptional.get();
            ItemModel itemModel = new ItemModel();
            itemModel.setId(item.getId());
            itemModel.setBarcode(item.getBarcode());
            itemModel.setName(item.getName());
            itemModel.setDescription(item.getDescription());
            itemModel.setImageUrl(item.getImageUrl());
            itemModel.setCategory(item.getCategory());
            itemModel.setBrand(item.getBrand());
            itemModel.setPrice(item.getPrice());
            itemModel.setDiscount(item.getDiscount());
            itemModel.setQuantity(item.getQuantity());
            return itemModel;
        } else {
            return null; // ou lançar uma exceção
        }
    }

    @Transactional
    @Override
    public void save(Item item) {
        System.out.println("Item guardado: " + item.getName());
        itemRepository.save(item);
    }

    @Override
    public List<Item> findAll() {
        return itemRepository.findAll();
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
