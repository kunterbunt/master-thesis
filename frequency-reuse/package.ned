package test_oracle2.simulations;

import demo.LRE;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.node.ethernet.Eth10G;
import inet.node.ethernet.Eth10M;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import lte.common.oracle.Oracle;
import lte.world.radio.ChannelControl;
import lte.corenetwork.binder.LteBinder;
import lte.corenetwork.nodes.Ue;
import lte.corenetwork.nodes.eNodeB;
import lte.world.radio.LteChannelControl;
import lte.epc.PgwStandardSimplified;


network FrequencyNetworkLRE
{
    parameters:
        int numUeCellTx_FTP = default(0);
        int numUeCellRx_FTP = default(0);
        int numUeCellTx_VoIP = default(0);
        int numUeCellRx_VoIP = default(0);
        int numUeCellTx_vid = default(0);
        int numUeCellRx_vid = default(0);
        int numUeCellTx_CBR = default(0);
        int numUeCellRx_CBR = default(0);
        int numUeCellTx_FULBUF = default(0);
        int numUeCellRx_FULBUF = default(0);

        int numUeD2DTx_FTP = default(0);
        int numUeD2DRx_FTP = default(0);
        int numUeD2DTx_VoIP = default(0);
        int numUeD2DRx_VoIP = default(0);
        int numUeD2DTx_vid = default(0);
        int numUeD2DRx_vid = default(0);
        int numUeD2DTx_CBR = default(0);
        int numUeD2DRx_CBR = default(0);
        int numUeD2DTx_FULBUF = default(0);
        int numUeD2DRx_FULBUF = default(0);
        @display("i=block/network2;bgb=1502.45,776.1;bgi=background/budapest");
    submodules:
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("demo.xml");
        }
        binder: LteBinder {
            @display("p=50,175;is=s");
        }
        router: Router {
            @display("p=321,136;i=device/smallrouter");
        }
        pgw: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=519,175;is=l");
        }
        eNodeB: eNodeB {
            @display("p=542.275,368.15;is=vl");
        }
        oracle: Oracle {
            @display("p=716.4,74.625");
        }

        ueCellTx_FTP[numUeCellTx_FTP]: Ue {
            @display("p=230.09375,421.63126;i=device/cellphone");
        }
        ueCellRx_FTP[numUeCellRx_FTP]: Ue {
            @display("p=230.09375,314.66876;i=device/cellphone");
        }

        ueCellTx_VoIP[numUeCellTx_VoIP]: Ue {
            @display("p=317.15625,314.66876;i=device/cellphone");
        }
        ueCellRx_VoIP[numUeCellRx_VoIP]: Ue {
            @display("p=317.15625,421.63126;i=device/cellphone");
        }

        ueCellTx_vid[numUeCellTx_vid]: Ue {
            @display("p=409.19376,314.66876;i=device/cellphone");
        }
        ueCellRx_vid[numUeCellRx_vid]: Ue {
            @display("p=409.19376,421.63126;i=device/cellphone");
        }

        ueD2DTx_FTP[numUeD2DTx_FTP]: Ue {
            @display("p=781.075,421.63126;i=device/cellphone");
        }
        ueD2DRx_FTP[numUeD2DRx_FTP]: Ue {
            @display("p=781.075,296.0125;i=device/cellphone");
        }

        ueD2DTx_VoIP[numUeD2DTx_VoIP]: Ue {
            @display("p=885.55,296.0125;i=device/cellphone");
        }
        ueD2DRx_VoIP[numUeD2DRx_VoIP]: Ue {
            @display("p=885.55,421.63126;i=device/cellphone");
        }

        ueD2DTx_vid[numUeD2DTx_vid]: Ue {
            @display("p=1008.6812,296.0125;i=device/cellphone");
        }
        ueD2DRx_vid[numUeD2DRx_vid]: Ue {
            @display("p=1008.6812,421.63126;i=device/cellphone");
        }

        ueCellTx_CBR[numUeCellTx_CBR]: Ue {
            @display("p=123.13125,421.63126;i=device/cellphone");
        }
        ueCellRx_CBR[numUeCellRx_CBR]: Ue {
            @display("p=123.13125,314.66876;i=device/cellphone");
        }

        ueD2DTx_CBR[numUeD2DTx_CBR]: Ue {
            @display("p=694.0125,421.63126;i=device/cellphone");
        }
        ueD2DRx_CBR[numUeD2DRx_CBR]: Ue {
            @display("p=694.0125,296.0125;i=device/cellphone");
        }

        ueCellTx_FULBUF[numUeCellTx_FULBUF]: Ue {
            @display("p=62.1875,421.63126;i=device/cellphone");
        }
        ueCellRx_FULBUF[numUeCellRx_FULBUF]: Ue {
            @display("p=62.1875,314.66876;i=device/cellphone");
        }

        ueD2DTx_FULBUF[numUeD2DTx_FULBUF]: Ue {
            @display("p=1093.2562,296.0125;i=device/cellphone");
        }
        ueD2DRx_FULBUF[numUeD2DRx_FULBUF]: Ue {
            @display("p=1093.2562,421.63126;i=device/cellphone");
        }
        lre: LRE {
            @display("p=1400.58,73.417496");
        }
    connections:
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        pgw.pppg++ <--> Eth10G <--> eNodeB.ppp;
}

network FrequencyNetwork
{
    parameters:
        int numUeCellTx_FTP = default(0);
        int numUeCellRx_FTP = default(0);
        int numUeCellTx_VoIP = default(0);
        int numUeCellRx_VoIP = default(0);
        int numUeCellTx_vid = default(0);
        int numUeCellRx_vid = default(0);
        int numUeCellTx_CBR = default(0);
        int numUeCellRx_CBR = default(0);
        int numUeCellTx_FULBUF = default(0);
        int numUeCellRx_FULBUF = default(0);

        int numUeD2DTx_FTP = default(0);
        int numUeD2DRx_FTP = default(0);
        int numUeD2DTx_VoIP = default(0);
        int numUeD2DRx_VoIP = default(0);
        int numUeD2DTx_vid = default(0);
        int numUeD2DRx_vid = default(0);
        int numUeD2DTx_CBR = default(0);
        int numUeD2DRx_CBR = default(0);
        int numUeD2DTx_FULBUF = default(0);
        int numUeD2DRx_FULBUF = default(0);
        @display("i=block/network2;bgb=1502.45,776.1;bgi=background/budapest");
    submodules:
        channelControl: LteChannelControl {
            @display("p=50,25;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("demo.xml");
        }
        binder: LteBinder {
            @display("p=50,175;is=s");
        }
        router: Router {
            @display("p=321,136;i=device/smallrouter");
        }
        pgw: PgwStandardSimplified {
            nodeType = "PGW";
            @display("p=519,175;is=l");
        }
        eNodeB: eNodeB {
            @display("p=542.275,368.15;is=vl");
        }
        oracle: Oracle {
            @display("p=716.4,74.625");
        }

        ueCellTx_FTP[numUeCellTx_FTP]: Ue {
            @display("p=230.09375,421.63126;i=device/cellphone");
        }
        ueCellRx_FTP[numUeCellRx_FTP]: Ue {
            @display("p=230.09375,314.66876;i=device/cellphone");
        }

        ueCellTx_VoIP[numUeCellTx_VoIP]: Ue {
            @display("p=317.15625,314.66876;i=device/cellphone");
        }
        ueCellRx_VoIP[numUeCellRx_VoIP]: Ue {
            @display("p=317.15625,421.63126;i=device/cellphone");
        }

        ueCellTx_vid[numUeCellTx_vid]: Ue {
            @display("p=409.19376,314.66876;i=device/cellphone");
        }
        ueCellRx_vid[numUeCellRx_vid]: Ue {
            @display("p=409.19376,421.63126;i=device/cellphone");
        }

        ueD2DTx_FTP[numUeD2DTx_FTP]: Ue {
            @display("p=781.075,421.63126;i=device/cellphone");
        }
        ueD2DRx_FTP[numUeD2DRx_FTP]: Ue {
            @display("p=781.075,296.0125;i=device/cellphone");
        }

        ueD2DTx_VoIP[numUeD2DTx_VoIP]: Ue {
            @display("p=885.55,296.0125;i=device/cellphone");
        }
        ueD2DRx_VoIP[numUeD2DRx_VoIP]: Ue {
            @display("p=885.55,421.63126;i=device/cellphone");
        }

        ueD2DTx_vid[numUeD2DTx_vid]: Ue {
            @display("p=1008.6812,296.0125;i=device/cellphone");
        }
        ueD2DRx_vid[numUeD2DRx_vid]: Ue {
            @display("p=1008.6812,421.63126;i=device/cellphone");
        }

        ueCellTx_CBR[numUeCellTx_CBR]: Ue {
            @display("p=123.13125,421.63126;i=device/cellphone");
        }
        ueCellRx_CBR[numUeCellRx_CBR]: Ue {
            @display("p=123.13125,314.66876;i=device/cellphone");
        }

        ueD2DTx_CBR[numUeD2DTx_CBR]: Ue {
            @display("p=694.0125,421.63126;i=device/cellphone");
        }
        ueD2DRx_CBR[numUeD2DRx_CBR]: Ue {
            @display("p=694.0125,296.0125;i=device/cellphone");
        }

        ueCellTx_FULBUF[numUeCellTx_FULBUF]: Ue {
            @display("p=62.1875,421.63126;i=device/cellphone");
        }
        ueCellRx_FULBUF[numUeCellRx_FULBUF]: Ue {
            @display("p=62.1875,314.66876;i=device/cellphone");
        }

        ueD2DTx_FULBUF[numUeD2DTx_FULBUF]: Ue {
            @display("p=1093.2562,296.0125;i=device/cellphone");
        }
        ueD2DRx_FULBUF[numUeD2DRx_FULBUF]: Ue {
            @display("p=1093.2562,421.63126;i=device/cellphone");
        }        
    connections:
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        pgw.pppg++ <--> Eth10G <--> eNodeB.ppp;
}
