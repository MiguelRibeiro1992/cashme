package pt.upskill.CashMe.services;

import org.springframework.stereotype.Service;

@Service
public class QRCodeServiceImpl implements QRCodeService {


    @Override
    public byte[] generateQRCode(String checkoutUrl, int i, int i1) {
        return new byte[10];
    }
}
