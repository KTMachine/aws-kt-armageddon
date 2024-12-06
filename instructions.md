<!-- Armageddon Project.
Project starts Nov 26th and ends Dec 9th.  I will only accept group work. Strictly, I won’t accept individual submissions whatsoever.
Project scenario: 

Tokyo Midtown Medical Center wishes to expand its medical care for their customers located in Japan. Their main goal is to create a J-Tele-Doctor for their customers who fear actually going to the hospital with a sickness, i.e. they don’t want to spread their sickness to others and/or are located abroad. TMMC views this as an opportunity to expend their services before the next pandemic occurs. 

Despite generous offers from Azure Japan for application support, AWS Japan has won this contract and you have been tasked as the Solution Architect.  Due to the fact that many of their customers travel abroad, the application must be available abroad and must also offer local language support.

1. In Stage One of this project, you are being tasked with completing the following.
You must have local application hosting for Japanese and foreign customers in the following locations:

Notes:
  Customers located in Japan, expand services
  App must be available abroad, language support
  each location must have 2 AZs
  1 minimun EC2 for test
  security zone where syslog data can be transfered - demonstrate ability to transfer data to Japan
  limitation port 80 open to public
  Syslog stored data in Japan only
  No personal info stored abroad
  Syslog AZ must be private

Main App:
- Tokyo.

Customer travel to:
- New York
- London
- Sao Paulo
- Australia 
- Hong Kong
- California.

2. Local requirements: Each area must have the following

- ASG with min 2 AZs
- Min 1 EC2 for the current test deployment
- Deployment to a security zone where syslog data can be transferred. Additionally, must demonstrate technical ability to transfer data to Japan.
- Limitation to port 80 open to the public.

3. Limitations: These must be observed and respected. Failure will mean automatic project failure.
- Syslog data must be stored in Japan only. SIEM/Syslog server will be deployed in Stage 2
- No personal information can be stored abroad and must be limited to Japan’s borders. Additionally, this data can’t be transferred via a VPN.
- Databases will be deployed in Stage 2
- AZ containing syslog data must be limited to a private subnet.

Notes:
  Customers located in Japan, expand services
  App must be available abroad, language support
  each location must have 2 AZs
  1 minimun EC2 for test
  security zone where syslog data can be transfered - demonstrate ability to transfer data to Japan: stage2
  limitation port 80 open to public: Port 80: [0.0.0.0/0]
  Syslog stored data in Japan only: stage2
  No personal info stored abroad: can be read abroad
  Syslog AZ must be private: stage2
  

  1 VPC per region/region close to location
    2 AZs per VPC

    - Tokyo
      Region: ap-northeast-1
      AZ: ap-northeast-1a
          ap-northeast-1d

      VPC: tokyo,
      CIDR: 10.40.0.0/16
      Subnet:
        Private: 
          tokyo-a-private: 10.40.11.0/24
          tokyo-d-private: 10.40.14.0/24
        Public: 
          tokyo-a-public: 10.40.1.0/24
          tokyo-d-public: 10.40.4.0/24
      
      VPC: tokyo-testb,
      CIDR: 10.47.0.0/16
      Subnet:
        Private: 
          tokyo-testb: 10.47.12.0/24
        Public: 
          tokyo-a-public: 10.47.2.0/24    

    - New York
      Region: us-east-1
      AZ: us-east-1a
          us-east-1b
      VPC: new-york
      CIDR: 10.41.0.0/16
      Subnet:
        Private: 
          new-york-a-private: 10.41.11.0/24
          new-york-b-private: 10.41.12.0/24
        Public:
          new-york-a-public: 10.41.1.0/24
          new-york-b-public: 10.41.2.0/24

    - London
      Region: eu-west-2
      AZ: eu-west-2a
          eu-west-2b
      VPC: london
      CIDR: 10.42.0.0/16
      Subnet:
        Private: 
          london-a-private: 10.42.11.0/24
          london-b-private: 10.42.12.0/24
        Public:
          london-a-public: 10.42.1.0/24
          london-b-public: 10.42.2.0/24
      
    - Sao Paulo
      Region: sa-east-1
      AZ: sa-east-1a
          sa-east-1c
      VPC: sao-paulo
      CIDR: 10.43.0.0/16
      Subnet:
        Private: 
          sao-paulo-a-private: 10.43.11.0/24
          sao-paulo-b-private: 10.43.12.0/24
        Public:
          sao-paulo-a-public: 10.43.1.0/24
          sao-paulo-b-public: 10.43.2.0/24

    - Australia 
      Region: ap-southeast-2
      AZ: ap-southeast-2a
          ap-southeast-2b
      VPC: australia
      CIDR: 10.44.0.0/16
      Subnet:
        Private: 
          australia-a-private: 10.44.11.0/24
          australia-b-private: 10.44.12.0/24
        Public:
          australia-a-public: 10.44.1.0/24
          australia-b-public: 10.44.2.0/24

    - Hong Kong
      Region: ap-east-1
      AZ: ap-east-1a
          ap-east-1b
      VPC: hong-kong
      CIDR: 10.45.0.0/16
      Subnet:
        Private: 
          hong-kong-a-private: 10.45.11.0/24
          hong-kong-b-private: 10.45.12.0/24
        Public:
          hong-kong-a-public: 10.45.1.0/24
          hong-kong-b-public: 10.45.2.0/24

    - California.
      Region: us-west-1
      AZ: us-west-1a
          us-west-1b
      VPC: california
      CIDR: 10.46.0.0/16
      Subnet:
        Private: 
          california-a-private: 10.46.11.0/24
          california-b-private: 10.46.12.0/24
        Public:
          california-a-public: 10.46.1.0/24
          california-b-public: 10.46.2.0/24

  Needs Cross-Region Load Balancer:

  Transit Gateway:
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway
    attachment:
      https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_connect 
    peer:
      https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_connect_peer

  Route Table Association:
    https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_default_route_table_association
  Route Tables:
    For TG

  TG: Notes
  https://dev.to/charlesuneze/configuring-a-transit-gateway-between-3-vpcs-using-terraform-4off

  TG Terraform code:
    https://github.com/mikemowgli/terraform-aws-transit-gateway/blob/master/deploy.tf




  - Transit Gateway
    - Tokyo
    - New York
    - London
    - Sao Paulo
    - Australia 
    - Hong Kong
    - California. -->