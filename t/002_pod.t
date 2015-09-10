# -*- perl -*-

use Test::More;
BEGIN { plan skip_all => 'Test requires Test::Pod' unless eval q{ use Test::Pod; 1 } }
plan skip_all => 'author test' unless $ENV{AUTHOR_TESTING};
plan tests => 1;

pod_file_ok('lib/Alien.pm');
