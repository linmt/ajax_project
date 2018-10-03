package json;

import bean.Stock;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 热带雨林 on 2018/10/3.
 */
public class Test {
    //将一个java对象转换成一个json字符串{"code":"600015","name":"山东高速","price":20}
    public static void test1(){
        Stock s = new Stock();
        s.setCode("600015");
        s.setName("山东高速");
        s.setPrice(20);
        //使用json官方提供的工具来转换
        JSONObject obj =JSONObject.fromObject(s);
        String jsonStr = obj.toString();
        System.out.println(jsonStr);

    }
    /*将java对象组成的数组或者集合转换成json字符串。
     * [{"code":"600011", "name":"山东高速1","price":20},
     * {"code":"600012","name":"山东高速2","price":21},
     * {"code":"600013","name":"山东高速3","price":22}]
     */
    public static void test2(){
        List<Stock> stocks = new ArrayList<Stock>();
        for(int i = 0 ;i < 3; i ++){
            Stock s = new Stock();
            s.setCode("60001" + (i + 1));
            s.setName("山东高速" + (i + 1));
            s.setPrice(20 + i);
            stocks.add(s);
        }
        //fromObject方法里面也可以传递进来一个数组。
        JSONArray arry = JSONArray.fromObject(stocks);
        String jsonStr = arry.toString();
        System.out.println(jsonStr);
    }
    public static void main(String[] args) {
        test2();
    }
}
