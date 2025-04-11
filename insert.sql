-- Insertar categorías.

INSERT INTO categorias (nombre) VALUES
('Laptops'),
('Smartphones'),
('Accesorios'),
('Componentes'),
('Monitores'),
('Repuestos'),
('Tablets'),
('Cámaras'),
('Auriculares'),
('Teclados'),
('Mouses'),
('Discos Duros'),
('Tarjetas Gráficas'),
('Memorias RAM'),
('Impresoras');

-- Insertar proveedores.

INSERT INTO proveedores (nombre, telefono, correo) VALUES
('TechWorld', '555-1234', 'ventas@techworld.com'),
('ElectronixPro', '555-5678', 'contacto@electronixpro.com'),
('GlobalTech', '555-4321', 'soporte@globaltech.com'),
('DigitalStore', '555-8765', 'info@digitalstore.com'),
('MegaProveedor', '555-0000', 'proveedores@megaproveedor.com'),
('SuperTech', '555-2222', 'contacto@supertech.com'),
('Innovatech', '555-3333', 'ventas@innovatech.com'),
('TechSupply', '555-4444', 'info@techsupply.com'),
('GigaProducts', '555-5555', 'ventas@gigaproducts.com'),
('ElectroImports', '555-6666', 'contacto@electroimports.com'),
('TechStorePro', '555-7777', 'soporte@techstorepro.com'),
('ProTechCorp', '555-8888', 'proveedores@protechcorp.com'),
('NextGenTech', '555-9999', 'info@nextgentech.com'),
('HyperElectronix', '555-1010', 'contacto@hyperelectronix.com'),
('EliteElectronics', '555-2020', 'ventas@eliteelectronics.com');


-- Insertar productos.

INSERT INTO productos (nombre, id_categoria, precio, stock, id_proveedor) VALUES
('Laptop Lenovo Ideapad 3', 1, 1899.99, 10, 1),
('MacBook Air M1', 1, 999.00, 5, 2),
('iPhone 13 128GB', 2, 799.00, 8, 2),
('Samsung Galaxy S22', 2, 849.99, 12, 3),
('Mouse Logitech M185', 3, 24.99, 25, 4),
('Teclado Mecánico Redragon', 3, 49.99, 20, 4),
('Memoria RAM 16GB DDR4', 4, 75.00, 18, 5),
('SSD Samsung 1TB', 4, 119.99, 10, 5),
('Monitor LG 24" IPS', 5, 149.99, 7, 1),
('Cable HDMI 2m', 3, 8.99, 30, 3),
('Webcam Logitech C920', 3, 89.99, 6, 1),
('Procesador Ryzen 5 5600X', 4, 229.99, 4, 5),
('Placa Madre MSI B550', 4, 139.99, 9, 5),
('Tablet Samsung Galaxy Tab A7', 2, 269.00, 11, 3),
('Laptop HP Pavilion 15', 1, 749.00, 3, 1);

-- Insertar clientes.

INSERT INTO clientes (nombre, correo, telefono) VALUES
('Juan Pérez', 'juanperez@gmail.com', '3123456789'),
('María Gómez', 'mariagomez@gmail.com', '3223456789'),
('Carlos Torres', 'carlostorres@gmail.com', '3001234567'),
('Laura Martínez', 'lauramartinez@gmail.com', '3104567890'),
('Andrés Rivera', 'andresrivera@gmail.com', '3115678901'),
('Sofía Herrera', 'sofia.herrera@gmail.com', '3206789012'),
('Luis Mendoza', 'luismendoza@gmail.com', '3217890123'),
('Valentina Ríos', 'valen.rios@gmail.com', '3009876543'),
('Daniel Gómez', 'danielgomez@gmail.com', '3101122334'),
('Camila Castro', 'camila.castro@gmail.com', '3022233445'),
('Diego Ruiz', 'diego.ruiz@gmail.com', '3193344556'),
('Lucía Morales', 'lucia.morales@gmail.com', '3144455667'),
('Mateo Cárdenas', 'mateo.cardenas@gmail.com', '3055566778'),
('Isabela Vargas', 'isabela.vargas@gmail.com', '3016677889'),
('Tomás Herrera', 'tomas.herrera@gmail.com', '3037788990');

-- Insertar ventas
INSERT INTO ventas (id_cliente, fecha) VALUES
(1, '2025-03-05'),
(2, '2025-03-06'),
(3, '2025-03-07'),
(4, '2025-03-10'),
(5, '2025-03-15'),
(6, '2025-04-01'),
(7, '2025-04-02'),
(8, '2025-04-10'),
(9, '2025-04-15'),
(10, '2025-05-01'),
(11, '2025-05-02'),
(12, '2025-05-05'),
(13, '2025-05-10'),
(14, '2025-05-12'),
(15, '2025-05-15');