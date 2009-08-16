#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/slave-lib";

use Amazon::S3;


use JSON;
while (<>) {
    my $task = from_json($_);
    # read json
    # check if blender cached
    # fetch blender from s3 or cache
    # cache blender
    # read source file from s3 or cache
    # cache source file
    # run blender
    # push rendered frame to s3
}
