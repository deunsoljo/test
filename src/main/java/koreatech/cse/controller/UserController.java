package koreatech.cse.controller;

import koreatech.cse.domain.Searchable;
import koreatech.cse.domain.User;
import koreatech.cse.repository.UserMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import java.util.List;

@Controller

@RequestMapping("/user")
public class UserController {
    @Inject
    private UserMapper userMapper;


    @RequestMapping("/signup")
    public String signup(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "signup";
    }

    @Transactional      //오류 발생시 원상복구(Rollback)
    @RequestMapping(value="/signup", method= RequestMethod.POST)
    public String signup(@ModelAttribute User user, BindingResult result) {
        if (result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors ) {
                System.out.println (error.getObjectName() + " - " + error.getDefaultMessage());
            }
        }

        userMapper.insert(user);    //실제로 DB에 ㅏㅅㅂ입
        double i = 3 / 0;       //오류를 발생시키는 코드 (0으로 나누는 오류)
        System.out.println("i = " + i);
        System.out.println("user = " + user);
        return "redirect:/user/list";

    }

    @RequestMapping("/edit")
    public String edit(Model model, @RequestParam int id) {
        User user = userMapper.findOne(id);
        model.addAttribute("user", user);
        return "edit";
    }

    @RequestMapping(value="/edit", method= RequestMethod.POST)
    public String edit(@ModelAttribute User user) {
        userMapper.update(user);
        return "redirect:/user/list";

    }

    @RequestMapping(value="/delete", method= RequestMethod.GET)
    public String delete(@RequestParam int id) {
        userMapper.delete(id);
        return "redirect:/user/list";

    }

    /*
        /user/list
        /user/list?name=hong
        /user/list?name=hong&email=hong@koreatech.ac.kr
        /user/list?name=hong&email=hong@koreatech.ac.kr&order=email
     */

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model,
                       @RequestParam(required=false) String name,
                       @RequestParam(required=false) String email,
                       @RequestParam(required=false) String order) {
        Searchable searchable = new Searchable();
        searchable.setName(name);   //hong
        searchable.setEmail(email); //hong@koreatech.ac.kr
        searchable.setOrderParam(order);    //email
        //model.addAttribute("users", userMapper.findByProvider(searchable));
        model.addAttribute("users", userMapper.findByScript(searchable));
        return "list";
    }

}
