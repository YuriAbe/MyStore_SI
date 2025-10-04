package br.com.jlgregorio.MyStore.controller;

import br.com.jlgregorio.MyStore.exceptions.ResourceNotFoundException;
import br.com.jlgregorio.MyStore.model.CategoryModel;
import br.com.jlgregorio.MyStore.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
    public String edit(@PathVariable Long id, Model model) {
        CategoryModel category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria não encontrada"));
        model.addAttribute("category", category);
        return "category/form";
    }

    @PostMapping("/{id}")
    public String update(@PathVariable Long id, @ModelAttribute CategoryModel category, 
                        RedirectAttributes redirectAttributes) {
        categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria não encontrada"));
        category.setId(id);
        categoryRepository.save(category);
        redirectAttributes.addFlashAttribute("message", "Categoria atualizada com sucesso!");
        return "redirect:/categories";
    }

    @DeleteMapping("/{id}")
    public String delete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        CategoryModel category = categoryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Categoria não encontrada"));
        try {
            categoryRepository.delete(category);
            redirectAttributes.addFlashAttribute("message", "Categoria excluída com sucesso!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", 
                "Não é possível excluir uma categoria que possui produtos!");
        }
        return "redirect:/categories";
    }
}
