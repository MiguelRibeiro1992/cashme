package pt.upskill.CashMe.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pt.upskill.CashMe.entities.Store;
import pt.upskill.CashMe.services.StoreService;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class StoreController {

    @Autowired
    private StoreService storeService;

    @GetMapping("/stores")
    public ResponseEntity<List<Store>> findAllStores() {
        List<Store> stores = storeService.findAllStores();
        return ResponseEntity.ok(stores);
    }

    @GetMapping("/status")
    public ResponseEntity<List<Store>> getStoresWithStatus() {
        List<Store> stores = storeService.getStoresWithStatus();
        return ResponseEntity.ok(stores);
    }

}

