package com.tyndalehouse.step.core.service;

import java.io.File;
import java.io.IOException;

/**
 * @author chrisburrell
 */
public interface AppManagerService {
    /**
     * The app.version property
     */
    String APP_VERSION = "app.version";

    /**
     * @return the currently installed version of the application
     */
    String getAppVersion();

    /**
     * Sets the property in memory, and saves it
     *
     * @param newVersion the new version of STEP, set during an upgrade
     */
    void setAndSaveAppVersion(String newVersion);
    /**
     * @return the home directory for step, containing indexes and the like
     */
    File getHomeDirectory();

    /**
     * @return true to indicate this is hosted by the Step-Server app
     */
    boolean isLocal();
}
