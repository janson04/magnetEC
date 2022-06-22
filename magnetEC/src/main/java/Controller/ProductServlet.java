package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Dao.ProductDao;
import Model.EnumProductFullName;
import Model.Product;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> l = null;
		//Parameter.magnetType沒給，就顯示所有產品
		if(request.getParameter("magnetType") == null) {
			request.setAttribute("magnetType","all");
			l = new ProductDao().queryAllList();
			
			request.setAttribute("magnetTypeFullName","全部");
		}else {
			request.setAttribute("magnetType",request.getParameter("magnetType"));
			l = new ProductDao().queryListforCategory(request.getParameter("magnetType"));
			
			//把簡寫轉換成全稱
			request.setAttribute("magnetTypeFullName",EnumProductFullName.valueOf(request.getParameter("magnetType")).getFullName());
		}
		
		//判斷Parameter.page，沒給就是1
		if(request.getParameter("page") == null || request.getParameter("page").equals("0")) {
			request.setAttribute("page","1");
		}else {
			request.setAttribute("page",request.getParameter("page"));
		}

		request.setAttribute("magnetShowList", l);
		request.getRequestDispatcher("product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
