package Cerisaie.Controller;

import Cerisaie.Entity.ClientEntity;
import Cerisaie.Repository.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

/**
 * Created by Cabbibi on 09/01/2016.
 */
@RestController
@RequestMapping("/api/client")
public class ClientController extends BaseRestController<ClientEntity,Integer> {

    @Autowired
    public ClientController(ClientRepository repo) {
        super(repo);
    }
}
