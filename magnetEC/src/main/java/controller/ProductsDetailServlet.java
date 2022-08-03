package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDaoImpl;
import model.EnumProductFullName;
import model.Product;

@WebServlet("/products_detail")
public class ProductsDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductsDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product p = new ProductDaoImpl().queryforProductId(request.getParameter("id"));
		
		if(p == null) {
			//如查詢不到該商品，則轉址至商品購買頁
			response.sendRedirect("product?magnetType=all");
		} else {
			request.getSession().setAttribute("showProduct", p);
			
			//把英文簡稱轉換成全名
			request.setAttribute("magnetTypeFullName",EnumProductFullName.getEnum(p.getCategory())!=null?EnumProductFullName.getEnum(p.getCategory()).getFullName():null);
			
			request.setAttribute("introHtml",p.getIntroHtml().replace("\\n", "\n"));
			
			request.getRequestDispatcher("products_detail.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
