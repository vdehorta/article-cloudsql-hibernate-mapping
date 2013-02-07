<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.vdehorta.newsletter.HibernateConfigSingleton" %>
<%@ page import="com.vdehorta.newsletter.Article" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <body>

<table style="border: 1px solid black">
<tbody>
<tr>
<th style="margin: 5px">Id</th>
<th style="margin: 5px">Title</th>
<th style="margin: 5px">Text</th>
</tr> 
<%
HibernateConfigSingleton hibernateConfig = HibernateConfigSingleton.getInstance();
Session hibernateSession = hibernateConfig.getSessionFactory().openSession();
hibernateSession.beginTransaction();
for (Object obj : hibernateSession.createQuery( "from Article" ).list()) {
	Article article = (Article) obj;
	pageContext.setAttribute("title", article.getTitle());
	pageContext.setAttribute("text", article.getText());
	pageContext.setAttribute("id", article.getId()); %>

<tr>
<td><%=article.getId()%></td>
<td><%=article.getTitle()%></td>
<td><%=article.getText()%></td>
</tr>

<% }
hibernateSession.getTransaction().commit();
hibernateSession.close(); %>
</tbody>
</table>
<br />
<br />
<p><strong>New article</strong></p>
<form action="/article" method="post">
    <div>Title : <input type="text" name="title"></input></div>
    <div>Text :
    <br /><textarea name="text" rows="3" cols="60"></textarea>
    </div>
    <div><input type="submit" value="Create" /></div>
  </form>
  </body>
</html>