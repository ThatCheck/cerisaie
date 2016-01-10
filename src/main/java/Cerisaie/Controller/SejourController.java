package Cerisaie.Controller;

import Cerisaie.Entity.SejourEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Cabbibi on 09/01/2016.
 */
@RestController
@RequestMapping("/api/sejour")
public class SejourController extends BaseRestController<SejourEntity,Integer>{
    @Autowired
    public SejourController(CrudRepository<SejourEntity, Integer> repo) {
        super(repo);
    }
}
