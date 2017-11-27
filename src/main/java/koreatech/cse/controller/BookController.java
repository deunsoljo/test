package koreatech.cse.controller;

import koreatech.cse.domain.Book;
import koreatech.cse.domain.Searchable;
import koreatech.cse.domain.User;
import koreatech.cse.repository.BookMapper;
import koreatech.cse.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.inject.Inject;

@Controller
@RequestMapping("/book")
public class BookController {
    @Inject
    private BookMapper bookMapper;
    @Inject
    private BookService bookService;

    @RequestMapping("/register")
    public String register(Model model) {
        Book book = new Book();
        model.addAttribute("book", book);
        return "register";
    }

    @Transactional
    @RequestMapping(value="/register", method= RequestMethod.POST)
    public String register(@ModelAttribute Book book) {
        User user = User.current();
        bookService.register(user, book);
        return "redirect:/book/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, @RequestParam(required=false) String title, @RequestParam(required=false) String author) {
        Searchable searchable = new Searchable();
        searchable.setTitle(title);
        searchable.setAuthor(author);
        model.addAttribute("books", bookMapper.findByProvider(searchable));
        model.addAttribute("books", bookMapper.findByScript(searchable));
        return "list";
    }


    @RequestMapping(value="/delete", method = RequestMethod.GET)
    public String delete(@RequestParam int id) {    //book의 id
        //User 객체 Authorities 멤버 변수를 통해서 관리자인지 체크, Book의 UserId와 User의 Id가 같으면 ...
        Book book = bookMapper.findOne(id);
        User user = User.current();

        if(user.getId() == book.getUserId() || user.hasRole("ROLE_ADMIN")) {
            bookMapper.delete(id);
        }
        return "redirect:/book/list";
    }

}
