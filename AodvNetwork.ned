//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.examples.manetrouting.aodv;

import inet.node.aodv.AodvRouter;
import inet.common.scenario.ScenarioManager;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;


//
// TODO
//
network AodvNetwork
{
    parameters:
        int numHosts;
        @display("bgb=650,650");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=221.052,574.212;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=371.472,629.148;is=s");
        }
        routingTableRecorder: RoutingTableRecorder {
            parameters:
                @display("p=371.472,574.212;is=s");
        }
        scenarioManager: ScenarioManager {
            parameters:
                script = default(xml("<scenario/>"));
                @display("p=222.36,629.148;is=s");
        }
        host[numHosts]: AodvRouter {
            parameters:
                @display("i=misc/aircraft;p=324.384,296.916");
                aodv.netmask = "255.255.0.0";
        }
    connections allowunconnected:
}

