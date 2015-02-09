# seqware-docker
This collects the various docker distributions used by the SeqWare and Pancancer projects.

## Docker Containers

### Tabix

This container is used for serving up reference data for the [Sanger workflow](https://github.com/ICGC-TCGA-PanCancer/SeqWare-CGP-SomaticCore) for pancancer. 

### SeqWare WhiteStar

This version of SeqWare uses the WhiteStar workflow engine to quickly run workflows without any dependencies on SGE, Oozie, Hadoop, or even the SeqWare webservice. The trade-off is that running workflows is less robust and access to features such as throttling based on memory (SGE), retrying workflows (Oozie), or querying metadata (webservice) are not available.


