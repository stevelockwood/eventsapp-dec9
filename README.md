# eventsappstart
This is a simple events app


flowchart TB
    %% Clients
    Users[Users / Browsers]
    Users --> DNS[Cloud DNS]

    %% Load Balancer
    DNS --> LB[External HTTP(S) Load Balancer<br/>Global IP + SSL]

    %% Backend Service
    LB --> BS[Backend Service<br/>Health Checks]

    %% VPC
    subgraph VPC[VPC Network]
        direction TB

        %% Region
        subgraph Region[Region: us-central1]
            direction TB

            %% MIG
            subgraph MIG[Regional Managed Instance Group]
                direction LR
                VM1[GCE VM<br/>Web App]
                VM2[GCE VM<br/>Web App]
            end

            %% Database
            SQL[(Cloud SQL<br/>Primary + Standby (HA))]
        end
    end

    %% Connections
    BS --> MIG
    VM1 -->|Private IP| SQL
    VM2 -->|Private IP| SQL
