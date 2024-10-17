

----TABLA COMPRASFINAL2016 --- 


ALTER TABLE ComprasFinal2016
ALTER COLUMN Marca INT NOT NULL;

-- Agregar clave foránea que vincula la columna Marca con la tabla MARCA
ALTER TABLE ComprasFinal2016
ADD CONSTRAINT FK_Compras_Marca
FOREIGN KEY (Marca) REFERENCES MARCA(Marca);

-- Agregar clave foránea que vincula la columna NumeroProveedor con la tabla Proveedor
ALTER TABLE ComprasFinal2016
ADD CONSTRAINT FK_Compras_NúmeroProveedor
FOREIGN KEY (NúmeroProveedor) REFERENCES Proveedor(NúmeroProveedor);


ALTER TABLE ComprasFinal2016
ALTER COLUMN FechaCompra DATE NOT NULL;

-- Agregar clave foránea que vincula la columna FechaCompra con la tabla Calendario
ALTER TABLE ComprasFinal2016
ADD CONSTRAINT FK_Compras_Fecha
FOREIGN KEY (FechaCompra) REFERENCES Calendario(FECHA);

-----TABLA VENTASFINAL2016 ----- 

ALTER TABLE VentasFinal2016
ALTER COLUMN Marca INT NOT NULL;

-- Agregar clave foránea que vincula Marca con la tabla MARCA
ALTER TABLE VentasFinal2016
ADD CONSTRAINT FK_Ventas_Marca
FOREIGN KEY (Marca) REFERENCES MARCA(Marca);

-- Agregar clave foránea que vincula NumeroProveedor con la tabla Proveedor
ALTER TABLE VentasFinal2016
ADD CONSTRAINT FK_Ventas_NumeroProveedor
FOREIGN KEY (NúmeroProveedor) REFERENCES Proveedor(NúmeroProveedor);

------- TABLA INVENTARIO INICIAL ------ 

ALTER TABLE InventarioInicial
ALTER COLUMN Marca INT NOT NULL;

-- Agregar clave foránea que vincula Marca con la tabla MARCA
ALTER TABLE InventarioInicial
ADD CONSTRAINT FK_InventarioInicial_Marca
FOREIGN KEY (Marca) REFERENCES MARCA(Marca);


------ TABLA INVENTARIO FINAL ----- 
ALTER TABLE InventarioFinal
ALTER COLUMN Marca INT NOT NULL;

ALTER TABLE InventarioFinal
ADD CONSTRAINT FK_InventarioFinal_Marca
FOREIGN KEY (Marca) REFERENCES MARCA(Marca);

------- TABLA FACTURAS ----- 



ALTER TABLE Facturas
ALTER COLUMN NúmeroProveedor INT NOT NULL;



-- Agregar clave foránea que vincula NumeroProveedorID con la tabla Proveedor
ALTER TABLE Facturas
ADD CONSTRAINT FK_Facturas_NumeroProveedor
FOREIGN KEY (NúmeroProveedor) REFERENCES Proveedor(NúmeroProveedor);
