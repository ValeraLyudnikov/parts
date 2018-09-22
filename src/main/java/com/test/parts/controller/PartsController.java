package com.test.parts.controller;

import com.test.parts.model.Parts;
import com.test.parts.service.PartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PartsController {

	@Autowired
	private PartsService partsService;

	private static String filterValue = "all";

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(@RequestParam Map<String,String> requestParams) {
	    Integer page = (requestParams.get("page") == null) ? null : Integer.parseInt(requestParams.get("page"));
        filterValue = (requestParams.get("filter") == null) ? filterValue : requestParams.get("filter");
        Map<String, String> filters = new HashMap<>();
        filters.put("all", "Все детали");
        filters.put("necessary", "Детали для сборки");
        filters.put("unnecessary", "Опционные материалы");

        if(filters.get(filterValue) == null)
            filterValue = "all";

        ModelAndView modelAndView = new ModelAndView("index");

        List<Parts> parts = partsService.getPartsByFilter(filterValue);
        PagedListHolder<Parts> pagedListHolder = new PagedListHolder<>(parts);

        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        modelAndView.addObject("filters", filters);
        modelAndView.addObject("checkedFilter", filterValue);

        if(page == null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;

        modelAndView.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("parts", pagedListHolder.getPageList());
            modelAndView.addObject("countedComputers", partsService.countPossibleComputers(pagedListHolder.getPageList()));
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("parts", pagedListHolder.getPageList());
            modelAndView.addObject("countedComputers", partsService.countPossibleComputers(pagedListHolder.getPageList()));
        }
		return modelAndView;
	}

    @RequestMapping(value = "/add/", method = RequestMethod.GET)
    public ModelAndView add() {
        return  new ModelAndView("add");
    }

    @RequestMapping(value = "/add/", method = RequestMethod.POST)
    public String addPost(@ModelAttribute("part")@Valid Parts part, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "add";
        }

        partsService.save(part);

        return "redirect:/";
    }

    @RequestMapping(value = "/edit/", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(required = true) Integer part) {
        ModelAndView modelAndView = new ModelAndView("edit");
        if(part == null || part < 1) {
            return new ModelAndView("redirect:/");
        } else {
            modelAndView.addObject("part", partsService.getPartById(part));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/edit/", method = RequestMethod.POST)
    public ModelAndView editPost(@ModelAttribute("part")@Valid Parts part, BindingResult result, Model model) {

        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView("edit");
            mav.addObject("part", part);
            return mav;
        }

        partsService.updatePart(part);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/delete/", method = RequestMethod.GET)
    public String delete(@RequestParam(required = true) Integer part) {

        if(part == null || part < 1) {
            return "redirect:/";
        } else {
            partsService.deletePart(part);
            return "redirect:/";
        }

    }

    @RequestMapping(value = "/search/", produces = "text/plain;charset=UTF-8", method = RequestMethod.GET)
    public ModelAndView search(@RequestParam Map<String,String> requestParams) {
        String text = (requestParams.get("text") == null) ? "" : requestParams.get("text");
        System.out.println(text);

        ModelAndView modelAndView = new ModelAndView("search");
        if(text.equals("")) {
            return modelAndView;
        } else {
            List<Parts> parts = partsService.getSearchingParts(text);
            System.out.println(parts);
            modelAndView.addObject("parts", parts);
        }

        return modelAndView;
    }

    @ModelAttribute("part")
    public Parts formBackingObject() {
        return new Parts();
    }
}
