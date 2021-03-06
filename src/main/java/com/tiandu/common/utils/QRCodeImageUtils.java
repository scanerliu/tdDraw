package com.tiandu.common.utils;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;

import org.apache.log4j.Logger;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.tiandu.common.tencent.common.TdUserQRcodeTools;

public class QRCodeImageUtils {
	private final static Logger logger = Logger.getLogger(QRCodeImageUtils.class);

	/**
	 * 生成用户推广二维码合成图片
	 * @param headImage 用户头像图片
	 * @param qrcode 用户二维码图片
	 * @param targetImg 推广原图片
	 * @param unick 用户昵称
	 * @param title 用户标题
	 * @param expireDate 二维码过期时间
	 */
	public final static BufferedImage genernateQRCodeImage(BufferedImage headimage, BufferedImage qrcode, String targetImg, String unick, String title, String expireDate) {
        try {
            //目标文件
            File _file = new File(targetImg);
            Image src = ImageIO.read(_file);
            int wideth = src.getWidth(null);
            int height = src.getHeight(null);
            BufferedImage image = new BufferedImage(wideth, height, BufferedImage.TYPE_INT_RGB);
            Graphics g = image.createGraphics();
            g.drawImage(src, 0, 0, wideth, height, null);
            
            //头像水印文件
            int w = headimage.getWidth();
            int h = headimage.getHeight();
            int radus = w>h?w:h;
            BufferedImage output = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
            Graphics2D g2 = output.createGraphics();
            g2.setColor(Color.WHITE);
            g2.setBackground(Color.WHITE);
            output = g2.getDeviceConfiguration().createCompatibleImage(w, h, Transparency.TRANSLUCENT);
            g2.dispose();
            g2 = output.createGraphics();
            g2.setBackground(Color.WHITE);
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(Color.WHITE);
            g2.setBackground(Color.WHITE);
            g2.fillRoundRect(0, 0,w, h, radus, radus);
            g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_IN,  1.0f));
            g2.drawImage(headimage, 0, 0, w, h, null);
            g2.dispose();
            int wideth_biao1 = 100;
            int height_biao1 = 100;
            g.drawImage(output, 60, 40, wideth_biao1, height_biao1, null);
            
            //nick水印
            g.setColor(Color.BLACK);
            g.setFont(new Font("微软雅黑", Font.BOLD, 29));
            g.drawString(unick, 170, 100);
            //title水印
            g.setColor(Color.DARK_GRAY);
            g.setFont(new Font("微软雅黑", Font.PLAIN, 22));
            g.drawString(title, 60, 185);
            //expireDate水印
            g.setColor(Color.GRAY);
            g.setFont(new Font("微软雅黑", Font.BOLD,16));
            g.drawString(expireDate, 358, 745);
            

            //二维码水印文件
            Image src_biao = qrcode;
            int wideth_biao = 400;
            int height_biao = 400;
            g.drawImage(src_biao, 118, 250, wideth_biao, height_biao, null);
            //水印文件结束
            g.dispose();
            logger.error("genernateQRCodeImage: [unick="+unick+"][title="+title+"]");
            return image;
//            FileOutputStream out = new FileOutputStream(targetImg);
//            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
//            encoder.encode(image);
//            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
