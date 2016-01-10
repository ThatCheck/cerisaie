package Cerisaie.Repository;

import Cerisaie.Entity.ActiviteEntity;
import Cerisaie.Entity.ClientEntity;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Cabbibi on 09/01/2016.
 */
public interface ActiviteRepository extends CrudRepository<ActiviteEntity, Integer> {
}
