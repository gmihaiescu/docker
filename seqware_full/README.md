## Users - running a container 

1. Set permissions on datastore which will hold results of workflows after they run
        
        mkdir workflows && mkdir datastore
        chmod a+wrx workflows && chmod a+wrx datastore

2. Run container and login with the following (while persisting workflow run directories to datastore)
 
        docker run --rm -h master -t -v `pwd`/datastore:/mnt/datastore  -i seqware/seqware_full

3. Run the HelloWorld (sample) workflow with 

        seqware bundle launch --dir ~/provisioned-bundles/Workflow_Bundle_HelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-alpha.6/

4. Alternatively, if you need to run a command on the container as a part of a script, you will need to invoke the start script first. As an example, to list the workflows available in the image.
        
        docker run --privileged --rm -h master -t -v `pwd`/datastore:/mnt/datastore -i seqware/seqware_full /start.sh "seqware workflow list" 

5. Note that you can also connect the Docker client inside this container to the Docker daemon on the host in order to run Docker containers as part of your workflows. In order to do this add `-v /var/run/docker.sock:/var/run/docker.sock` Additionally, we provide an [example workflow](https://github.com/SeqWare/public-workflows/tree/develop/dockerHelloWorld) that uses docker containers. This workflow has two steps, one that runs a toy command in a centos container and one which runs postgres. First, you need to download and expand the workflow. 

        cd workflows
        wget https://seqwaremaven.oicr.on.ca/artifactory/seqware-release/com/github/seqware/seqware-distribution/1.1.0-alpha.6/seqware-distribution-1.1.0-alpha.6-full.jar
        wget https://s3.amazonaws.com/oicr.workflow.bundles/released-bundles/Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0.zip
        java -cp seqware-distribution-1.1.0-alpha.6-full.jar net.sourceforge.seqware.pipeline.tools.UnZip --input-zip Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0.zip --output-dir  Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0
        cd ..

5. Next, run the workflow.

        docker run --rm -h master -t -v /var/run/docker.sock:/var/run/docker.sock -v `pwd`/datastore:/datastore -v `pwd`/workflows/Workflow_Bundle_dockerHelloWorld_1.0-SNAPSHOT_SeqWare_1.1.0-rc.0:/workflow  -i seqware/seqware_full /start.sh "seqware bundle launch --dir /workflow"
This should start up the container, run the workflow, and then cleanup the container. You can then examine the results in the persistent datastore directory.
        
        
## Developers - building the image locally 

1. Assuming docker is installed properly, build image with 

        docker build  -t seqware/seqware_full .

2. This image does not seem to be compatible with the Docker Hub automated build process either due to resource constraints or port blocking. 

        docker push seqware/seqware_full
