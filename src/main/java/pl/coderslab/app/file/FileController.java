package pl.coderslab.app.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequestMapping("/files")
public class FileController {

    @Autowired
    private FileService fileService;

    @GetMapping("/list")
    public String list(Model model){
        List<DBFile> files = fileService.findAll();
        model.addAttribute("files", files);
        return "fileList";
    }

    @PostMapping("/list")
    public String uploadFile(@RequestParam("file") MultipartFile file, Model model) {
        fileService.saveFile(file);
        return "redirect:list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        fileService.delete(id);
        return "redirect:../list";
    }

}
