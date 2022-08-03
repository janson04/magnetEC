package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ProductDaoImpl;
import model.EnumProductFullName;
import model.Product;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> l = null;
		
		//判斷Parameter.page，沒給就是1
		if(request.getParameter("page") == null || request.getParameter("page").equals("0")) {
			request.setAttribute("page","1");
		}else {
			request.setAttribute("page",request.getParameter("page"));
		}

		//Parameter.magnetType沒給，就顯示所有產品
		if(request.getParameter("magnetType") == null || request.getParameter("magnetType").equalsIgnoreCase("all")) {
			request.setAttribute("magnetType","all");
			l = new ProductDaoImpl().queryAllList();
			
			request.setAttribute("magnetTypeFullName","全部磁鐵");
		}else {
			request.setAttribute("magnetType",request.getParameter("magnetType"));
			l = new ProductDaoImpl().queryListforCategory(request.getParameter("magnetType"));
			
			//把英文簡稱轉換成全名
			request.setAttribute("magnetTypeFullName",
						EnumProductFullName.getEnum(request.getParameter("magnetType")) == null ?
						null :
						EnumProductFullName.getEnum(request.getParameter("magnetType")).getFullName()
					);
		}
		
		request.setAttribute("magnetShowListSize",l.size());
		request.setAttribute("magnetShowMaxPage",Math.ceil(l.size()/8.0));
		request.setAttribute("magnetShowList", l);
		request.setAttribute("pagelink", "/magnetEC/product?magnetType=" + request.getParameter("magnetType") + "&");
		if(request.getParameter("magnetType") == null || request.getParameter("magnetType").equalsIgnoreCase("all")) {
			request.getRequestDispatcher("product.jsp?magnetType=all").forward(request, response);
		}else {
			request.getRequestDispatcher("product.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
