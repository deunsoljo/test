package koreatech.cse.repository;


import koreatech.cse.domain.Searchable;
import koreatech.cse.domain.User;
import koreatech.cse.repository.provider.UserSqlProvider;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository //저장소 접근 관련한 역할을 하는 Bean 이라는 뜻이다.
public interface UserMapper {
    @Insert("INSERT INTO USERS (NAME, EMAIL, PASSWORD, AGE) VALUES (#{name}, #{email}, #{password}, #{age})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "id", before = false, resultType = int.class)
    void insert(User user);

    @Update("UPDATE USERS SET NAME = #{name}, EMAIL = #{email}, PASSWORD = #{password}, AGE = #{age} WHERE ID = #{id}")
    void update(User user); //
    /*
    User = new User();
    user.setName("hong");
    userMapper.update(user);

    UPDATE USERS SET NAME = hong, EMAIL = NULL, PASSWORD = NULL, AGE = 0 WHERE ID = 0
     */

    @Select("SELECT * FROM USERS WHERE ID = #{id} AND AGE = #{age}")
    User findOne(@Param("id") int id);
    //userMapper.findOne(1);
    //SELECT * FROM USERS WHERE ID = 1

    @Select("SELECT * FROM USERS WHERE AGE = #{a}")
    User findByAge(@Param("a") int age);

    @Delete("DELETE FROM USERS WHERE ID = #{id}")
    void delete(@Param("id") int id);

    @SelectProvider(type = UserSqlProvider.class, method = "findAllByProvider")
    List<User> findByProvider(Searchable searchable);

    //@formatter off    ->스크립트 태그를 사용한다라고 알려줌
    @Select("<script>"
            + "SELECT * FROM USERS" //아무 조건 없어도 기본적으로 나오는 SQL문
            + "<if test='name != null'> WHERE NAME = #{name}</if>"
            + "<if test='name != null and email != null'> OR EMAIL = #{email}</if>"
            + "<if test='orderParam != null'>ORDER BY ${orderParam} DESC</if>"
            + "</script>")
    //@formatter on


    List<User> findByScript(Searchable searchable);

    //SELECT * FROM USERS WHERE NAME = IN('hong', 'kim', 'lee');
    //SELECT * FROM USERS WHERE NAME = IN('hong', 'kim', 'lee', 'park', 'choi');
}
