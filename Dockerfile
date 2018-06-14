# symlink-test
FROM openshift/base-centos7

# TODO: Put the maintainer name in the image metadata
LABEL maintainer="Adam Kaplan <adam.kaplan@redhat.com>"

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Test git clone symlinks" \
      io.k8s.display-name="git-clone-symlink 0.0.1"

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y
#RUN yum install -y rubygems && yum clean all -y
#RUN gem install asdf

# TODO (optional): Copy the builder files into /opt/app-root
COPY . /opt/app-root/

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
# EXPOSE 8080

WORKDIR /opt/app-root

# TODO: Set the default CMD for the image
CMD ["/opt/app-root/entrypoint.sh"]