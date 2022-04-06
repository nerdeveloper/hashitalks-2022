SHELL      = /usr/bin/env bash


.PHONY: run
include .env
run:
	atlantis server --atlantis-url=${URL}  --gh-user=${USERNAME} --gh-token=${TOKEN} --gh-webhook-secret=${SECRET} --repo-allowlist=${REPO_ALLOWLIST}
