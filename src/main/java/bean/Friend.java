package bean;

/**
 * Created by 热带雨林 on 2018/10/5.
 */
public class Friend {
    private String name;
    private int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return this.name+"   "+this.age;
    }
}
