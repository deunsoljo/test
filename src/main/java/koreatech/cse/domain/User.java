package koreatech.cse.domain;

public class User {
    private int id;         //primary key (Java로 코딩하지 않고 데이터베이스에 맡김)
    private String name;    // -> name
    private String email;   // -> email
    private String password;
    //private String homeAddress; // -> home_adress
    private int age;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    @Override
    public String toString() {
        return "id: " + id + ", name: " + name
                + ", email: " + email + ", password: " + password + ", age: " + age;
    }
}
