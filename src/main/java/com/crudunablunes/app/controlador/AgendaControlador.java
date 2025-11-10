package com.crudunablunes.app.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.crudunablunes.app.entidades.Agenda;
import com.crudunablunes.app.repositorio.RepositorioAgenda;

@Controller
public class AgendaControlador {

    @Autowired
    private RepositorioAgenda agendaRepository;

    // Mapeo para la página principal (el formulario)
    @GetMapping("/")
    public String paginaPrincipal(Model model) {
        model.addAttribute("agenda", new Agenda());
        return "index"; // Llama a index.html
    }

    // Mapeo para guardar un contacto
    @PostMapping("/guardar")
    public String guardarContacto(@Validated @ModelAttribute Agenda agenda) {
        agendaRepository.save(agenda);
        return "redirect:/listar"; // Redirige a la página de listar
    }

    // Mapeo para ver la lista de contactos
    @GetMapping("/listar")
    public String listarContactos(Model model) {
        model.addAttribute("agendas", agendaRepository.findAll());
        return "listar"; // Llama a listar.html
    }
}