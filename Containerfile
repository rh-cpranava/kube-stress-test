FROM registry.redhat.io/rhel8/python-39:1-97.1674497503
RUN git clone https://github.com/redhat-performance/boatload.git
RUN curl -Lo kube-burner.tar.gz https://github.com/cloud-bulldozer/kube-burner/releases/download/v1.3/kube-burner-1.3-Linux-x86_64.tar.gz
RUN curl -Lo oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.12.1/openshift-client-linux.tar.gz
RUN tar xvzf kube-burner.tar.gz -C /opt/app-root/bin
RUN tar xvzf oc.tar.gz -C /opt/app-root/bin
WORKDIR /opt/app-root/src/boatload
RUN pip install -r requirements.txt
ENTRYPOINT ["/opt/app-root/src/boatload/boatload/boatload.py"]
