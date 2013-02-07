package com.vdehorta.newsletter;
import org.hibernate.Session;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
public class ArticleServlet extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	  throws IOException {
		String title = req.getParameter("title");
		String text = req.getParameter("text");
		Article article = new Article();
		article.setTitle(title);
		article.setText(text);
		
		HibernateConfigSingleton hibernateConfig = HibernateConfigSingleton.getInstance();
		Session session = hibernateConfig.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(article);
		session.getTransaction().commit();
		session.close();
		
		resp.setHeader("Refresh","0; url=/newsletter.jsp");
	}  
}
