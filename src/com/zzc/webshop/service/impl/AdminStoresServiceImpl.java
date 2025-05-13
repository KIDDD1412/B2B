package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.AdminStoresMapper;
import com.zzc.webshop.po.Store;
import com.zzc.webshop.service.AdminStoresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("adminStoresService")
@Transactional
public class AdminStoresServiceImpl implements AdminStoresService {
	@Autowired
	private AdminStoresMapper adminStoresDao;
	/**
	 * 审核店铺
	 */
	@Override
	public String addOrUpdateStores(Store stores, Model model) {
        //修改到数据库
		if(adminStoresDao.updateStoresById(stores) > 0){
			model.addAttribute("msg", "审核成功！");
			return "redirect:/adminStores/selectStores";
		}else{
			model.addAttribute("msg", "审核失败！");
			return "redirect:/adminStores/selectStores";
		}
	}
	/**
	 * 查询店铺
	 */
	@Override
	public String selectStores(Model model, Integer pageCur, String act) {
		List<Store> allStores = adminStoresDao.selectStores();
		int temp = allStores.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//总页数
		} else {
			//返回大于或者等于指定表达式的最小整数
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}
		//分页查询
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 10);//起始位置
		map.put("perPageSize", 10);//每页10个
		allStores = adminStoresDao.selectAllStoresByPage(map);
		model.addAttribute("allStores", allStores);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//审核查询
		if("updateSelect".equals(act)){
			return "jsp/admin/updateSelectStores";
		}else{
			return "jsp/admin/selectStores";
		}
	}
	/**
	 * 审核一个店铺
	 */
	@Override
	public String selectAStores(Model model, Integer id, String act) {
		Store astores = adminStoresDao.selectStoresById(id);
		model.addAttribute("stores", astores);
		//审核页面
		if("updateAstores".equals(act)){
			return "jsp/admin/updateAstores";
		}
		return "jsp/admin/updateSelectStores";
	}
}
