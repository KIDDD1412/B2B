package com.zzc.webshop.mapper;


import java.util.List;

import com.zzc.webshop.po.Order;

public interface OrderMapper {
    public int addOrder(Order order);
    public List<Order> searchBorder(String uid);
    public List<Order> searchSorder(String uid);
    public Order findOrder(String oid);
    public int updateOrder(Order order);
    public int addOrderHistory(Order order);
    public List<Order> findOrderHistory(String oid);
    public Order serchOrderByOid(int oid);
}