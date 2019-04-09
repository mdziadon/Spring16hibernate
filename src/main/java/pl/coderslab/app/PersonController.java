package pl.coderslab.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/persons")
public class PersonController {

    @Autowired
    private PersonDao personDao;

    @GetMapping("/add")
    public String add() {
        return "person";
    }

    @PostMapping("/add")
    @ResponseBody
    public String addPost(@RequestParam String login, @RequestParam String password, @RequestParam String email) {
        Person person = new Person();
        person.setLogin(login);
        person.setPassword(password);
        person.setEmail(email);
        personDao.create(person);
        return person.toString();
    }

}
