#!/usr/bin/env ruby

require "aws-sdk"

Aws.config.update(
  endpoint: ENV["DANBOORU_AWS_SQS_HOST"],
  region: ENV["DANBOORU_AWS_SQS_REGION"],
  credentials: Aws::Credentials.new(
    ENV["DANBOORU_AWS_ACCESS_KEY_ID"],
    ENV["DANBOORU_AWS_SECRET_ACCESS_KEY"]
  )
)

SQS = Aws::SQS::Client.new
queue = SQS.create_queue({
  queue_name: "danbooru.fifo",
  attributes: {
    "FifoQueue" => "true",
     "ContentBasedDeduplication" => "true"
  }
})


puts "Queue created at #{queue.queue_url}"
