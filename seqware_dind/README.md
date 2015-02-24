This produces a wrapped image for each of the seqware containers with added docker in docker (DIND) functionality.

## For Users

There are four images each corresponding to a base image from the root directory. They are the following:

* seqware/whitestar\_dind 
* seqware/whitestar\_pancancer\_dind
* seqware/full\_dind
* seqware/full\_pancancer\_dind 

Note that the notes omit the second seqware due to limits on the lengths of DockerHub repo names. 

First, you're going to want a datastore directory and a workflow directory. 

        mkdir workflows && mkdir datastore
        chmod a+x workflows && chmod a+x datastore

In order to use these images you simply use the --privileged parameter when running the container in addition to whatever `docker run` instructions were present for the base container. Additionally, if you wish to use these containers programmatically rather than interactively you will need to invoke the wrapdocker script before your command. As an example, to list the workflows available in one of the images.

        docker run --privileged --rm -h master -t -v `pwd`/datastore:/mnt/datastore -i seqware/seqware_full_dind wrapdocker "seqware workflow list" 

The following runs a normal workflow in the whitestar container.

        docker run --privileged --rm -h master -t -v `pwd`/datastore:/mnt/datastore -i seqware/seqware_whitestar_dind wrapdocker "seqware bundle launch --dir /home/seqware/provisioned-bundles/Workflow_Bundle_HelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-alpha.6/ --no-metadata"

Additionally, we provide an [example workflow](https://github.com/SeqWare/public-workflows/tree/develop/dockerHelloWorld) that uses docker containers. This workflow has two steps, one that runs a toy command in a centos container and one which runs postgres. First, you need to download and expand the workflow. 

        cd workflows
        wget https://seqwaremaven.oicr.on.ca/artifactory/seqware-release/com/github/seqware/seqware-distribution/1.1.0-alpha.6/seqware-distribution-1.1.0-alpha.6-full.jar
        wget https://s3.amazonaws.com/oicr.workflow.bundles/released-bundles/Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0.zip
        java -cp seqware-distribution-1.1.0-alpha.6-full.jar net.sourceforge.seqware.pipeline.tools.UnZip --input-zip Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0.zip --output-dir  Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0
        cd ..

Next, run the workflow in one of the above DIND containers. 

        docker run --privileged --rm -h master -v `pwd`/datastore:/datastore -v `pwd`/workflows/Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0:/workflow  -i seqware/seqware_full_pancancer_dind wrapdocker "seqware bundle launch --dir /workflow"

This should start up the container, run the workflow, and then cleanup the container. You can then examine the results in the persistent datastore directory.

## For Developers

1. In order to build all four images

        chmod a+x build.sh && ./build.sh
