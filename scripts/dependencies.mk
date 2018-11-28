# Auto-generated by fogg. Do not edit
# Make improvements in fogg, so that everyone can benefit.

OS := $(shell uname -s | tr '[:upper:]' '[:lower:]')
ifeq ($(shell uname -m),x86_64)
  ARCH ?= "amd64"
endif
ifeq ($(shell uname -m),i686)
  ARCH ?= "386"
endif
ifeq ($(shell uname -m),aarch64)
  ARCH ?= "arm"
endif

TF_PRESENT := $(shell command -v terraform 2> /dev/null)
TERRAFORM_CURRENT_VERSION := $(shell terraform version | head -n1 | sed 's/Terraform v//g')

TFENV_PRESENT := $(shell command -v tfenv 2> /dev/null)
TFENV_DIR ?= ~/.tfenv

###########
# Required
###########

terraform-required:
ifndef TF_PRESENT
	$(error "Terraform is not installed")
endif
ifneq (${TERRAFORM_CURRENT_VERSION},${TERRAFORM_VERSION})
	$(error "Current Terraform version is ${TERRAFORM_CURRENT_VERSION} but want ${TERRAFORM_VERSION})
endif

tfenv-required:
ifndef TFENV_PRESENT
	$(error "tfenv is not installed")
endif

###########
# Install
###########

install: install-tfenv install-terraform

install-tfenv:
	@if [ ! -d ${TFENV_DIR} ]; then \
		(git clone https://github.com/kamatama41/tfenv.git ${TFENV_DIR});\
	fi
	@(cd ${TFENV_DIR && git pull})
	sudo ln -fis ~/.tfenv/bin/* /usr/local/bin #TODO: should we just fail instead of -fi?

install-terraform: tfenv-required
	@tfenv install ${TERRAFORM_VERSION}
	@tfenv use ${TERRAFORM_VERSION}