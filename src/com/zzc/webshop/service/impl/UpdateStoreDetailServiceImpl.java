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
	 * ��ӻ����
	 */
	@Override
	public String addOrUpdateGoods(Goods goods, HttpServletRequest request, String updateAct,HttpSession session) {
		/*�ϴ��ļ��ı���λ��"/logos"����λ����ָ
		workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps��
		������ʹ��*/
		//��ֹ�ļ�������
		String newFileName = "";
		String fileName = goods.getLogoImage().getOriginalFilename(); 
		//ѡ�����ļ�
		if(fileName.length() > 0){
			String realpath = request.getServletContext().getRealPath("logos");
			//ʵ���ļ��ϴ�
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			//��ֹ�ļ�������
			newFileName = MyUtil.getStringID() + fileType;
			goods.setGpicture(newFileName);
			File targetFile = new File(realpath, newFileName); 
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        } 
			//�ϴ� 
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
		//�޸�
		if("update".equals(updateAct)){//updateAct������act��������Ϊʹ����ת��
			//�޸ĵ����ݿ�
	       if(updateStoreDetailDao.updateGoodsById(goods) > 0){
	        	return "forward:/updateStoreDetail/selectGoods?act=updateSelect";
	        }else{
	        	return "/updateStoreDetail/updateAgoods";
	       }
		}
		//���
		else{
			//���浽���ݿ�
			if(updateStoreDetailDao.addGoods(goods) > 0){
				//ת������ѯ��controller
				return  "forward:/updateStoreDetail/selectGoods";
			}else{
				return "cart/addCart";
//				return "card/addCard";
			}
		}
	}
	/**
	 * ��ѯ��Ʒ
	 */
	@Override
	public String selectGoods(Model model, Integer pageCur, String act,Integer storen) {
		List<Goods> allGoods = updateStoreDetailDao.selectGoods(storen);
		int temp = allGoods.size();
		model.addAttribute("totalCount", temp);
		int totalPage = 0;
		if (temp == 0) {
			totalPage = 0;//��ҳ��
		} else {
			//���ش��ڻ��ߵ���ָ�����ʽ����С����
			totalPage = (int) Math.ceil((double) temp / 10);
		}
		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * 10 > temp) {
			pageCur = pageCur - 1;
		}
		//��ҳ��ѯ
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startIndex", (pageCur - 1) * 10);//��ʼλ��
		map.put("perPageSize", 10);//ÿҳ10��
		map.put("storen", storen);
		allGoods = updateStoreDetailDao.selectAllGoodsByPage(map);
		model.addAttribute("allGoods", allGoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		//ɾ����ѯ
		if("deleteSelect".equals(act)){
			return "pages3/deleteSelectGoods";
		}
		//�޸Ĳ�ѯ
		else if("updateSelect".equals(act)){
			return "pages3/updateSelectGoods";
		}else{
			return "pages3/selectGoods";
		}
	}
	/**
	 * ��ѯһ����Ʒ
	 */
	@Override
	public String selectAGoods(Model model, Integer id, String act) {
		Goods agoods = updateStoreDetailDao.selectGoodsById(id);
		model.addAttribute("goods", agoods);
		//�޸�ҳ��
		if("updateAgoods".equals(act)){
			return "pages3/updateAgoods";
		}
		//����ҳ��
		return "pages3/goods";
	}
	/**
	 * ɾ�������Ʒ
	 */
	@Override
	public String deleteGoods(Integer[] ids, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < ids.length; i++) {
			list.add(ids[i]);
		}
		updateStoreDetailDao.deleteGoods(list);
		model.addAttribute("msg", "�ɹ��¼���Ʒ��");
		return "forward:/updateStoreDetail/selectGoods?act=deleteSelect";
	}
	/**
	 * ɾ��һ����Ʒ
	 */
	@Override
	public String deleteAGoods(Integer id, Model model) {
		updateStoreDetailDao.deleteAGoods(id);
		model.addAttribute("msg", "�ɹ��¼���Ʒ��");
		return "forward:/updateStoreDetail/selectGoods?act=deleteSelect";
	}
}
