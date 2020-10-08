package project.spring.myAct.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import project.spring.myAct.dao.MyActDAO;
import project.spring.myAct.vo.TitleListDTO;

@Service
public class MyActServiceImpl implements MyActService{
	
	@Autowired
	private MyActDAO myActDAO = null;

	@Override
	public int insertItem() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateItem() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteItem() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertItem(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateItem(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteItem(Object obj) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int myArticleCount(String memId) {
		int count = myActDAO.myArticleCount(memId);
		return count;
	}
	
	@Override
	public List getMyArticle(String memId) {
		List articleList = myActDAO.getMyArticles(memId);
		return articleList;
	}

	@Override
	public int likeArticleCount(String memId) {
		int count = myActDAO.myLikeArticleCount(memId);
		return count;
	}

	@Override
	public List myLikeArticle(String memId) {
		List articleList = myActDAO.myLikeArticle(memId);
		
		return articleList;
	}
	
	@Override
	public List getMyTitle(String memId) {
		List titleList = myActDAO.getMyTitle(memId);
		return titleList;
	}

	@Override
	public List updateTitle(String memId) {
		List updateTitle = myActDAO.updateTitle(memId); 
		return updateTitle;
	}
	
	@Override
	public List getAllTitle() {
		List getAllTitle = myActDAO.getAllTitle(); 
		return getAllTitle;
	}

	@Override
	public List myLikeDrink(String memId) {
		List articleList = myActDAO.getLikeDrink(memId);
		return articleList;
	}
	
	@Override
	public List myLikeProduct(String memId) {
		List articleList = myActDAO.getLikeProduct(memId);
		return articleList;
	}


	  
	
	

}
