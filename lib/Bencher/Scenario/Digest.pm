package Bencher::Scenario::Digest;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

$main::data1M = join("", map {chr(256*rand)} 1..(1024*1024));

our $scenario = {
    summary => 'Benchmark various digest algorithms',
    participants => [
        {
            name   => 'md5',
            module => 'Digest::MD5',
            code_template => 'my $ctx = Digest::MD5->new; $ctx->add($main::data1M) for 1..<size>; $ctx->hexdigest',
        },
        {
            name   => 'sha1',
            module => 'Digest::SHA',
            code_template => 'my $ctx = Digest::SHA->new(1); $ctx->add($main::data1M) for 1..<size>; $ctx->hexdigest',
        },
        {
            name   => 'sha256',
            module => 'Digest::SHA',
            code_template => 'my $ctx = Digest::SHA->new(256); $ctx->add($main::data1M) for 1..<size>; $ctx->hexdigest',
        },
        {
            name   => 'sha512',
            module => 'Digest::SHA',
            code_template => 'my $ctx = Digest::SHA->new(512); $ctx->add($main::data1M) for 1..<size>; $ctx->hexdigest',
        },
    ],
    precision => 6,

    datasets => [
        {name=>'10M', args=>{size=>10}},
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES
