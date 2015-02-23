This produces a wrapped image for each of the seqware containers with added docker in docker functionality.

## For Users

This creates four images each corresponding to a base image. In order to use these images you simple use the --privileged parameter when running the container. Additionally, if you wish to use these containers programmatically rather than interactively you will need to invoke the wrapdocker script. As an example, to list the workflows available in one of the images.

        docker run --privileged --rm -h master -t -v `pwd`/datastore:/mnt/datastore -i seqware/seqware_full_dind wrapdocker "seqware workflow list" 

This runs a workflow in the whitestar container.

        docker run --privileged --rm -h master -t -v `pwd`/datastore:/mnt/datastore -i seqware/seqware_whitestar_dind wrapdocker "seqware bundle launch --dir /home/seqware/provisioned-bundles/Workflow_Bundle_HelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-alpha.6/ --no-metadata"

## For Developers

1. In order to build all four images

        chmod a+x build.sh && ./build.sh
