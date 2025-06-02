#!/bin/sh

# A script to init a SQS mock queue using elasticmq, and start the service after.

set -x

bundle exec ruby scripts/create_elasticmq_queue.rb

sleep 1

bundle exec ruby services/sqs_processor.rb
