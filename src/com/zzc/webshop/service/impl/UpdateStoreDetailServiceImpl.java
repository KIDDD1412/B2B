package com.zzc.webshop.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.zzc.webshop.service.UpdateStoreDetailService;
import com.zzc.webshop.mapper.UpdateStoreDetailMapper;
import com.zzc.webshop.po.Goods;
import com.zzc.webshop.util.MyUtil;

@Service("updateStoreDetailService")
@Transactional
public class UpdateStoreDetailServiceImpl implements UpdateStoreDetailService {
	@Autowired
	private UpdateStoreDetailMapper updateStoreDetailDao;
	/**
	 * 添加或更新
	 */
	@Override
	public String addOrUpdateGoods(Goods goods, HttpServletRequest request, String updateAct,HttpSession session) {
		/*上传文件的保存位置"/logos"，该位置是指
		workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps，
		发布后使用*/
		//防止文件名重名
		String newFileName = "";
		String fileName = goods.getLogoImage().getOriginalFilename(); 
		//选择了文件
		if(fileName.length() > 0){
			String realpath = request.getServletContext().getRealPath("logos");
			//实现文件上传
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			//防止文件名重名
			newFileName = MyUtil.getStringID() + fileType;
			goods.setGpicture(newFileName);
			File targetFile = new File(realpath, newFileName); 
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        } 
			//上传 
	        try {   
	        	goods.getLogoImage().transferTo(targetFile);
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		}
		goods.setSellerId(MyUtil.getUserId(session));
		goods.setSid(MyUtil.getStoreId(session));
		goods.setGstatus(0);
		System.out.println("goods.getSid()"+goods.getSid());
		//修改
		if("update".equals(updateAct)){//updateAct不能与act重名，因为使用了转发
			//修改到数据库
	       if(updateStoreDetailDao.updateGoodsById(goods) > 0){
	        	return "forward:/updateStoreDetail/selectGoods?act=updateSelect";
	        }else{
	        	return "/updateStoreDetail/updateAgoods";
	       }
		}
		//添加
		else{
			//保存到数据库
			if(updateStoreDetailDao.addGoods(goods) > 0){
				//转发到查询的controller
				return  "forward:/updateStoreDetail/selectGoods";
			}else{
				return "cart/addCart";
//				return "card/addCard";
			}
		}
	}
	/**
	 * 查询商品
	 */
	@Override
	public String selectGoods(Model model, Integer pageCur, String act,Integer storen) {
		List<Goods> allGoods = updateStoreDetailDao.selectGoods(storen);
		int temp = allGoods.size();
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
		map.put("storen", storen);
		allGoods = updateStoreDetailDao.selectAllGoodsByPage(map);
		model.addAttribute("allGoods", allGoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//删除查询
		if("deleteSelect".equals(act)){
			return "pages3/deleteSelectGoods";
		}
		//修改查询
		else if("updateSelect".equals(act)){
			return "pages3/updateSelectGoods";
		}else{
			return "pages3/selectGoods";
		}
	}
	/**
	 * 查询一个商品
	 */
	@Override
	public String selectAGoods(Model model, Integer id, String act) {
		Goods agoods = updateStoreDetailDao.selectGoodsById(id);
		model.addAttribute("goods", agoods);
		//修改页面
		if("updateAgoods".equals(act)){
			return "pages3/updateAgoods";
		}
		//详情页面
		return "pages3/goods";
	}
	/**
	 * 删除多个商品
	 */
	@Override
	public String deleteGoods(Integer[] ids, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < ids.length; i++) {
			list.add(ids[i]);
		}
		updateStoreDetailDao.deleteGoods(list);
		model.addAttribute("msg", "成功下架商品！");
		return "forward:/updateStoreDetail/selectGoods?act=deleteSelect";
	}
	/**
	 * 删除一个商品
	 */
	@Override
	public String deleteAGoods(Integer id, Model model) {
		updateStoreDetailDao.deleteAGoods(id);
		model.addAttribute("msg", "成功下架商品！");
		return "forward:/updateStoreDetail/selectGoods?act=deleteSelect";
	}
}
