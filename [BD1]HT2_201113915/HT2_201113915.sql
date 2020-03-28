create table Cliente (
    IdCliente INTEGER,
    Nombre VARCHAR2(50),
    Apellido1 VARCHAR2(50),
    Apellido2 VARCHAR2(50),
    Observaciones VARCHAR2(50),
    
    CONSTRAINT PK_Cliente 
        PRIMARY KEY (IdCliente)
);

create table Mesa
(
    IdMesa INTEGER,
    NumMaxComensal INTEGER,
    Ubicacion VARCHAR2(50),
    
    CONSTRAINT PK_Mesa
        PRIMARY KEY (IdMesa)
);

create table Camarero
(
    IdCamarero INTEGER,
    Nombre VARCHAR2(50),
    Apellido1 VARCHAR2(50),
    Apellido2 VARCHAR2(50),
    
    CONSTRAINT PK_Camarero
        PRIMARY KEY (IdCamarero)
    
);

create table Cocinero
(
    IdCocinero INTEGER,
    Nombre  VARCHAR2(50),
    Apellido1  VARCHAR2(50),
    Apellido2  VARCHAR2(50),
    
    CONSTRAINT PK_Cocinero
        PRIMARY KEY (IdCocinero)
);

create table Factura
(
    IdFactura INTEGER,
    IdCliente INTEGER,
    IdCamarero INTEGER,
    IdMesa INTEGER,
    FechaFactura DATE,
    
    CONSTRAINT PK_Factura
        PRIMARY KEY (IdFactura),
        
    CONSTRAINT FK1_Factura
        FOREIGN KEY (IdCliente)
            REFERENCES Cliente(IdCliente) ON DELETE CASCADE,
        
    CONSTRAINT FK2_Factura
        FOREIGN KEY (IdCamarero)
            REFERENCES Camarero(IdCamarero) ON DELETE CASCADE,
    
    CONSTRAINT FK3_Factura
        FOREIGN KEY (IdMesa)
            REFERENCES Mesa(IdMesa) ON DELETE CASCADE
);

create table DetalleFactura
(
    IdFactura INTEGER,
    IdDetalleFactura INTEGER,
    IdCocinero INTEGER,
    Plato VARCHAR2(50),
    Importe INTEGER,
    
    CONSTRAINT PK_DetalleFactura
        PRIMARY KEY (IdFactura, IdDetalleFactura),
    
    CONSTRAINT FK1_DetalleFactura
        FOREIGN KEY (IdFactura)
            REFERENCES Factura(IdFactura) ON DELETE CASCADE,
        
    CONSTRAINT FK2_DetalleFactura
        FOREIGN KEY (IdCocinero)
            REFERENCES Cocinero(IdCocinero) ON DELETE CASCADE
    
);

ALTER TABLE Factura
    ADD CONSTRAINT VALIDAR_FACTURA
        CHECK (IdFactura BETWEEN 3000 AND 8000);
        
ALTER TABLE Factura 
    ADD CONSTRAINT VALIDAR_FECHA_HORA 
        CHECK (
            FechaFactura BETWEEN 
                    TO_DATE('2015-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS') 
                    AND 
                    TO_DATE('2025-12-31 00:00:00','YYYY-MM-DD HH24:MI:SS')
        );

ALTER TABLE DetalleFactura
    ADD CONSTRAINT VALIDAR_LETRA
        CHECK (UPPER(SUBSTR(Plato,1,1)) = 'S');   

ALTER TABLE DetalleFactura
    ADD CONSTRAINT VALIDAR_PLATO
        UNIQUE (Plato);    

ALTER TABLE DetalleFactura
    ADD CONSTRAINT VALIDAR_IMPORTE
        CHECK (Importe > 75);

insert into CLIENTE (IdCliente, Nombre, Apellido1, Apellido2, Observaciones) 
    values (1, 'Victor', 'Lopez', 'Morales', 'Observacion 1');
insert into CLIENTE (IdCliente, Nombre, Apellido1, Apellido2, Observaciones) 
    values (2, 'Angel', 'Perez', 'Orozco', 'Observacion 2');
insert into CLIENTE (IdCliente, Nombre, Apellido1, Apellido2, Observaciones) 
    values (3, 'Pedro', 'Medina', 'Ramirez', 'Observacion 3');
insert into CLIENTE (IdCliente, Nombre, Apellido1, Apellido2, Observaciones) 
    values (4, 'Saul', 'Blanco', 'Cano', 'Observacion 4');
insert into CLIENTE (IdCliente, Nombre, Apellido1, Apellido2, Observaciones) 
    values (5, 'Juan', 'Perez', 'Gonzalez', 'Observacion 5');

insert into MESA (IdMesa, NumMaxComensal, Ubicacion) 
    values (1, '16', 'Ubicacion 1');
insert into MESA (IdMesa, NumMaxComensal, Ubicacion) 
    values (2, '8', 'Ubicacion 2');
insert into MESA (IdMesa, NumMaxComensal, Ubicacion) 
    values (3, '6', 'Ubicacion 3');
insert into MESA (IdMesa, NumMaxComensal, Ubicacion) 
    values (4, '4', 'Ubicacion 4');
insert into MESA (IdMesa, NumMaxComensal, Ubicacion) 
    values (5, '2', 'Ubicacion 5');

insert into CAMARERO (IdCamarero, Nombre, Apellido1, Apellido2) 
    values (1, 'Antonio', 'Perez', 'Blanco');
insert into CAMARERO (IdCamarero, Nombre, Apellido1, Apellido2) 
    values (2, 'Jose', 'Arriola', 'Lopez');
insert into CAMARERO (IdCamarero, Nombre, Apellido1, Apellido2) 
    values (3, 'Edgar', 'Morales', 'Rodas');

insert into COCINERO (IdCocinero, Nombre, Apellido1, Apellido2) 
    values (1, 'Javier', 'Rosa', 'Mazariegos');
insert into COCINERO (IdCocinero, Nombre, Apellido1, Apellido2) 
    values (2, 'Alexander', 'Enriquez', 'Leiva');
insert into COCINERO (IdCocinero, Nombre, Apellido1, Apellido2) 
    values (3, 'Miguel', 'Juarez', 'Pinto');

insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3001, 5, 2, 5, TO_DATE('2020-02-02', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3002, 1, 2, 2, TO_DATE('2020-02-07', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3003, 3, 1, 2, TO_DATE('2020-02-13', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3004, 1, 1, 3, TO_DATE('2020-02-20', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3005, 2, 3, 1, TO_DATE('2020-02-27', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3006, 2, 3, 5, TO_DATE('2020-02-04', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3007, 2, 2, 1, TO_DATE('2020-02-11', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3008, 4, 3, 4, TO_DATE('2020-02-18', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3009, 1, 3, 1, TO_DATE('2020-02-25', 'YYYY-MM-DD'));
insert into FACTURA (IdFactura, IdCliente, IdCamarero, IdMesa, FechaFactura) 
    values (3010, 3, 1, 1, TO_DATE('2020-01-13', 'YYYY-MM-DD'));

insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3001, 1, 3, 'Salami', 104.34);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3007, 2, 3, 'Salchicha', 225.82);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3006, 3, 2, 'Salsa', 136.92);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3002, 4, 3, 'Sandwich', 239.53);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3002, 5, 3, 'Sopa', 176.39);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3009, 6, 2, 'Sardina', 126.73);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3002, 7, 3, 'Salchipapa', 212.55);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3010, 8, 2, 'Sandia', 90.56);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3003, 9, 1, 'Spagetti', 232.74);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3004, 10, 2, 'Setas', 103.38);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3001, 11, 3, 'Salmon', 160.11);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3006, 12, 1, 'Salpicon', 190.73);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3008, 13, 1, 'Sushi', 119.1);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3005, 14, 3, 'Soufle', 114.37);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3005, 15, 1, 'Soda', 152.8);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3004, 16, 3, 'Soya', 241.91);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3002, 17, 2, 'Salsa bolognesa', 101.31);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3006, 18, 3, 'Salmon ahumado', 229.71);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3009, 19, 3, 'Sofritos de pollo', 222.02);
insert into DETALLEFACTURA (IdFactura, IdDetalleFactura, IdCocinero, Plato, Importe) 
    values (3005, 20, 1, 'Sopa de fideos', 123.7);

select detallefactura.plato 
    from detallefactura 
        inner join factura using (idfactura)
            where detallefactura.idcocinero = 2 
                and factura.idmesa=1;
            
select idcamarero, camarero.nombre, camarero.apellido1, camarero.apellido2, count(factura.idfactura) as "CANTIDAD FACTURA"
    from factura  
        inner join camarero using (idcamarero) 
            group by idcamarero, camarero.nombre, camarero.apellido1, camarero.apellido2; 
                        
select idcliente, cliente.nombre, cliente.apellido1, cliente.apellido2, sum(detallefactura.importe) as "IMPORTE TOTAL"
    from cliente 
        inner join factura using(idcliente)
        inner join detallefactura using(idfactura)
                group by idcliente, cliente.nombre, cliente.apellido1, cliente.apellido2
                    having sum(detallefactura.importe)>400.00;
                    
select * from (
    select 'Mesa'||factura.idmesa as mesa, count(*) as "PLATILLOS SERVIDOS"
        from factura
            inner join detallefactura
                on factura.idfactura = detallefactura.idfactura
                    group by factura.idmesa
                    order by count(*) desc
) 
where rownum <=3;

select nombre, apellido1, apellido2, count(total) as "CONSUMO MESA > 200" from 
(
    select cliente.nombre as nombre, cliente.apellido1 as apellido1, cliente.apellido2 as apellido2, idfactura, sum(detallefactura.importe) as total
        from cliente
            inner join factura using(idcliente)
            inner join detallefactura using(idfactura)
                group by cliente.nombre, cliente.apellido1, cliente.apellido2, idfactura
                    having sum(detallefactura.importe)>200
) 
group by nombre, apellido1, apellido2 
    having  count(total) > 1;

select 'Camarero'||idcamarero as camarero, camarero.nombre, camarero.apellido1, camarero.apellido2, (count(idcamarero)*100 / sum(count(*)) over()) || ' %' as Porcentaje
    from camarero 
        inner join factura using (idcamarero) 
            group by idcamarero, camarero.nombre, camarero.apellido1, camarero.apellido2
            order by idcamarero;
            
select  nombre, apellido1, apellido2, semana, sum(importe) as "VENTA SEMANAL" from
(
    select camarero.nombre as nombre, camarero.apellido1 as apellido1, camarero.apellido2 as apellido2, detallefactura.importe as importe, to_char(factura.fechafactura,'W') as semana, to_char(factura.fechafactura,'MM') as mes from camarero
        inner join factura using (idcamarero)
        inner join detallefactura using (idfactura)
)
group by nombre, apellido1, apellido2, mes, semana
    having mes = to_char(current_date,'MM')
        order by semana;