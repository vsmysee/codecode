---
title: simple-captcha
date: 2020-03-07
categories: ['captcha']
draft: false
---

```

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

public class GenerateImage {

    private static int Width = 90;
    private static int Height = 36;
    private static int FontSize = 24;
    private static Color bkColor = new Color(247, 247, 245);
    private static Color textColor = new Color(21, 72, 139);
    private static Font[] _fonts = {
            new Font("Arial", Font.CENTER_BASELINE, FontSize),
            new Font("Times New Roman", Font.CENTER_BASELINE, FontSize - 1),
            new Font("Georgia", Font.CENTER_BASELINE, FontSize),
            new Font("Comic Sans MS", Font.CENTER_BASELINE, FontSize + 1)};
    private static Random random = new Random();

    public static BufferedImage Generate(String captchaText) {
        return Generate(captchaText, Width, Height);
    }

    public static BufferedImage Generate(String captchaText, int width, int height) {
        Width = width;
        Height = height;
        BufferedImage image = new BufferedImage(Width, Height, BufferedImage.TYPE_INT_BGR);

        Graphics graphics = image.getGraphics();
        try {
            graphics.setColor(bkColor);
            graphics.fillRect(0, 0, width, height);

            drawRandomLine(graphics);
            graphics.setColor(textColor);

            char[] items = captchaText.toCharArray();
            for (int i = 1; i <= items.length; i++) {
                char item = items[i - 1];
                Font font = _fonts[random.nextInt(_fonts.length - 1)];
                graphics.setFont(font);
                drawString(graphics, item, i, font);
            }
        } finally {
            graphics.dispose();
        }
        return image;
    }

    /**
     * 画随机线条
     *
     * @param g
     */
    private static void drawRandomLine(Graphics g) {
        // 设置颜色
        g.setColor(textColor);
        for (int i = 0; i < 10; i++) {
            int x1 = new Random().nextInt(Width);
            int y1 = new Random().nextInt(Height);
            int x2 = new Random().nextInt(Width);
            int y2 = new Random().nextInt(Height);
            g.drawLine(x1, y1, x2, y2);
        }
    }

    /*
     * 绘制字符串
     */
    private static void drawString(Graphics g, char item, int i, Font font) {
        g.setFont(font);
        g.setColor(textColor);
        String rand = String.valueOf(item);
        g.translate(random.nextInt(5), random.nextInt(5));
        g.drawString(rand, 14 * i + random.nextInt(2), 20 + random.nextInt(5));
    }
}


```


```
    @RequestMapping(value = "/captcha")
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int height = 43;
        int width = 100;
        
        String text = "";

        try {
            resp.setContentType("image/png");
            BufferedImage image = GenerateImage.Generate(text, width, height);
            ImageIO.write(image, "JPEG", resp.getOutputStream());
            resp.flushBuffer();
        } catch (Exception e) {
            ExceptionLogger.log(e);
        }
    }
    
```
