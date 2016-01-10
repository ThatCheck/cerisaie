package Cerisaie.Repository;

import Cerisaie.Entity.ActiviteEntity;
import Cerisaie.Entity.EmplacementEntity;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Cabbibi on 09/01/2016.
 */
public interface EmplacementRepository extends CrudRepository<EmplacementEntity, Integer> {
}
