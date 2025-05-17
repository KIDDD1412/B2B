package com.zzc.webshop.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("userBehaviorDao")
@Mapper
public interface UserBehaviorMapper {
    // 获取用户的浏览记录
    List<Map<String, Object>> getUserBrowseRecords(Integer uid);
    // 获取用户的购买记录
    List<Map<String, Object>> getUserPurchaseRecords(Integer uid);
    // 获取浏览过指定商品的用户记录
    List<Map<String, Object>> getUserBrowseRecordsByGoodsId(Integer gid);

    // 获取购买过指定商品的用户记录
    List<Map<String, Object>> getUserPurchaseRecordsByGoodsId(Integer gid);
}