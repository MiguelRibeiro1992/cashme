//package pt.upskill.CashMe.services;
//
//import org.springframework.stereotype.Service;
//
//import javax.imageio.ImageIO;
//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.util.UUID;
//
//@Service
//public class QRCodeServiceImpl implements QRCodeService {
//
//    @Override
//    public byte[] generateQRCode(String checkoutUrl, int width, int height) {
//        String uniqueId = UUID.randomUUID().toString();
//        String qrCodeData = checkoutUrl + "/" + uniqueId;
//
//        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//        Graphics2D graphics = image.createGraphics();
//
//        graphics.setColor(Color.WHITE);
//        graphics.fillRect(0, 0, width, height);
//        graphics.setColor(Color.BLACK);
//
//        // Simple QR code generation logic (for demonstration purposes)
//        int cellSize = 10;
//        for (int i = 0; i < width; i += cellSize) {
//            for (int j = 0; j < height; j += cellSize) {
//                if ((i / cellSize + j / cellSize) % 2 == 0) {
//                    graphics.fillRect(i, j, cellSize, cellSize);
//                }
//            }
//        }
//
//        graphics.dispose();
//
//        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
//            ImageIO.write(image, "png", baos);
//            return baos.toByteArray();
//        } catch (IOException e) {
//            e.printStackTrace();
//            return null;
//        }
//    }
//}
