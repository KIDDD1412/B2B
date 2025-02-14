package com.zzc.webshop.service.impl;

import com.zzc.webshop.mapper.AdminMgrMapper;
import com.zzc.webshop.po.Manager;
import com.zzc.webshop.service.AdminMgrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service("adminTypeService")
@Transactional
public class AdminMgrServiceImpl implements AdminMgrService {
	@Autowired
	private AdminMgrMapper adminMgrDao;

	@Override
	public String toAddMgr(@ModelAttribute Manager manager, Model model) {
		model.addAttribute("allMgr", adminMgrDao.selectMgr());
		return "jsp/admin/addMgr";
	}

	@Override
	public String addMgr(Manager manager, Model model) {
		//先控制新插入的数据从当前表最大的id开始+1
		adminMgrDao.auto();
		//再插入
		if(adminMgrDao.addMgr(manager)>0){
			model.addAttribute("msg", "添加成功");
			return "forward:/adminMgr/toAddMgr";
		}
		else{
			model.addAttribute("msg", "添加失败");
			return "forward:/adminMgr/toAddMgr";
		}
	}

	@Override
	public String toDeleteMgr(Model model) {
		model.addAttribute("allMgr", adminMgrDao.selectMgr());
		return "jsp/admin/deleteMgr";
	}

	@Override
	public String deleteMgr(Integer id, Model model) {
		if(adminMgrDao.deleteMgr(id) > 0) {
			model.addAttribute("msg", "删除成功");
			return "forward:/adminMgr/toDeleteMgr";
		}
		else{
			model.addAttribute("msg", "删除失败");
			return "forward:/adminMgr/toDeleteMgr";
		}
	}
	
}
