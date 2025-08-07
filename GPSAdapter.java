package com.group4.ptfms.patterns;

public class GPSAdapter {
    private ExternalGPSFeed gps;

    public GPSAdapter(ExternalGPSFeed gps) {
        this.gps = gps;
    }

    public String getLocationData() {
        return gps.getCoords();
    }
}