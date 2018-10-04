import bean.Stock;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by 热带雨林 on 2018/10/2.
 */
public class ActionServlet extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        //指示服务器用utf-8解码浏览器传过来的数据，如验证账户时的账户名
        //用于post请求
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        String uri = request.getRequestURI();
        String action =uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
        if(action.equals("/getNumber")){
            Random r = new Random();
            int number = r.nextInt(1000);
            System.out.println(number);
            out.println(number);
        }else if(action.equals("/check_uname")){
//			try {
//				Thread.sleep(6000);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
            String username =request.getParameter("uname");
            System.out.println("username:" + username);
            if("Tom".equals(username)){
                out.print("no");
            }else{
                out.print("yes");
            }
        }else if(action.equals("/getStock")){
            List<Stock> stocks = new ArrayList<Stock>();
            Random r = new Random();
            for(int i = 0 ;i < 8; i ++){
                Stock s = new Stock();
                s.setCode("60001" + r.nextInt(10));
                s.setName("山东高速" + r.nextInt(10));
                s.setPrice(getPrice(r));
                stocks.add(s);
            }
            JSONArray arry = JSONArray.fromObject(stocks);
            String jsonStr = arry.toString();
            System.out.println(jsonStr);
            out.println(jsonStr);
        }else if(action.equals("/getCities")){
            String province = request.getParameter("province");
            System.out.println(province);
            if("bj".equals(province)){
                out.println("朝阳,cy;海淀,hd");
            }else if("sd".equals(province)){
                out.println("济南,jn;青岛,qd;烟台,yt");
            }else{
                out.println("长沙,cs;岳阳,yy");
            }
        }else if(action.equals("/salary")){
            String flight=request.getParameter("eId");
            if(flight.equals("T10001")){
                out.println("实际工资：10000<br/>个税：2500");
            }else{
                out.println("实际工资：20000<br/>个税：5000");
            }
        }
        out.close();
    }

    private double getPrice(Random r){
        double price = 0;
        BigDecimal b = new BigDecimal(r.nextDouble() * 100);
        price = b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue();
        return price;
    }
}
