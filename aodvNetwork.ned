//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.examples.FANET.originaltool;

import inet.node.aodv.AodvRouter;
import inet.common.scenario.ScenarioManager;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;
import inet.environment.common.PhysicalEnvironment;
import inet.node.inet.AdhocHost;


//
// TODO
//
network aodvNetwork
{
    parameters:
        int numHosts;
        @display("bgb=1483,1257,grey95;bgg=100,1,grey95");
    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=225,1243;is=s");
        }

        visualizer: <default(firstAvailableOrEmpty("IntegratedCanvasVisualizer"))> like IIntegratedVisualizer if typename != "" {
            @display("p=157,1232");
        }

        physicalEnvironment: PhysicalEnvironment {
            parameters:
                @display("is=s;p=290,1243");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='145.236.x.x' netmask='255.255.0.0'/></config>");
                @display("p=37,1243;is=s");
        }
        routingTableRecorder: RoutingTableRecorder {
            parameters:
                @display("p=352,1243;is=s");
        }
        scenarioManager: ScenarioManager {
            parameters:
                script = default(xml("<scenario/>"));
                @display("p=92,1243;is=s");
        }
        host[numHosts]: AodvRouter {
            parameters:
                @display("i=misc/aircraft;p=646,403");
                aodv.netmask = "255.255.0.0";
        }
        gcs: AdhocHost {
            @display("i=device/antennatower_vl;r=,,#707070;p=381,307");
        }

    connections allowunconnected:
}
