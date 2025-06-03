# Danbooru Archives Service

This repository contains the code for the Danbooru archives service.

The service takes post/pool versions from a SQS query hosted on AWS (which the main danbooru instance writes to) and inserts them into the production database, which lives in a different machine from the main prod database for historical reasons.

A docker image is available at `ghcr.io/danbooru/archives:latest`. See the `.env.example` file for a list of required environment variables.

The main danbooru repository ships with docker compose files that automatically setup this service with a SQS mock using https://github.com/softwaremill/elasticmq. If you're just trying to get a local installation of danbooru working, you shouldn't need to configure anything manually.
