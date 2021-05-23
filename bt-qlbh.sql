use quanlibanhang;
select OrdersID, CustomerID,OrderstotalPrice from orders; 
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customerName,p.productName
from customer c 
join orders O ON C.CustomerID=O.CustomerID
join orderdetail odd ON O.OrdersID=odd.OrdersID
join product p on odd.ProductID=p.ProductID; 
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customername 
from customer 
where CustomerID not in (select CustomerID from orders);
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
select o.ordersID,ordersDate,sum(p.productPrice*odd.oderQTY)as total
from orders o
join orderdetail odd on odd.OrdersID=o.OrdersID
join product p on odd.ProductID=p.ProductID
group by orID;
