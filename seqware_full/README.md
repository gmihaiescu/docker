## Users - running a container 

1. Set permissions on datastore which will hold results of workflows after they run
        
        mkdir -p datastore
        chmod a+w datastore

2. Run container and login with the following (while persisting workflow run directories to datastore)
 
        docker run --rm -h master -t -v `pwd`/datastore:/mnt/datastore  -i seqware/seqware_full

3. Run the HelloWorld (sample) workflow with 

        seqware bundle launch --dir ~/provisioned-bundles/Workflow_Bundle_HelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-alpha.6/

4. Alternatively, if you need to run a command on the container as a part of a script, you will need to invoke the start script first. As an example, to list the workflows available in the image.
        
        docker run --privileged --rm -h master -t -v `pwd`/datastore:/mnt/datastore -i seqware/seqware_full /start.sh "seqware workflow list" 
        
## Developers - building the image locally 

1. Assuming docker is installed properly, build image with 

        docker build  -t seqware/seqware_full .

2. This image does not seem to be compatible with the Docker Hub automated build process either due to resource constraints or port blocking. 

        docker push seqware/seqware_full
