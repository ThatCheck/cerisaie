package Cerisaie.Repository;

import Cerisaie.Entity.ActiviteEntity;
import Cerisaie.Entity.SportEntity;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Cabbibi on 09/01/2016.
 */
public interface SportRepository extends CrudRepository<SportEntity, Integer> {
}
