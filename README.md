# seqware-docker
This collects the various docker distributions used by the SeqWare and Pancancer projects.
When pre-requisites are listed, it is required to build the first container before the second. 

For all these containers, you will need to perform the following steps

Install the AWS CLI. Refer to the following guides and remember to setup your AWS credentials.

In other words, create a file at ~/.aws/config with the following filled in.

        [default]
        aws_access_key_id =
        aws_secret_access_key =

Further details can be found at the following:
 
* https://aws.amazon.com/cli/ 
* http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html 

        sudo apt-get install python-pip
        pip install awscli

Install Docker based on the instructions at https://docs.docker.com/installation/ubuntulinux/ Following the instructions for your Ubuntu version, we recommend 14.04. Please also follow the section on giving non-root access to your preferred user. 

## Tabix 

Directory: tabix

This container is used for serving up reference data for the [Sanger workflow](https://github.com/ICGC-TCGA-PanCancer/SeqWare-CGP-SomaticCore) for pancancer. 

## SeqWare WhiteStar 

Directory: seqware_whitestar

This version of SeqWare uses the WhiteStar workflow engine to quickly run workflows without any dependencies on SGE, Oozie, Hadoop, or even the SeqWare webservice. These containers start quickly and with no running services or overhead. The trade-off is that running workflows is less robust and access to features such as throttling based on memory (SGE), retrying workflows (Oozie), or querying metadata (webservice) are not available.

### SeqWare WhiteStar with Pancancer

Directory: seqware\_whitestar\_with\_pancancer  
Pre-requisite: SeqWare WhiteStar

This layers in system level dependencies for the BWA and Sanger workflows for the pan-cancer project. 

### Documentation Builder 

Directory: documentation\_builder  
Pre-requisite: SeqWare WhiteStar

Used internally for the SeqWare project to build documentation via jenkins when changes are pushed to GitHub. 

## SeqWare Oozie-SGE 

Directory: seqware\_full

This version of SeqWare uses the Oozie-SGE workflow engine to run workflows. This requires SGE, Oozie, Hadoop, and the SeqWare webservice and thus containers are started with a script which spins up these services. These containers should be functionally very similar to full VMs spun up using [Bindle](https://github.com/CloudBindle/Bindle) and ansible-playbooks from [seqware-bag](https://github.com/SeqWare/seqware-bag).

### SeqWare Oozie-SGE with Pancancer

Directory: seqware\_full\_pancancer\_launcher  
Pre-requisite: SeqWare Full

This layers in system level dependencies for the BWA and Sanger workflows for the pan-cancer project. 
