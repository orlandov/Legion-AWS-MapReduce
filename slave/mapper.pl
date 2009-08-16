#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/slave-lib/lib/perl5";
use local::lib "$FindBin::Bin/slave-lib";

use Amazon::S3;

use JSON;
use YAML;

my $s3;
my $source;

sub s3_init {
    my $aws_conf = YAML::LoadFile('aws.yaml');

    return if $s3;

    $s3 = Amazon::S3->new(
        $aws_conf->{hadoop_ec2}
    );
}

sub source_init {
    s3_init;
    $bucket = $s3->bucket("source-legion-2wycked-net");
    $bucket->get_key_filename($source, 'GET', $source);
}

while (<>) {
    # read json
    my $task = from_json($_);

    # read source file from s3 or cache
    # cache source file
    source_init;

    # run blender
    warn "Running blender";

    # push rendered frame to s3
}
