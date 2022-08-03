package service;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;


import dao.ProductDaoImpl;
import model.Product;


@Path("/")
public class SearchService {
	@Context private HttpServletRequest request;     //宣告 HttpServletRequest
	@Context private HttpServletResponse response;   //宣告 HttpServletResponse
	
	@GET
	@Path("/search")
    //@Produces(MediaType.TEXT_HTML)
	//@Path("/{searchKeywords}")
    //public void searchKeywords(@PathParam("searchKeywords") String keywords) throws IOException, ServletException {
	public void searchKeywords() throws IOException, ServletException {
		String[] searchKeywords = new String[] {};
		String keywords = request.getParameter("keywords");
		
		if (keywords.length() > 0) {
			searchKeywords = keywords.split(" ");
			System.out.println(searchKeywords);
		}
		
		List<Product> l = new ProductDaoImpl().searchKeywords(searchKeywords);
		for (Product p:l) {
			System.out.println(p.getProductName());
		}
		
		//判斷Parameter.page，沒給就是1
		if(request.getParameter("page") == null || request.getParameter("page").equals("0")) {
			request.setAttribute("page","1");
		}else {
			request.setAttribute("page",request.getParameter("page"));
		}
		
		request.setAttribute("magnetTypeFullName","搜尋【"+keywords+"】");
		request.setAttribute("magnetShowListSize",l.size());
		request.setAttribute("magnetShowMaxPage",Math.ceil(l.size()/8.0));
		request.setAttribute("magnetShowList", l);
		request.setAttribute("pagelink", "/magnetEC/rest/search?keywords=" + keywords + "&");
		
		//Servlet寫法
		request.getRequestDispatcher("../product.jsp").forward(request, response);
		
		//RESTful回傳JSON等的寫法
//        Response resp = Response.ok(new URI("http://localhost:8090/magnetEC/test.jsp")).build();
//        return resp;
    }
	
}
