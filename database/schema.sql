-- Run this against your Azure SQL Database after provisioning

CREATE TABLE products (
    id          INT IDENTITY(1,1) PRIMARY KEY,
    name        NVARCHAR(200)   NOT NULL,
    description NVARCHAR(1000)  NULL,
    price       DECIMAL(10,2)   NOT NULL,
    image_url   NVARCHAR(500)   NULL,
    active      BIT             NOT NULL DEFAULT 1,
    created_at  DATETIME2       NOT NULL DEFAULT GETUTCDATE()
);

INSERT INTO products (name, description, price, image_url) VALUES
('Wireless Headphones',  'Over-ear noise-cancelling headphones with 30h battery',  79.99,  'https://ecommappstorageaccount.blob.core.windows.net/product-images/headphones.png'),
('Mechanical Keyboard',  'TKL mechanical keyboard with blue switches',              49.99,  'https://ecommappstorageaccount.blob.core.windows.net/product-images/keyboard.png'),
('USB-C Hub',            '7-in-1 USB-C hub with HDMI, SD card and USB 3.0 ports',  29.99,  'https://ecommappstorageaccount.blob.core.windows.net/product-images/usbhub.png'),
('Webcam 1080p',         'Full HD webcam with built-in microphone',                 39.99,  'https://ecommappstorageaccount.blob.core.windows.net/product-images/webcam.png'),
('Desk Lamp',            'LED desk lamp with adjustable colour temperature',        24.99,  'https://ecommappstorageaccount.blob.core.windows.net/product-images/lamp.png'),
('Mouse Pad XL',         'Extra-large desk mat, water-resistant surface',            9.99,  'https://ecommappstorageaccount.blob.core.windows.net/product-images/mousepad.png');
