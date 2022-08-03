package service;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import dao.ProductDaoImpl;
import model.Product;


@Path("/search/")
public class SearchService {
	@Context private HttpServletRequest request;     //宣告 HttpServletRequest
	@Context private HttpServletResponse response;   //宣告 HttpServletResponse
	
	@GET
	@Path("/p={searchKeywords}")
    @Produces(MediaType.TEXT_HTML)
    public Response searchKeywords(@PathParam("searchKeywords") String keywords) throws URISyntaxException {
		String[] searchKeywords = new String[] {};
		if (keywords.length() > 0) {
			searchKeywords = keywords.split(" ");
			System.out.println(searchKeywords);
		}
		
		List<Product> l = new ProductDaoImpl().searchKeywords(searchKeywords);
		for (Product p:l) {
			System.out.println(p.getProductName());
		}
		
		//把英文簡稱轉換成全名
		request.setAttribute("magnetTypeFullName","搜尋");
		request.setAttribute("magnetShowListSize",l.size());
		request.setAttribute("magnetShowMaxPage",Math.ceil(l.size()/8.0));
		request.setAttribute("magnetShowList", l);
		
		//Servlet寫法
		//request.getRequestDispatcher("/magnetEC/product.jsp").forward(request, response);
		
		Response response = Response.ok(new URI("/magnetEC/product.jsp")).build();
		System.out.println(request.getRequestURI());
        System.out.println(response.getStatus());
        
        return response;
    }
	
}
