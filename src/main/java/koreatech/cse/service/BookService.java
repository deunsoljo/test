package koreatech.cse.service;

import koreatech.cse.domain.Book;
import koreatech.cse.domain.User;
import koreatech.cse.repository.BookMapper;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class BookService  {
    @Inject
    private BookMapper bookMapper;


    public Boolean register(User user, Book book){
        if(book.getTitle() == null || book.getAuthor() ==  null)
            return false;

        book.setUserId(user.getId());
        bookMapper.insert(book);

        return true;
    }

}
