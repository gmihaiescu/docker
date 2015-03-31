# seqware-docker
This collects the various docker distributions used by the SeqWare and Pancancer projects.
Prerequisite containers can be resolved from Docker Hub which also runs continuous integration (except for seqware\_full which does not work in the docker hub environment). 

Install Docker using the following script. This will automatically setup AUFS which is recommended for performance reasons. 

        curl -sSL https://get.docker.com/ | sudo sh
        sudo usermod -aG docker ubuntu

When using Ubuntu, we recommend 14.04. 
After setting up, remember to exit your shell and log back in to refresh your environment.

Currently, most of these containers (including all of the SeqWare ones) are available and served as [automated builds](https://registry.hub.docker.com/repos/seqware/) on Docker Hub. We are also working on [quay.io](https://quay.io/repository/?namespace=seqware). 

## Java

You will need Java 7 to extract the workflow .zip bundles.  Please install that version for your system.

## Tabix 

This container is used for serving up reference data for the [Sanger workflow](https://github.com/ICGC-TCGA-PanCancer/SeqWare-CGP-SomaticCore) for pancancer. 

Go to [Tabix](tabix) for setup instructions

## SeqWare WhiteStar 

This version of SeqWare uses the WhiteStar workflow engine to quickly run workflows without any dependencies on SGE, Oozie, Hadoop, or even the SeqWare webservice. These containers start quickly and with no running services or overhead. The trade-off is that running workflows is less robust and access to features such as throttling based on memory (SGE), retrying workflows (Oozie), or querying metadata (webservice) are not available.

Go to [seqware\_whitestar](seqware_whitestar) for setup instructions

### SeqWare WhiteStar with Pancancer

Pre-requisite: SeqWare WhiteStar

This layers in system level dependencies for the BWA and Sanger workflows for the pan-cancer project.

Go to [seqware\_whitestar\_with\_pancancer](seqware_whitestar_with_pancancer) for setup instructions

### Documentation Builder 

Pre-requisite: SeqWare WhiteStar

Used internally for the SeqWare project to build documentation via jenkins when changes are pushed to GitHub. 

Go to [documentation\_builder](documentation_builder) for setup instructions

## SeqWare Oozie-SGE 

This version of SeqWare uses the Oozie-SGE workflow engine to run workflows. This requires SGE, Oozie, Hadoop, and the SeqWare webservice and thus containers are started with a script which spins up these services. These containers should be functionally very similar to full VMs spun up using [Bindle](https://github.com/CloudBindle/Bindle) and ansible-playbooks from [seqware-bag](https://github.com/SeqWare/seqware-bag).

Go to [seqware\_full](seqware_full) for setup instructions

### SeqWare Oozie-SGE with Pancancer

Pre-requisite: SeqWare Full

This layers in system level dependencies for the BWA and Sanger workflows for the pan-cancer project. 

Go to [seqware\_full\_pancancer](seqware_full_pancancer) for setup instructions
