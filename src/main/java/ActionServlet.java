import bean.Note;
import bean.Stock;
import net.sf.json.JSONArray;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
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
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
            String username =request.getParameter("uname");
            System.out.println("username:" + username);
            if("Tom".equals(username)){
                out.print("no");
            }else{
                out.print("yes");
            }
        }else if(action.equals("/getStock")){
            //Integer size = new Integer(request.getParameter("size"));
            List<Stock> stocks = new ArrayList<Stock>();
            Random r = new Random();
            //for(int i = 0 ;i<size ; i ++){
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
        }else if(action.equals("/fileprocess")){
            //step1,创建一个DiskFileItemFactory对象，用来为解析器提供解析时的缺省的配置
            DiskFileItemFactory dfif = new DiskFileItemFactory();
            //step2,创建解析器
            ServletFileUpload sfu = new ServletFileUpload(dfif);
            //step3,使用解析器解析
            try {
                //解析器会将解析之后的结果封装到FileItem对象里面(一个表单域对应一个FileItem对象)
                List<FileItem> items=sfu.parseRequest(request);
                for(int i=0;i<items.size();i++){
                    FileItem item=items.get(i);
                    if(item.isFormField()){
                        //普通表单域
                        String name=item.getFieldName();
                        String value=item.getString();
                        System.out.println(name+" "+value);
                    }else{
                        ServletContext sctx=getServletContext();  //上传文件域
                        //依据逻辑路径获得实际部署时的物理路径。
                        String path=sctx.getRealPath("/upload");
                        System.out.println(path);
                        String fileName=item.getName();  //获得上传文件的名称
                        File file = new File(path+File.separator+fileName);
                        item.write(file);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(action.equals("/note")){
            List<Note> notes = new ArrayList<Note>();
            Note note=new Note();
            note.setId("01");
            note.setName("java变量");
            Note note1=new Note();
            note1.setId("02");
            note1.setName("php变量");
            notes.add(note);
            notes.add(note1);
            JSONArray arry = JSONArray.fromObject(notes);
            String jsonStr = arry.toString();
            out.println(jsonStr);
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
