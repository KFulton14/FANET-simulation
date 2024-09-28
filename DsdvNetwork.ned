//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.examples.manetrouting.dsdv;

import inet.node.aodv.AodvRouter;
import inet.common.scenario.ScenarioManager;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.dsdv.DsdvRouter;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;


//
// TODO
//
network DsdvNetwork
{
    parameters:
        int numHosts;
        @display("bgb=650,650");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=253.752,553.284;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=413.328,612.144;is=s");
        }
        routingTableRecorder: RoutingTableRecorder {
            parameters:
                @display("p=413.328,553.284;is=s");
        }
        scenarioManager: ScenarioManager {
            parameters:
                script = default(xml("<scenario/>"));
                @display("p=255.06,612.144;is=s");
        }
        host[numHosts]: DsdvRouter {
            parameters:
                dsdv.netmask = "255.255.0.0";
        }
    connections allowunconnected:
}

