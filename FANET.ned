//
// Copyright (C) 2006 OpenSim Ltd.
//
// SPDX-License-Identifier: LGPL-3.0-or-later
//


package inet.examples.adhoc.FANET;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.AdhocHost;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.contract.IIntegratedVisualizer;

network FANET
{
    parameters:
        int numHosts;
        @display("bgb=650,450");
    submodules:
        visualizer: <default(firstAvailableOrEmpty("IntegratedOsgVisualizer"))> like IIntegratedVisualizer if typename != "" {
            parameters:
                @display("p=287,33;is=s");
        }
        configurator: Ipv4NetworkConfigurator {
            parameters:
                @display("p=188,33;is=s");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=172,209;i=device/antennatower;is=l");
        }
        host[numHosts]: AdhocHost {
            parameters:
                @display("p=300,200;i=misc/aircraft");
        }
}
