INSTANCE_NAME=gijs-papino
ZONE=europe-west1-a


.PHONY: all create delete ssh

all: create ssh

create:
	gcloud compute instances create $(INSTANCE_NAME) \
	    --image container-vm-v20140929 \
		--image-project google-containers \
		--metadata-from-file google-container-manifest=containers.yaml \
		--zone $(ZONE) \
		--machine-type f1-micro

delete:
	gcloud compute instances delete --zone $(ZONE) $(INSTANCE_NAME) 

ssh:
	gcloud compute ssh --zone $(ZONE) $(INSTANCE_NAME)
