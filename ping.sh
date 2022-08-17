#!/bin/bash

printf "DigitalOcean Ping Test:\n\n"

# https://www.digitalocean.com/docs/platform/availability-matrix/
for DC in NYC1 NYC2 NYC3 SFO1 SFO2 SFO3 TOR1 LON1 FRA1 AMS2 AMS3 SGP1 BLR1
do
    printf "$DC: \t$(ping -i .2 -c 10 -q speedtest-$DC.digitalocean.com | awk -F/ '/^round|^rtt/{print $5}') ms\n" | expand -t 20
done


printf "\n\nLinode Ping Test:\n\n"

# https://www.linode.com/speed-test/
for DC in newark atlanta dallas fremont london frankfurt singapore tokyo2 syd1 toronto1 mumbai1
do
    printf "$DC: \t$(ping -i .2 -c 10 -q speedtest.$DC.linode.com | awk -F/ '/^round|^rtt/{print $5}') ms\n" | expand -t 20
done


printf "\n\nAWS Ping Test:\n\n"

# https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
for DC in us-east-1 us-east-2 us-west-1 us-west-2 ca-central-1 eu-north-1 eu-central-1 eu-west-1 eu-west-2 eu-west-3 eu-north-1 eu-south-1 ap-east-1 ap-northeast-1 ap-northeast-2 ap-south-1 ap-southeast-1 ap-southeast-2 sa-east-1 me-south-1 af-south-1
do
    printf "$DC: \t$(ping -i .2 -c 10 -q ec2.$DC.amazonaws.com | awk -F/ '/^round|^rtt/{print $5}') ms\n" | expand -t 20
done


printf "\n\nGCP Ping Test:\n\n"

# https://cloudharmony.com/speedtest-for-google:compute
for DC in us-east1 us-east4 us-west1 us-west2-a us-west2-b us-west3 us-central1 northamerica-northeast1 asia-east1 asia-east2 asia-northeast1 asia-northeast2 asia-south1 asia-southeast1 australia-southeast1 europe-north1 europe-west1 europe-west2 europe-west3 europe-west4 europe-west6 southamerica-east1
do
    printf "$DC: \t$(ping -i .2 -c 10 -q $DC-gce.cloudharmony.net | awk -F/ '/^round|^rtt/{print $5}') ms\n" | expand -t 20
done


printf "\n\nVultr/Choopa Ping Test:\n\n"

# https://www.vultr.com/resources/faq/#downloadspeedtests
for DC in NJ-US IL-US GA-US FL-US TX-US SJO-CA-US LAX-CA-US WA-US TOR-CA FRA-DE AMS-NL PAR-FR LON-GB SYD-AU SGP HND-JP SEL-KOR
do
    printf "$DC: \t$(ping -i .2 -c 10 -q $DC-ping.vultr.com | awk -F/ '/^round|^rtt/{print $5}') ms\n" | expand -t 20
done

printf "\n\nCoreWeave Ping Test:\n\n"

# https://docs.coreweave.com/data-center-regions
for DC in las1 lga1 ord1
do
    printf "$DC: \t$(ping -i .2 -c 10 -q ping.speedtest.$DC.coreweave.com | awk -F/ '/^round|^rtt/{print $5}') ms\n" | expand -t 20
done
