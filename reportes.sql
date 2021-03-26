-- Vista de entradas
select o.referencia_entradas as 'Referencia de entradas',de.fecha_creacion as Fecha ,de.cantidad as Cantidad,o.precioUnitario as 'Precio Unitario',de.observaciones as Observaciones,p.nombre_producto as Producto, te.nomnre_tipos_entrada as 'Tipo de Entrada' from detalle_entradas  de
left join tipos_entrada te on te.id_tipos_entrada=de.tipos_entrada_id_tipos_entrada
inner join ordencompra o on o.id_oden_compra=de.id_orden_compra
inner join producto p on p.id_producto=o.producto_id_producto
order by id_orden_compra;




-- vista de Ordenes de compra

Select  referencia_entradas as 'Referencia de orden Compra', lote_entradas as 'Lote', cantidad as Cantidad, precioUnitario as 'Precio de compra/u', fecha_creacion_entrada as 'Fecha',p.referencia_producto as 'Referencia Producto', p.nombre_producto as 'Producto',pr.nombre_proveedor  from ordencompra o
inner join producto p on o.producto_id_producto=p.id_producto
inner join proveedor pr on pr.id_proveedor=o.proveedor_id_proveedor;
select *from ordencompra;

-- Vista de salidas (datalle)

select  s.referencia_salidas as 'Referencia Salidas', s.cantidad_salidas 'Cantidad', s.fecha_creacion as Fecha, ts.nombre_tipo_salida  as 'Tipo Salida', o.referencia_entradas  as 'Orden Compra', o.precioUnitario as 'Precio de compra /u', p.nombre_producto from salidas s
left join  tipo_salida ts on ts.id_tipo_salida=s.id_tipo_salida
left join ordencompra o on o.id_oden_compra=s.id_orden_compra
inner join producto p on p.id_producto=o.producto_id_producto
order by s.fecha_creacion desc
;



-- Vista de Productos 

select referencia_producto as 'Referencia de producto', p.nombre_producto as 'Producto',p.stock_producto as 'Stock',e.nombre_estado as Estado, m.nombre  as Marca , c.nombre_categoria as 'Categoria' from  producto p
left join estado e on e.id_estado=p.estado_id_estado 
left join marca m on m.id_marca=p.marca_id_marca
left join categoria c on c.id_categoria=p.categoria_id_categoria
order by id_producto;

-- Vista de Producto (Detallado)

select referencia_producto as 'Referencia de producto', p.nombre_producto as 'Producto', c.nombre_categoria as 'Categoria', a.nombre_atributo as 'Atributos Especificos', v.valor as 'Valor Atributo'  from  producto p
left join estado e on e.id_estado=p.estado_id_estado 
left join marca m on m.id_marca=p.marca_id_marca
left join categoria c on c.id_categoria=p.categoria_id_categoria
left join categoria_has_atributo ca on ca.categoria_id_categoria=c.id_categoria
inner join atributo a on a.id_atributo=ca.atributo_id_atributo
inner join valor v on v.atributo_id_atributo=a.id_atributo and v.producto_id_producto=p.id_producto
order by id_producto
 ;



select  * from ordencompra where referencia_entradas='3436567657_1';
select  * from salidas where id_orden_compra=12;

-- Kardex

select salidas.Referencia, o.fecha_creacion_entrada, salidas.Lote, salidas.Producto, Entradas.Cantidad-salidas.Cantidad as Stock, Entradas.Costo -salidas.Costo as "Costo Final" from 
(
select e.referencia_entradas as "Referencia",IFNULL(sum(e.precioUnitario*s.cantidad_salidas),0) as "Costo",e.lote_entradas as Lote ,p.nombre_producto as Producto, IFNULL(sum(s.cantidad_salidas),0) as "Cantidad"
 from ordencompra e
left join salidas s on s.id_orden_compra=e.id_oden_compra
left join tipo_salida ts on ts.id_tipo_salida=s.id_tipo_salida
inner join producto p on p.id_producto=e.producto_id_producto
where ts.id_tipo_salida=1
group by  e.referencia_entradas 
order by e.referencia_entradas) as salidas 
inner join
(
select  e.referencia_entradas as "Referencia",e.lote_entradas as "Lote", sum(e.precioUnitario*de.cantidad) as "Costo",p.nombre_producto as Producto, sum(de.cantidad) as "Cantidad",te.nomnre_tipos_entrada,p.id_producto as "productoid"  
from ordencompra e
inner join detalle_entradas de on de.id_orden_compra=e.id_oden_compra
inner join tipos_entrada te on te.id_tipos_entrada=de.tipos_entrada_id_tipos_entrada
inner join producto p on p.id_producto=e.producto_id_producto
group by  e.referencia_entradas
order by e.referencia_entradas) 
as Entradas on Entradas.Referencia =salidas.Referencia
inner join ordencompra o on o.referencia_entradas=salidas.Referencia
-- WHERE Entradas.productoid=2
order by o.fecha_creacion_entrada
 ;


-- Mas vendidos

Select  Producto, Vendidos-(ifnull(Entradas.devueltos,0)) as Vendidos, salidas.Costo-ifnull(Entradas.Costo,0)  as Costo from
(
select IFNULL(sum(e.precioUnitario*s.cantidad_salidas),0) as "Costo" ,p.nombre_producto as Producto, IFNULL(sum(s.cantidad_salidas),0) as Vendidos, e.producto_id_producto as "productoid"
 from ordencompra e
left join salidas s on s.id_orden_compra=e.id_oden_compra
left join tipo_salida ts on ts.id_tipo_salida=s.id_tipo_salida
inner join producto p on p.id_producto=e.producto_id_producto
where ts.id_tipo_salida=1
group by  e.producto_id_producto
order by Vendidos desc
) as salidas 
left join
(
select  sum(e.precioUnitario*de.cantidad) as "Costo", sum(de.cantidad) as "devueltos",p.id_producto as "productoid"  from ordencompra e
inner join detalle_entradas de on de.id_orden_compra=e.id_oden_compra
inner join tipos_entrada te on te.id_tipos_entrada=de.tipos_entrada_id_tipos_entrada
inner join producto p on p.id_producto=e.producto_id_producto
where de.tipos_entrada_id_tipos_entrada=2
group by  e.producto_id_producto
order by e.referencia_entradas)
as Entradas on Entradas.productoid =salidas.productoid
order by Vendidos desc;



