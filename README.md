# seqware-docker
This collects the various docker distributions used by the SeqWare and Pancancer projects.

## Docker Containers

This lists currently available docker containers. When pre-requisites are listed, it is required to build the first container before the second. 

### Tabix

This container is used for serving up reference data for the [Sanger workflow](https://github.com/ICGC-TCGA-PanCancer/SeqWare-CGP-SomaticCore) for pancancer. 

### SeqWare WhiteStar

This version of SeqWare uses the WhiteStar workflow engine to quickly run workflows without any dependencies on SGE, Oozie, Hadoop, or even the SeqWare webservice. These containers start quickly and with no running services or overhead. The trade-off is that running workflows is less robust and access to features such as throttling based on memory (SGE), retrying workflows (Oozie), or querying metadata (webservice) are not available.

### SeqWare WhiteStar with Pancancer

Pre-requisite: SeqWare WhiteStar

This layers system level dependencies for the BWA and Sanger workflows for the pan-cancer project. 

### Documentation Builder 

Used internally for the SeqWare project to build documentation via jenkins when changes are pushed to GitHub. 
