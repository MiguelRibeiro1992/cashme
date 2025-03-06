package pt.upskill.CashMe.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import pt.upskill.CashMe.entities.Category;
import pt.upskill.CashMe.entities.Item;
import pt.upskill.CashMe.entities.User;
import pt.upskill.CashMe.models.EditItemModel;
import pt.upskill.CashMe.repositories.ItemRepository;

import java.util.*;

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

    @Override
    //@Transactional
    public void editItem(EditItemModel editItem) {
        Long itemId = editItem.getId() == null ? -1 : editItem.getId();
        Item item = itemRepository.findById(itemId).orElse(new Item());
        item.setQuantity(editItem.getQuantity());
        item.setPrice(editItem.getPrice());
        item.setBarcode(editItem.getBarcode());
        item.setName(editItem.getName());
        item.setDescription(editItem.getDescription());
        item.setImageUrl(editItem.getImageUrl());
        item.setBrand(editItem.getBrand());
        item.setCategories(editItem.getCategories());
        item.setStore(editItem.getStore());
        itemRepository.save(item);
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

    @Override
    public List<Item> searchItems(String query) {
        return itemRepository.findByNameContainingIgnoreCase(query);
    }

    @Override
    public List<Item> getItemsByCategory(Category category) {
        return itemRepository.findByCategoriesContaining(category);
    }

    //Para ir buscar os preços por ordem - usar no tracking
    @Override
    public List<Item> getAllItemsSortedByPrice() {
        return itemRepository.findAll(Sort.by(Sort.Direction.ASC, "price"));
    }

    @Override
    public void rateItem(Item item, int rating) {


        double newRating = (double) rating;
        double currentRating = item.getRating();
        int reviewsCount = item.getReviewsCount();

        double updatedRating = ((currentRating * reviewsCount) + newRating) / (reviewsCount + 1);
        item.setRating(updatedRating);
        item.setReviewsCount(reviewsCount + 1);

        itemRepository.save(item);
    }

    public boolean itemHasCategory(Long itemId, Long categoryId) {
        Optional<Item> itemOpt = itemRepository.findById(itemId);
        if (itemOpt.isPresent()) {
            Item item = itemOpt.get();
            return item.getCategories().stream()
                    .anyMatch(cat -> cat.getId().equals(categoryId));
        }
        return false;
    }


}
