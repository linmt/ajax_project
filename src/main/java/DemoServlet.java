import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 热带雨林 on 2018/10/2.
 */
public class DemoServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("开始");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        out.println("上证指数：35");
        out.flush();
        out.close();
        System.out.println("结束");
    }
}
