package test_oracle2.simulations;

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


network FrequencyNetwork
{
    parameters:
        int numUeCellTx_CBR = default(0);
        int numUeCellRx_CBR = default(0);
        int numUeCellTx_VoIP = default(0);
        int numUeCellRx_VoIP = default(0);
        int numUeCellTx_vid = default(0);
        int numUeCellRx_vid = default(0);
        int numUeD2DTx_CBR = default(0);
        int numUeD2DRx_CBR = default(0);
        int numUeD2DTx_VoIP = default(0);
        int numUeD2DRx_VoIP = default(0);
        int numUeD2DTx_vid = default(0);
        int numUeD2DRx_vid = default(0);
        @display("i=block/network2;bgb=991,558;bgi=background/budapest");
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
            @display("p=391,259;is=vl");
        }        
        oracle: Oracle {
            @display("p=716.4,74.625");
        }
        
        ueCellTx_CBR[numUeCellTx_CBR]: Ue {
            @display("p=48.50625,415.4125;i=device/cellphone");
        }
        ueCellRx_CBR[numUeCellRx_CBR]: Ue {
            @display("p=48.50625,308.45;i=device/cellphone");
        }
        
        ueCellTx_VoIP[numUeCellTx_VoIP]: Ue {
            @display("p=135.56876,308.45;i=device/cellphone");
        }
        ueCellRx_VoIP[numUeCellRx_VoIP]: Ue {
            @display("p=135.56876,415.4125;i=device/cellphone");
        }
        
        ueCellTx_vid[numUeCellTx_vid]: Ue {
            @display("p=227.60625,308.45;i=device/cellphone");
        }
        ueCellRx_vid[numUeCellRx_vid]: Ue {
            @display("p=227.60625,415.4125;i=device/cellphone");
        }
        
        ueD2DTx_CBR[numUeD2DTx_CBR]: Ue {
            @display("p=543.51874,424.11874;i=device/cellphone");
        }
        ueD2DRx_CBR[numUeD2DRx_CBR]: Ue {
            @display("p=544,299;i=device/cellphone");
        }   
             
        ueD2DTx_VoIP[numUeD2DTx_VoIP]: Ue {
            @display("p=647.9938,298.5;i=device/cellphone");
        }
        ueD2DRx_VoIP[numUeD2DRx_VoIP]: Ue {
            @display("p=647.9938,424.11874;i=device/cellphone");
        }
        
        ueD2DTx_vid[numUeD2DTx_vid]: Ue {
            @display("p=771.125,298.5;i=device/cellphone");
        }
        ueD2DRx_vid[numUeD2DRx_vid]: Ue {
            @display("p=771.125,424.11874;i=device/cellphone");
        }
    connections:
        router.pppg++ <--> Eth10G <--> pgw.filterGate;
        pgw.pppg++ <--> Eth10G <--> eNodeB.ppp;
}
