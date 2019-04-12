package pl.coderslab.app;

import org.apache.commons.lang3.StringUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.app.user.User;
import pl.coderslab.app.user.UserRepository;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String login() {
        return "login";
    }

    @PostMapping("/")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        boolean isLogged = false;
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            model.addAttribute("isLogged", isLogged);
            return "login";
        }
        User user = userRepository.findByUsername(username);
        if (user != null) {
            isLogged = BCrypt.checkpw(password, user.getPassword());
        }
        if (isLogged) {
            return "redirect:books/list";
        }
        model.addAttribute("isLogged", isLogged);
        return "login";
    }

}
