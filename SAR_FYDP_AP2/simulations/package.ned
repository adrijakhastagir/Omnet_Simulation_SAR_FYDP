package sar_fydp_ap2.simulations;

@license(LGPL);
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.node.inet.AdhocHost;
//import inet.environment.common.PhysicalEnvironment;
network SarMeshQoS
{
    parameters:
        @display("bgb=1022,520");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=118,85");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=504,87");
        }

        // -------------------
        // Sensors (uplink only)
        // -------------------
        depth: AdhocHost {
            @display("p=254,422;i=device/server, blue");
            hasIpv4 = true;
            wlan[0].typename = "Ieee80211Interface";
            wlan[0].mgmt.typename = "Ieee80211MgmtAdhoc";
        }

        thermalcam: AdhocHost {
            @display("p=271,172;i=device/server,orange");
            hasIpv4 = true;
            wlan[0].typename = "Ieee80211Interface";
            wlan[0].mgmt.typename = "Ieee80211MgmtAdhoc";
        }
        gas: AdhocHost {
            @display("p=165,317;i=device/server,yellow");
            hasIpv4 = true;
            wlan[0].typename = "Ieee80211Interface";
            wlan[0].mgmt.typename = "Ieee80211MgmtAdhoc";
        }
        // -------------------
        // Rover controller (uplink + downlink)
        // -------------------
        roverController: AdhocHost {
            @display("p=392,317;i=device/wifilaptop");
            hasIpv4 = true;
            wlan[0].typename = "Ieee80211Interface";
            wlan[0].mgmt.typename = "Ieee80211MgmtAdhoc";
        }
        // -------------------
        // Base station
        // -------------------
        base: AdhocHost {
            @display("p=772,284;i=device/pc");
            hasIpv4 = true;
            wlan[0].typename = "Ieee80211Interface";
            wlan[0].mgmt.typename = "Ieee80211MgmtAdhoc";
        }
}
