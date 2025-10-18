package br.com.jlgregorio.MyStore.controller;

import br.com.jlgregorio.MyStore.exceptions.ResourceNotFoundException;
import br.com.jlgregorio.MyStore.model.CategoryModel;
import br.com.jlgregorio.MyStore.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryRepository categoryRepository;

    @GetMapping
    public String index(Model model) {
        List<CategoryModel> categories = categoryRepository.findAll();
        model.addAttribute("categories", categories);
        return "category/index";
    }

    @GetMapping("/new")
    public String newCategory(Model model) {
        model.addAttribute("category", new CategoryModel());
        return "category/form";
    }

    @PostMapping
    public String create(@ModelAttribute CategoryModel category, RedirectAttributes redirectAttributes) {
        categoryRepository.save(category);
        redirectAttributes.addFlashAttribute("message", "Categoria criada com sucesso!");
        return "redirect:/categories";
    }

    @GetMapping("/{id}/edit")
    public ModelAndView edit(@PathVariable Long id) {
        var found = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria não encontrada"));
        ModelAndView mv = new ModelAndView("category/form");
        mv.addObject("category", found);
        return mv;
    }

    @PutMapping("/{id}")
    public String update(@PathVariable Long id, @ModelAttribute CategoryModel category, RedirectAttributes redirectAttributes) {
        var found = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria não encontrada"));
        found.setName(category.getName());
        categoryRepository.save(found);
        redirectAttributes.addFlashAttribute("message", "Categoria atualizada com sucesso!");
        return "redirect:/categories";
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        var found = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria não encontrada"));
        try {
            categoryRepository.delete(found);
            redirectAttributes.addFlashAttribute("message", "Categoria excluída com sucesso!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Não é possível excluir uma categoria que possui produtos!");
        }
        return "redirect:/categories";
    }

    @GetMapping("/{id}/show")
    public ModelAndView show(@PathVariable Long id) {
        var found = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria não encontrada"));
        ModelAndView mv = new ModelAndView("category/show");
        mv.addObject("category", found);
        return mv;
    }
}
