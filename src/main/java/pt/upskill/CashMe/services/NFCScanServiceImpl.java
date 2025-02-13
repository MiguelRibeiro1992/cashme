package pt.upskill.CashMe.services;

import org.springframework.stereotype.Service;

@Service
public class NFCScanServiceImpl implements NFCScanService {

    @Override
    public boolean processNFC(String nfc) {
        //exemplo - neste caso o produto é válido se começar com "NFC-"
        return nfc.startsWith("NFC-");
    }
}
