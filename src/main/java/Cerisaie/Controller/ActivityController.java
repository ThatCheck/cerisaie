package Cerisaie.Controller;

import Cerisaie.Entity.ActiviteEntity;
import Cerisaie.Entity.SejourEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Cabbibi on 10/01/2016.
 */
@RestController
@RequestMapping("/api/activity")
public class ActivityController extends BaseRestController<ActiviteEntity,Integer>{
    @Autowired
    public ActivityController(CrudRepository<ActiviteEntity, Integer> repo) {
        super(repo);
    }
}
