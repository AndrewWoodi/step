package com.tyndalehouse.step.core.data;

import com.tyndalehouse.step.core.data.entities.EntityIndexWriter;
import com.tyndalehouse.step.core.data.entities.impl.TrackingEntityIndexWriterImpl;

/**
 * Interface for entity managers
 * 
 * @author chrisburrell
 * 
 */
public interface EntityManager {

    /**
     * @param entityName the name of the entity
     * @return the configuration for the entity
     */
    EntityConfiguration getConfig(String entityName);

    /**
     * @param entity the name of the entity to refresh
     */
    void refresh(String entity);

    /**
     * @param entity the name of the entity
     * @return the reader of the index
     */
    EntityIndexReader getReader(String entity);

    EntityIndexWriter getEntityWriter(String entity);

    /**
     * closes everything held by the manager
     */
    void close();

    /**
     * @param entity the entity name
     * @return entity writer
     */
    TrackingEntityIndexWriterImpl getBatchWriter(String entity);

    
}
