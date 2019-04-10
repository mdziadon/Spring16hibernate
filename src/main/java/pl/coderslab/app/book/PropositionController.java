package pl.coderslab.app.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.app.author.Author;
import pl.coderslab.app.author.AuthorService;
import pl.coderslab.app.publisher.Publisher;
import pl.coderslab.app.publisher.PublisherService;

import java.util.List;

@Controller
@RequestMapping("/propositions")
public class PropositionController {

    @Autowired
    private BookService bookService;

    @Autowired
    private PublisherService publisherService;

    @Autowired
    private AuthorService authorService;


    @GetMapping("/list")
    public String getList(Model model) {
        List<Book> propositions = bookService.findAllPropositions();
        model.addAttribute("propositions", propositions);
        return "propositionList";
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("book", new Book());
        return "book";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute @Validated(PropositionValidationGroup.class) Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "book";
        }
        book.setProposition(true);
        bookService.create(book);
        return "redirect:list";
    }

    @ModelAttribute("publishers")
    public List<Publisher> getPublishers() {
        return publisherService.findAll();
    }

    @ModelAttribute("authors")
    public List<Author> getAuthors() {
        return authorService.findAll();
    }

}
