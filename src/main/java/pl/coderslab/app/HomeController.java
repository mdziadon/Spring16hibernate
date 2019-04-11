package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.app.book.Book;
import pl.coderslab.app.book.BookRepository;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/")
    @ResponseBody
    public String test() {
        List<Book> books = bookRepository.findByCategoryId(1L);
        return books.toString();
    }
}
