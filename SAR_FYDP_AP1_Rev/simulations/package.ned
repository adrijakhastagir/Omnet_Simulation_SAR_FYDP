package sar_fydp_ap1_rev.simulations;

@license(LGPL);

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.node.inet.AdhocHost;

network SarMeshQoS
{
    parameters:
        @display("bgb=1120,560");

    submodules:
        // Channel 0 – Control / Sensor mesh (LiDAR, Thermal, Gas, Telemetry)
        radioMedium0: Ieee80211ScalarRadioMedium {
            @display("p=118,60");
        }

        // Channel 1 – Video streaming (RGB_CAM → videoBase)
        radioMedium1: Ieee80211ScalarRadioMedium {
            @display("p=117,153");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=538,66");
        }

        // --------------------------------------------------
        // Sensor nodes – wlan[0] on control mesh
        //                wlan[1] present only on RGB_CAM
        // --------------------------------------------------
        lidar: AdhocHost {
            @display("p=318,455;i=device/server,blue");
            numWlanInterfaces = 1;
        }

        RGB_CAM: AdhocHost {
            @display("p=318,320;i=device/server,white");
            numWlanInterfaces = 2;   // wlan[0]=control  wlan[1]=video
        }

        thermalcam: AdhocHost {
            @display("p=318,201;i=device/server,orange");
            numWlanInterfaces = 1;
        }

        gas: AdhocHost {
            @display("p=447,388;i=device/server,yellow");
            numWlanInterfaces = 1;
        }

        // Rover controller on control mesh only
        roverController: AdhocHost {
            @display("p=448,246;i=device/wifilaptop");
            numWlanInterfaces = 1;
        }

        // Base – control mesh only
        base: AdhocHost {
            @display("p=808,372;i=device/pc");
            numWlanInterfaces = 1;
        }

        // Video base – video channel only
        videoBase: AdhocHost {
            @display("p=822,268;i=device/laptop");
            numWlanInterfaces = 1;
        }

    connections allowunconnected:
        // No wired connections – all traffic is wireless
}
