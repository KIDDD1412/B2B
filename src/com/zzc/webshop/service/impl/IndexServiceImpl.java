package com.zzc.webshop.service.impl;

import com.zzc.webshop.po.Goods;
import com.zzc.webshop.po.User;
import com.zzc.webshop.service.IndexService;
import com.zzc.webshop.mapper.IndexMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService {
	@Autowired
	private IndexMapper indexDao;
	
	@Override
	public String before(Model model, HttpSession session, Goods goods, Integer pageCur) {
		// ��ѯ����״̬Ϊ 1 ����Ʒ����
		int totalCount = indexDao.getGoodsCount(goods);
		model.addAttribute("totalCount", totalCount);

		int totalPage = 0;
		int perPageSize = 24; // ÿҳ��ʾ 24 ����¼
		if (totalCount == 0) {
			totalPage = 0;
		} else {
			totalPage = (int) Math.ceil((double) totalCount / perPageSize);
		}

		if (pageCur == null) {
			pageCur = 1;
		}
		if ((pageCur - 1) * perPageSize > totalCount) {
			pageCur = pageCur - 1;
		}

		// ��ҳ��ѯ
		Map<String, Object> map = new HashMap<>();
		map.put("startIndex", (pageCur - 1) * perPageSize);
		map.put("perPageSize", perPageSize);
		map.put("goods", goods);

		List<Goods> lastedlist = indexDao.getGoodsByPage(map);
		model.addAttribute("lastedlist", lastedlist);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);

		return "pages2/index";
	}

	@Override
	public String toRegister(Model model) {
		model.addAttribute("ruser", new User());
		return "pages2/register";
	}

	//��¼
	@Override
	public String toLogin(Model model) {
		model.addAttribute("luser", new User());
		return "pages2/login";
	}

	@Override
	public String search(Model model, String mykey) {
		List<Goods> list = indexDao.search(mykey);
		model.addAttribute("searchlist", list);
		System.out.println(mykey);
		return "pages2/searchResult";
	}
	
	
}
