/* Personal info about Customer */
create table if not exists "Customer"
(
    customerId int not null primary key,
    customerName text,
    city text
);
/* Some specific info about Item*/
create table if not exists "Item"
(
    itemId int not null primary key,
    itemName text,
    price double precision
);
/* Our main table that have:
   1) CustomerId, so no need to insert repeating info about Customer
   2) ItemId for same reason
   */
create table if not exists "Order"
(
    orderId int not null primary key,
    date text,
    customerId int,
    FOREIGN KEY (customerId) REFERENCES "Customer"(customerId)
);

create table if not exists OrderItem
(
    orderId int,
    itemId int,
    quant int,
    PRIMARY KEY(orderId, itemId),
    FOREIGN KEY (orderId) REFERENCES "Order"(orderId),
    FOREIGN KEY (itemId) REFERENCES "Order"(itemId);
);
