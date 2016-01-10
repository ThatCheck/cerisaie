package Cerisaie.Controller;

import Cerisaie.Repository.ClientRepository;
import Cerisaie.Repository.EmplacementRepository;
import Cerisaie.Repository.SejourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Cabbibi on 10/01/2016.
 */
@Controller
public class DefaultController {

    @Autowired
    ClientRepository clientRepository;

    @Autowired
    EmplacementRepository emplacementRepository;

    @Autowired
    SejourRepository sejourRepository;

    @RequestMapping("/")
    public ModelAndView home(){
        return new ModelAndView("main");
    }

    @RequestMapping("/clients")
    public ModelAndView listClient(){
        return new ModelAndView("list-client");
    }

    @RequestMapping("/sejours")
    public ModelAndView listSejour(){
        Map<String, Object> model = new HashMap<>();
        model.put("emplacements", emplacementRepository.findAll());
        model.put("clients", clientRepository.findAll());
        return new ModelAndView("list-sejour",model );
    }


    @RequestMapping("/factures")
    public ModelAndView listFacture(){
        Map<String, Object> model = new HashMap<>();
        model.put("emplacements", emplacementRepository.findAll());
        model.put("clients", clientRepository.findAll());
        model.put("sejours", sejourRepository.findAll());
        return new ModelAndView("factures",model );
    }
}
