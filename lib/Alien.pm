
package Alien;
use strict;

use vars qw($VERSION);
$VERSION = 0.9;

=head1 NAME

Alien - External libraries wrapped up for your viewing pleasure!

=head1 SYNOPSIS

    perldoc Alien;

=head1 DESCRIPTION

Alien is a package that exists just to hold together an idea, the idea
of Alien:: packages, so there is no code here, just motivation for Alien.

=head2 Why

So me and James ended up doing a build system for Fotango, lots of people have done a build system, it is a pretty boring task. The boring task is really all the mindlessly stupid things you need to do to build C libraries that perl modules require, these C modules usually have unusual installation systems or require vastly different options. So CPAN modules install easy, 3rd party stuff is nasty.

So, suddenly an idea struck me, Alien packages! Imagine a CPAN module that has as it's only task to make sure a certain library is installed! That means that you can write all the voodoo in your Build.PL file and then just make sure the module requires the correct Alien module! Then anything that install perl modules will deal with it automatically!

=head2 How

So, what should an Alien module do? It should make sure that the target is installed and it should provide the caller with enough information to use it.

The idea is that you use it to make sure it is there, and you call class methods to find out what to use. These class methods will be individually specified by the stand alone Alien modules.

=head2 No Framework!

The reason this is so loosely worded is because we have no idea what common functionality will be needed, so we will let evolution work for us and see what individual Alien packages need and then eventually factor it out into this packages. I would like to avoid a topdown design approach.

=head2 Responsibilities of a Alien module.

On installation, make sure the required package is there, otherwise install it.

On usage, make sure the required package is there, else croak.

Bundle the source with the module, or download it.

Allow module authors to access information it gathers.

Document itself well.

Preferably use Module::Build.

Be sane.

=head1 BUGS

Might be spelling errors, please report them bug-Alien@rt.cpan.org.

=head1 SUPPORT

No support needed.

=head1 AUTHOR

	Arthur Bergman
	abergman@fotango.com

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

perl(1).

=cut

1;
__END__

